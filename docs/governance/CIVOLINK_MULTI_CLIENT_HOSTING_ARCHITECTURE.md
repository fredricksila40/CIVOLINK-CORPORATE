# CIVOLINK Multi-Client Hosting Architecture

- **Task:** U-004
- **Date:** 2026-11-12
- **Status:** U-004 — DOCUMENTATION AND ARCHITECTURE ONLY — NO IMPLEMENTATION
- **Scope:** How CIVOLINK hosts and manages customer-hosted websites, with per-hosting-type integration methods for the Website Lifecycle Status & Visibility Manager.

---

## 1. Purpose

Define the architecture for hosting and managing multiple customer websites under the CIVOLINK hosting business, with documented integration methods and limitations for each supported hosting technology.

---

## 2. Hosting model overview

### 2.1 Supported hosting types

| # | Hosting type | Description | Typical use case |
|---|---|---|---|
| 1 | **Static websites** | HTML/CSS/JS files served directly | Brochure sites, landing pages, documentation |
| 2 | **WordPress websites** | PHP-based CMS on Apache/Nginx | Blogs, business sites, e-commerce (WooCommerce) |
| 3 | **Custom PHP websites** | Hand-coded PHP applications | Custom web apps, legacy systems, APIs |
| 4 | **Custom web applications** | Any language/framework (Node, Python, Go, etc.) | Full-stack apps, SPAs, microservices |

### 2.2 Hosting infrastructure

```
┌─────────────────────────────────────────────────────────────┐
│                    CIVOLINK Hosting Infrastructure           │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              Web Server / Reverse Proxy              │   │
│  │              (Nginx / Apache / Caddy)                │   │
│  └───────────────────────────┬─────────────────────────┘   │
│                              │                               │
│  ┌───────────────────────────┴─────────────────────────┐   │
│  │              Virtual Hosts / Server Blocks            │   │
│  │                                                       │   │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐ │   │
│  │  │ client1  │ │ client2  │ │ client3  │ │ client4  │ │   │
│  │  │ .com     │ │ .co.ke   │ │ .org     │ │ .net     │ │   │
│  │  │ static   │ │ wordpress│ │ custom   │ │ custom   │ │   │
│  │  └──────────┘ └──────────┘ └──────────┘ └──────────┘ │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              File System / Container Isolation        │   │
│  │                                                       │   │
│  │  /var/www/client1/    /var/www/client2/               │   │
│  │  /var/www/client3/    /var/www/client4/               │   │
│  │                                                       │   │
│  │  Each client has isolated directory, database,        │   │
│  │  and configuration. No cross-client access.           │   │
│  └─────────────────────────────────────────────────────┘   │
│                                                             │
│  ┌─────────────────────────────────────────────────────┐   │
│  │              SSL/TLS (per-domain certificates)        │   │
│  │              Let's Encrypt / commercial certs         │   │
│  └─────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────┘
```

### 2.3 Isolation requirements

| Isolation level | Requirement |
|---|---|
| **Filesystem** | Each client's files in a separate directory; no read/write across clients |
| **Database** | Separate database per client (or separate schema); no cross-client queries |
| **Process** | PHP-FPM pools or container isolation per client where applicable |
| **Network** | Virtual hosts restrict access to correct document root |
| **SSL** | Per-domain certificates; no wildcard that exposes other clients |
| **Credentials** | Each client has separate SFTP/SSH credentials; no shared accounts |

---

## 3. Integration methods by hosting type

### 3.1 Static websites

**Status-control method:** File-based status metadata or separate status HTML file; CDN/edge configuration.

**How it works:**
1. Control Center uploads a status file (e.g., `_status.json` or `status.html`) to the client's document root via SFTP/SCP
2. The website template checks for the status file on each request
3. If present, the template renders the appropriate notice
4. CDN cache must be purged or bypassed after status change

**Runtime changes:** Partial — file upload requires SFTP/SCP access, not a runtime config toggle.

**Deployment required:** Yes for file-based approach. CDN purge required if content is cached.

**CDN/cache implications:**
- CDN cache must be purged after each status change
- Browser cache may delay visibility (set appropriate Cache-Control headers)
- Status file should have `Cache-Control: no-cache` to ensure freshness

**Recovery method:** Remove status file or restore normal index.html.

**Security limitations:**
- Status file must not leak internal paths or server information
- SFTP/SCP credentials must be per-client, not shared
- Status file must be in the correct document root (not accessible via other paths)

**Example status file (`_status.json`):**
```json
{
  "presentation_status": "under_development",
  "message": "We are currently updating our website. Please check back soon.",
  "expected_completion": "2026-12-01",
  "updated_at": "2026-11-12T10:00:00Z",
  "updated_by": "staff_id"
}
```

### 3.2 WordPress websites

**Status-control method:** Plugin-based status manager; theme template override.

**How it works:**
1. Control Center calls WordPress REST API or plugin endpoint
2. Plugin stores status in WordPress options table or custom table
3. Plugin hooks into `template_redirect` or `wp_head` to inject status notice
4. Page cache plugins must be purged after status change

**Runtime changes:** Yes — WordPress reads options at runtime; no file deployment needed.

**Deployment required:** No.

**CDN/cache implications:**
- Page cache plugins (W3 Total Cache, WP Super Cache, etc.) must be purged
- CDN (Cloudflare, etc.) must be purged if caching HTML
- Object cache (Redis/Memcached) must be flushed if status is cached

**Recovery method:** Deactivate plugin or reset WordPress option.

**Security limitations:**
- Plugin must not introduce vulnerabilities (review before installation)
- Plugin must not conflict with security plugins (Wordfence, Sucuri, etc.)
- REST API endpoint must be authenticated; must not allow unauthenticated status changes
- Plugin must not bypass WordPress authentication

**Recommended approach:** Use an established plugin (e.g., "SeedProd Coming Soon," "Maintenance," or a custom lightweight plugin) rather than building from scratch.

**Per-page status:** Supported via WordPress page/post metadata or plugin settings.

### 3.3 Custom PHP websites

**Status-control method:** Configuration file flag or DB-driven status; middleware intercept.

**How it works:**
1. Control Center updates a config file (e.g., `config/status.php`) via SFTP/SCP, or calls an admin endpoint
2. Application middleware checks the config on each request
3. If status is active, middleware renders the appropriate notice before normal output

**Runtime changes:**
- Yes if config is read at runtime (e.g., `include 'config/status.php'` on each request)
- No if config is cached at startup (e.g., OPcache caches the config file)

**Deployment required:** Depends on config mechanism. If config is read at runtime: no deployment. If config is cached: cache invalidation required.

**CDN/cache implications:**
- Page cache must be invalidated (if using Varnish, Nginx fastcgi_cache, etc.)
- OPcache must be cleared if config is cached
- CDN must be purged if caching HTML

**Recovery method:** Restore config or remove middleware.

**Security limitations:**
- Config file must not be web-accessible (place outside document root or deny via .htaccess/Nginx)
- Middleware must not bypass authentication for protected routes
- Admin endpoint (if used) must be authenticated and rate-limited
- Config must not expose server paths or internal information

**Example config (`config/status.php`):**
```php
<?php
return [
    'presentation_status' => 'under_development',
    'message' => 'We are currently updating our website.',
    'expected_completion' => '2026-12-01',
    'updated_at' => '2026-11-12 10:00:00',
];
```

**Example middleware:**
```php
<?php
// In application bootstrap or front controller
$statusConfig = require __DIR__ . '/../config/status.php';
if ($statusConfig['presentation_status'] !== 'normal_live') {
    // Render status notice and exit (or continue based on policy)
    renderStatusPage($statusConfig);
    exit;
}
```

**Per-page status:** Supported via route-level or page-level checks.

### 3.4 Custom web applications

**Status-control method:** Status endpoint or feature flag system.

**How it works:**
1. Control Center calls the application's status endpoint or feature flag API
2. Application stores status in its own database or feature flag store
3. Application middleware or route handler checks status before rendering

**Runtime changes:**
- Yes if feature flag system exists (e.g., LaunchDarkly, Unleash, custom flags)
- No if status is compiled into the application binary/image

**Deployment required:** Depends on architecture. If feature flag system: no deployment. If compiled: redeployment required.

**CDN/cache implications:**
- Application-level cache must be cleared
- CDN must be purged if caching HTML
- Client-side cache (browser, service worker) may delay visibility

**Recovery method:** Feature flag toggle or config reload.

**Security limitations:**
- Status endpoint must be authenticated; must not allow unauthenticated status changes
- Status must not expose internal application state (debug info, stack traces, etc.)
- Feature flag system must not allow privilege escalation
- Status changes must be audited

**Example status endpoint:**
```
POST /admin/status
Authorization: Bearer <token>
Content-Type: application/json

{
  "presentation_status": "under_development",
  "message": "We are currently updating our website.",
  "expected_completion": "2026-12-01"
}
```

**Per-page status:** Supported via route-level or middleware checks.

---

## 4. Universal vs. platform-specific features

### 4.1 Universal features (all hosting types)

| Feature | Description |
|---|---|
| Technical availability monitoring | HTTP probe to detect Online/Offline/Server Error |
| Public presentation status selection | Staff selects from 6 states |
| Audit logging | All status changes recorded |
| Role-based permissions | View/Edit/Preview/Publish/Schedule/Override |
| Visitor-facing message validation | Sanitization, escaping, length limits |
| Status change history | Full history of who changed what, when |

### 4.2 Platform-specific features

| Feature | Static | WordPress | PHP | Custom App |
|---|---|---|---|---|
| Runtime status change | Partial (file upload) | Yes (config/DB) | Depends on config | Depends on architecture |
| Deployment required for status change | Yes (file-based) | No | Depends | Depends |
| Per-page status application | No (site-wide only) | Yes (plugin) | Yes (middleware) | Yes (route-level) |
| Banner placement customization | Limited (template) | Yes (plugin settings) | Yes (template) | Yes (UI) |
| CDN purge automation | Manual | Manual/plugin | Manual | Manual |
| Maintenance access route | No | Yes (plugin) | Yes (middleware) | Yes (route) |
| Coming Soon landing page | Yes (separate HTML) | Yes (plugin) | Yes (template) | Yes (route) |
| Private/Unpublished access control | Limited (.htaccess) | Yes (plugin) | Yes (middleware) | Yes (auth layer) |
| Expected completion date display | Yes (status file) | Yes (plugin) | Yes (config) | Yes (UI) |
| Banner appearance options | Limited (template) | Yes (plugin settings) | Yes (template) | Yes (UI) |

### 4.3 Documented limitations

| Hosting type | Key limitation |
|---|---|
| Static websites | Status changes require file upload + CDN purge; no per-page status; limited banner customization |
| WordPress websites | Plugin dependency; must not conflict with security/cache plugins; REST API must be authenticated |
| Custom PHP websites | Config mechanism determines runtime capability; OPcache may cache config; config must not be web-accessible |
| Custom web applications | Architecture-dependent; feature flag system required for runtime changes; status endpoint must be authenticated |

---

## 5. Cache and CDN strategy

### 5.1 Cache layers

| Cache layer | Invalidated by | Notes |
|---|---|---|
| Browser cache | Cache-Control headers | Status files/pages should have `Cache-Control: no-cache` |
| CDN cache | CDN purge API or bypass | Manual purge for v1; automation in future phase |
| Page cache (WordPress) | Plugin purge (WP Super Cache, etc.) | Must be purged after status change |
| Page cache (Nginx) | `fastcgi_cache_purge` or restart | Must be purged after status change |
| OPcache (PHP) | `opcache_reset()` or restart | Must be cleared if config is cached |
| Object cache (Redis/Memcached) | Flush command | Must be flushed if status is cached |

### 5.2 CDN purge instructions (manual for v1)

**Cloudflare:**
1. Log in to Cloudflare dashboard
2. Select the domain
3. Go to Caching → Configuration
4. Click "Purge Everything" or "Purge Custom Purge" (specific URLs)

**Other CDNs:** Refer to provider documentation.

**Automation (future phase):** Integrate with CDN API for automatic purge on status change.

---

## 6. SSL/TLS management

| Hosting type | Certificate method | Renewal |
|---|---|---|
| Static websites | Let's Encrypt (certbot) or commercial | Automatic (certbot) or manual |
| WordPress websites | Let's Encrypt (certbot) or commercial | Automatic (certbot) or manual |
| Custom PHP websites | Let's Encrypt (certbot) or commercial | Automatic (certbot) or manual |
| Custom web applications | Let's Encrypt (certbot) or commercial | Automatic (certbot) or manual |

**Per-domain certificates:** Each client domain gets its own certificate. No wildcard certificates that expose other clients.

**Certificate renewal monitoring:** Monitor expiry dates; alert 30 days before expiry.

---

## 7. Backup and recovery

### 7.1 Backup scope

| Data | Backup frequency | Retention |
|---|---|---|
| Client websites (files) | Daily | 30 days |
| Client databases | Daily | 30 days |
| Control Center database | Daily | 90 days |
| Audit logs | Daily (included in Control Center DB) | 12 months minimum |
| SSL certificates | On renewal | Current + previous |

### 7.2 Recovery procedures

| Scenario | Recovery method |
|---|---|
| Status change gone wrong | Restore previous status via Control Center or remove status file |
| Website compromised | Restore from backup; rotate credentials |
| Database corruption | Restore from backup; verify integrity |
| SSL certificate expired | Re-issue certificate; verify renewal automation |

---

## 8. Monitoring and alerting

### 8.1 Technical availability monitoring

| Check | Frequency | Alert threshold |
|---|---|---|
| HTTP 200 response | Every 5 minutes | 2 consecutive failures |
| DNS resolution | Every 10 minutes | 2 consecutive failures |
| SSL certificate expiry | Daily | 30 days before expiry |
| Disk space | Daily | 90% usage |
| Server load | Every 5 minutes | Sustained high load |

### 8.2 Alert channels

| Alert type | Channel |
|---|---|
| Website offline | Email to CIVOLINK staff |
| SSL expiring | Email to CIVOLINK staff |
| Status change failure | Email to CIVOLINK staff |
| Audit log anomaly | Email to CIVOLINK staff |

---

*End of multi-client hosting architecture.*
