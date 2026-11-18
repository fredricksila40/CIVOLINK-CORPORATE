/* ============================================================
   CIVOLINK corporate website prototype — shared JavaScript
   U-003.0 · docs/umbrella-prototype/
   Local-only behaviour: mobile navigation, copyright year,
   contact-form prototype validation. No network requests,
   no storage, no cookies, no analytics, no external services.
   ============================================================ */
(function () {
  "use strict";

  /* ---------- mobile navigation ---------- */
  var toggle = document.querySelector("[data-nav-toggle]");
  var nav = document.getElementById("primary-nav");
  if (toggle && nav) {
    toggle.addEventListener("click", function () {
      var open = toggle.getAttribute("aria-expanded") === "true";
      toggle.setAttribute("aria-expanded", String(!open));
      nav.classList.toggle("is-open", !open);
    });
    // close on Escape
    document.addEventListener("keydown", function (e) {
      if (e.key === "Escape" && toggle.getAttribute("aria-expanded") === "true") {
        toggle.setAttribute("aria-expanded", "false");
        nav.classList.remove("is-open");
        toggle.focus();
      }
    });
    // close when a nav link is chosen (mobile)
    nav.addEventListener("click", function (e) {
      if (e.target.closest("a")) {
        toggle.setAttribute("aria-expanded", "false");
        nav.classList.remove("is-open");
      }
    });
  }

  /* ---------- copyright year ---------- */
  document.querySelectorAll("[data-year]").forEach(function (el) {
    el.textContent = String(new Date().getFullYear());
  });

  /* ---------- contact form: local prototype validation only ----------
     The form NEVER transmits data. submit is always prevented;
     a local confirmation is shown instead. Nothing is stored. */
  var form = document.querySelector("[data-prototype-form]");
  if (form) {
    var status = form.querySelector("[data-form-status]");

    /* build status content with DOM nodes only (no innerHTML) */
    function setStatus(el, strongText, restText) {
      while (el.firstChild) el.removeChild(el.firstChild);
      var strong = document.createElement("strong");
      strong.textContent = strongText;
      el.appendChild(strong);
      el.appendChild(document.createTextNode(restText));
    }

    function setError(field, on) {
      var wrap = field.closest(".field");
      if (wrap) wrap.classList.toggle("has-error", on);
      field.setAttribute("aria-invalid", on ? "true" : "false");
    }

    function validateField(field) {
      var v = (field.value || "").trim();
      var ok = true;
      if (field.hasAttribute("required") && !v) ok = false;
      if (ok && field.type === "email" && v) {
        ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(v);
      }
      if (ok && field.tagName === "TEXTAREA" && field.hasAttribute("required") && v.length < 10) {
        ok = false;
      }
      setError(field, !ok);
      return ok;
    }

    form.querySelectorAll("input, select, textarea").forEach(function (field) {
      field.addEventListener("blur", function () {
        if (field.value.trim() || field.closest(".field").classList.contains("has-error")) {
          validateField(field);
        }
      });
      field.addEventListener("input", function () {
        if (field.closest(".field").classList.contains("has-error")) validateField(field);
      });
    });

    form.addEventListener("submit", function (e) {
      e.preventDefault(); // hard stop: nothing is ever sent
      var valid = true;
      form.querySelectorAll("[required]").forEach(function (field) {
        if (!validateField(field)) valid = false;
      });
      if (!valid) {
        var firstBad = form.querySelector(".field.has-error input, .field.has-error select, .field.has-error textarea");
        if (firstBad) firstBad.focus();
        if (status) {
          status.classList.add("is-visible");
          setStatus(status, "Please check the highlighted fields.",
            " Nothing has been sent — this is a local prototype check only.");
        }
        return;
      }
      if (status) {
        status.classList.add("is-visible");
        setStatus(status,
          "Prototype only — this message was not sent anywhere.",
          " The CIVOLINK corporate website prototype does not transmit, store or forward form data." +
          " In production, a message would be processed on the server only after a privacy policy" +
          " and terms of use are published and the form's data handling is approved (D19)." +
          " Your entries remain only in this browser tab and disappear when you reload the page.");
        status.focus && status.focus();
      }
      // deliberately NOT resetting the form: the owner should see their entries
      // remain local; reloading the page clears everything (no storage).
    });
  }
})();
