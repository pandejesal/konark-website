/* ============================================================
   KONARK PROCESS INSTRUMENTS — scripts.js
   Vanilla JS: mobile nav, sticky header shadow, footer year,
   form success banner. No dependencies.
   ============================================================ */

(function () {
  'use strict';

  /* 1. Mobile navigation toggle */
  var hamburger = document.querySelector('.hamburger');
  var navMobile = document.querySelector('.nav-mobile');
  if (hamburger && navMobile) {
    hamburger.addEventListener('click', function () {
      var open = navMobile.classList.toggle('open');
      hamburger.setAttribute('aria-expanded', open ? 'true' : 'false');
    });
    /* Close the panel when a link inside it is tapped */
    navMobile.addEventListener('click', function (e) {
      if (e.target.tagName === 'A') {
        navMobile.classList.remove('open');
        hamburger.setAttribute('aria-expanded', 'false');
      }
    });
  }

  /* 2. Sticky header shadow once scrolled */
  var header = document.querySelector('.header');
  if (header) {
    var onScroll = function () {
      if (window.scrollY > 4) {
        header.style.boxShadow = '0 6px 18px rgba(15, 28, 41, 0.35)';
      } else {
        header.style.boxShadow = 'none';
      }
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll();
  }

  /* 3. Footer year */
  var yearEls = document.querySelectorAll('[data-year]');
  var year = new Date().getFullYear();
  yearEls.forEach(function (el) { el.textContent = year; });

  /* 4. Contact form success banner (triggered by ?sent=1 redirect) */
  var params = new URLSearchParams(window.location.search);
  if (params.get('sent') === '1') {
    var banner = document.querySelector('.success-banner');
    if (banner) banner.classList.add('visible');
    /* Clean the URL so a refresh does not reshow it */
    history.replaceState(null, '', window.location.pathname);
  }
})();
