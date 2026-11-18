/* =========================================================================
   CIVOLINK — Umbrella Platform HTML Reference Suite
   Shared behaviour (minimal vanilla JS, no dependencies, no network calls).

   STATUS: REFERENCE SAMPLE ONLY. Nothing here talks to a backend, an API,
   an analytics service or an external host. Demo forms never submit.
   ========================================================================= */
(function () {
  "use strict";

  var reduceMotion = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  /* ---------------------------------------------------- mobile navigation */
  function initNav() {
    var toggle = document.querySelector("[data-nav-toggle]");
    var nav = document.getElementById("primary-nav");
    if (!toggle || !nav) return;

    function setOpen(open) {
      toggle.setAttribute("aria-expanded", open ? "true" : "false");
      nav.classList.toggle("is-open", open);
      toggle.querySelector("[data-nav-label]").textContent = open ? "Close" : "Menu";
    }

    toggle.addEventListener("click", function () {
      setOpen(toggle.getAttribute("aria-expanded") !== "true");
    });

    nav.addEventListener("click", function (event) {
      if (event.target.closest("a")) setOpen(false);
    });

    document.addEventListener("keydown", function (event) {
      if (event.key === "Escape" && toggle.getAttribute("aria-expanded") === "true") {
        setOpen(false);
        toggle.focus();
      }
    });

    document.addEventListener("click", function (event) {
      if (
        toggle.getAttribute("aria-expanded") === "true" &&
        !event.target.closest("#primary-nav") &&
        !event.target.closest("[data-nav-toggle]")
      ) {
        setOpen(false);
      }
    });

    window.addEventListener("resize", function () {
      if (window.innerWidth > 920) setOpen(false);
    });
  }

  /* -------------------------------------------- active navigation marking */
  function initActiveNav() {
    var here = (window.location.pathname.split("/").pop() || "index.html").toLowerCase();
    if (here === "") here = "index.html";

    document.querySelectorAll("[data-nav-link]").forEach(function (link) {
      var target = (link.getAttribute("href") || "").split("#")[0].toLowerCase();
      if (target === here) {
        link.setAttribute("aria-current", "page");
      } else {
        link.removeAttribute("aria-current");
      }
    });
  }

  /* --------------------------------------------------------- demo actions */
  function initDemoActions() {
    document.querySelectorAll("[data-demo-action]").forEach(function (el) {
      el.addEventListener("click", function (event) {
        var target = document.getElementById("demo-feedback");
        var message =
          el.getAttribute("data-demo-message") ||
          "Reference sample — this control is a design placeholder and is not connected to any service.";
        if (target) {
          event.preventDefault();
          target.textContent = message;
          target.classList.add("is-visible");
          target.setAttribute("role", "status");
          target.focus({ preventScroll: false });
        }
        /* No navigation, no network request, no simulated success. */
      });
    });
  }

  /* ------------------------------------------------------------ demo form */
  function initDemoForms() {
    document.querySelectorAll("[data-demo-form]").forEach(function (form) {
      form.addEventListener("submit", function (event) {
        event.preventDefault();

        if (!form.checkValidity()) {
          form.reportValidity();
          return;
        }

        var status = form.querySelector("[data-form-status]");
        if (status) {
          status.textContent =
            "Static demonstration only — this form has no backend. Your details were " +
            "validated in the browser and were NOT sent anywhere. To reach CIVOLINK, " +
            "use a confirmed contact channel once it is published by the owner.";
          status.classList.add("is-visible");
          status.setAttribute("role", "status");
          status.setAttribute("tabindex", "-1");
          status.focus({ preventScroll: false });
        }
        form.reset();
      });
    });
  }

  /* ------------------------------------------------- in-page anchor focus */
  function initAnchorFocus() {
    document.querySelectorAll('a[href^="#"]').forEach(function (link) {
      link.addEventListener("click", function () {
        var id = link.getAttribute("href").slice(1);
        if (!id) return;
        var target = document.getElementById(id);
        if (target) {
          window.setTimeout(function () {
            target.setAttribute("tabindex", "-1");
            target.focus({ preventScroll: true });
          }, reduceMotion ? 0 : 350);
        }
      });
    });
  }

  /* ------------------------------------------------------------- footer year */
  function initYear() {
    document.querySelectorAll("[data-year]").forEach(function (node) {
      node.textContent = String(new Date().getFullYear());
    });
  }

  function init() {
    initNav();
    initActiveNav();
    initDemoActions();
    initDemoForms();
    initAnchorFocus();
    initYear();
  }

  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", init);
  } else {
    init();
  }
})();
