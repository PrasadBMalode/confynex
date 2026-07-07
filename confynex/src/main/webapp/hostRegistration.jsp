<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Host Registration | Confynex</title>

<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<!-- Google Font for logo -->
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,700;1,700&display=swap" rel="stylesheet">

<style>
  :root {
    --gold: #d4af37;
    --gold-dark: #b8912c;
    --bg-dark: #14161c;
    --bg-panel: #1b1e27;
    --bg-field: #22252f;
    --border-soft: rgba(255,255,255,.08);
  }

  body {
    background: linear-gradient(160deg, #0f1116 0%, #181b24 55%, #14161c 100%);
    color: #f1f1f1;
    font-family: "Segoe UI", Arial, sans-serif;
    min-height: 100vh;
  }

  /* ── BACKGROUND PHOTO LAYER ───────────────────── */
  .bg-photo-wrapper {
    position: fixed;
    inset: 0;
    z-index: -1;
    overflow: hidden;
    background-color: var(--bg-dark);
  }

  .bg-photo {
    position: absolute;
    inset: -20px; /* extra bleed so the zoom never reveals an edge */
    background-image:
      linear-gradient(160deg, rgba(15,17,22,0.92) 0%, rgba(20,22,28,0.85) 45%, rgba(15,17,22,0.94) 100%),
      url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=1920&q=80');
    background-size: cover;
    background-position: center;
    filter: saturate(0.9) brightness(0.8);
    animation: kenburns 32s ease-in-out infinite alternate;
  }

  @keyframes kenburns {
    0%   { transform: scale(1) translate(0, 0); }
    100% { transform: scale(1.12) translate(-1.5%, -1%); }
  }

  /* ── ENTRANCE ANIMATIONS ──────────────────────── */
  @keyframes fadeSlideUp {
    0%   { opacity: 0; transform: translateY(28px); }
    100% { opacity: 1; transform: translateY(0); }
  }

  @keyframes fadeSlideRight {
    0%   { opacity: 0; transform: translateX(-24px); }
    100% { opacity: 1; transform: translateX(0); }
  }

  @keyframes shimmer {
    0%   { background-position: 0% 0; }
    100% { background-position: -200% 0; }
  }

  .navbar-custom {
    animation: fadeSlideUp .6s ease both;
  }

  .hero-side {
    animation: fadeSlideRight .8s ease .1s both;
  }

  .hero-side h1,
  .hero-side > p {
    animation: fadeSlideUp .7s ease .15s both;
  }

  .feature-item {
    animation: fadeSlideUp .6s ease both;
  }
  .feature-item:nth-of-type(1) { animation-delay: .25s; }
  .feature-item:nth-of-type(2) { animation-delay: .35s; }
  .feature-item:nth-of-type(3) { animation-delay: .45s; }

  .stat-box {
    animation: fadeSlideUp .6s ease both;
  }
  .row.g-3.mt-3 .col-4:nth-child(1) .stat-box { animation-delay: .5s; }
  .row.g-3.mt-3 .col-4:nth-child(2) .stat-box { animation-delay: .58s; }
  .row.g-3.mt-3 .col-4:nth-child(3) .stat-box { animation-delay: .66s; }

  .form-panel {
    animation: fadeSlideUp .8s ease .2s both;
    transition: box-shadow .35s ease;
  }

  .form-panel:hover {
    box-shadow: 0 24px 60px rgba(0,0,0,.45), 0 0 60px rgba(212,175,55,.06);
  }

  @media (prefers-reduced-motion: reduce) {
    .bg-photo,
    .navbar-custom,
    .hero-side,
    .hero-side h1,
    .hero-side > p,
    .feature-item,
    .stat-box,
    .form-panel {
      animation: none !important;
    }
  }

  .navbar-brand span {
    color: var(--gold);
  }

  .navbar-custom {
    background-color: rgba(10, 13, 22, 0.92);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid var(--border-soft);
    padding-top: 1rem;
    padding-bottom: 1rem;
  }

  .navbar-brand {
        font-family: 'Playfair Display', serif;
        font-size: 1.65rem;
        font-weight: 900;
        color: var(--gold) !important;
        letter-spacing: .04em;
      }

      .navbar-brand span {
            color: #fff;
          }

  .brand-logo .brand-gold {
    color: var(--gold);
  }

  .brand-logo .brand-white {
    color: #fff;
  }

  .nav-links {
    display: flex;
    gap: 2.2rem;
    list-style: none;
    margin: 0;
    padding: 0;
  }

  .nav-links a {
    color: rgba(255,255,255,.85);
    text-decoration: none;
    font-size: .82rem;
    font-weight: 600;
    letter-spacing: .6px;
    text-transform: uppercase;
    transition: color .2s ease;
  }

  .nav-links a:hover {
    color: var(--gold);
  }

  .btn-home-pill {
    background-color: var(--gold);
    color: #14161c;
    border: none;
    border-radius: 30px;
    padding: .55rem 1.5rem;
    font-weight: 700;
    font-size: .82rem;
    letter-spacing: .5px;
    text-decoration: none;
    display: inline-flex;
    align-items: center;
    gap: .45rem;
    transition: background-color .2s ease, transform .15s ease;
  }

  .btn-home-pill:hover {
    background-color: var(--gold-dark);
    color: #14161c;
    transform: translateY(-1px);
  }

  @media (max-width: 991px) {
    .nav-links {
      display: none;
    }
  }

  .hero-side {
    padding: 3rem 2.5rem;
  }

  .hero-side h1 {
    font-weight: 700;
    line-height: 1.25;
  }

  .hero-side .highlight {
    color: var(--gold);
  }

  .feature-item {
    display: flex;
    align-items: flex-start;
    gap: .9rem;
    margin-bottom: 1.3rem;
  }

  .feature-icon {
    width: 42px;
    height: 42px;
    flex-shrink: 0;
    border-radius: 10px;
    background: rgba(212,175,55,.12);
    border: 1px solid rgba(212,175,55,.35);
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--gold);
    font-size: 1.1rem;
    transition: transform .25s ease, background .25s ease;
  }

  .feature-item:hover .feature-icon {
    transform: translateY(-2px);
    background: rgba(212,175,55,.2);
  }

  .stat-box {
    background: rgba(27, 30, 39, 0.75);
    backdrop-filter: blur(4px);
    border: 1px solid var(--border-soft);
    border-radius: 12px;
    padding: 1rem 1.2rem;
    text-align: center;
    transition: border-color .25s ease, transform .25s ease;
  }

  .stat-box:hover {
    border-color: rgba(212,175,55,.4);
    transform: translateY(-2px);
  }

  .stat-box h3 {
    color: var(--gold);
    font-weight: 700;
    margin-bottom: 0;
  }

  .stat-box small {
    color: rgba(255,255,255,.55);
  }

  .form-panel {
    background: rgba(27, 30, 39, 0.85);
    backdrop-filter: blur(6px);
    border: 1px solid var(--border-soft);
    border-radius: 18px;
    padding: 2.5rem;
    box-shadow: 0 20px 50px rgba(0,0,0,.35);
    position: relative;
    overflow: hidden;
  }

  .form-panel::before {
    content: '';
    position: absolute;
    top: 0; left: 0; right: 0;
    height: 3px;
    background: linear-gradient(90deg, transparent, var(--gold), #f0dc8c, var(--gold), transparent);
    background-size: 200% 100%;
    animation: shimmer 6s linear infinite;
  }

  @media (prefers-reduced-motion: reduce) {
    .form-panel::before { animation: none !important; }
  }

  .form-panel h5 {
    font-weight: 700;
  }

  .form-label {
    color: rgba(255,255,255,.85);
    font-size: .88rem;
    font-weight: 500;
  }

  .form-control,
  .form-select {
    background-color: var(--bg-field);
    border: 1px solid var(--border-soft);
    color: #f1f1f1;
    padding: .65rem .9rem;
    transition: box-shadow .2s ease, border-color .2s ease;
  }

  .form-control::placeholder {
    color: rgba(255,255,255,.35);
  }

  .form-control:focus,
  .form-select:focus {
    background-color: var(--bg-field);
    color: #fff;
    border-color: var(--gold);
    box-shadow: 0 0 0 .2rem rgba(212,175,55,.2);
  }

  .form-control::-webkit-calendar-picker-indicator {
    filter: invert(1);
    cursor: pointer;
  }

  .invalid-feedback {
    font-size: .78rem;
  }

  .btn-gold {
    background-color: var(--gold);
    border-color: var(--gold);
    color: #14161c;
    font-weight: 700;
    letter-spacing: .3px;
    transition: background-color .2s ease, border-color .2s ease, transform .15s ease, box-shadow .2s ease;
  }

  .btn-gold:hover {
    background-color: var(--gold-dark);
    border-color: var(--gold-dark);
    color: #14161c;
    transform: translateY(-1px);
    box-shadow: 0 8px 24px rgba(212,175,55,.25);
  }

  .btn-outline-gold {
    border: 1px solid var(--gold);
    color: var(--gold);
    background-color: transparent;
    font-weight: 600;
  }

  .btn-outline-gold:hover {
    background-color: var(--gold);
    color: #14161c;
  }

  .toggle-password {
    position: absolute;
    top: 50%;
    right: 15px;
    transform: translateY(-50%);
    cursor: pointer;
    color: #ccc;
  }

  .modal-link,
  a.text-gold {
    color: var(--gold);
    text-decoration: none;
    cursor: pointer;
    font-weight: 600;
  }

  .modal-link:hover,
  a.text-gold:hover {
    text-decoration: underline;
  }

  .section-divider {
    border-top: 1px solid var(--border-soft);
    margin: 2rem 0;
  }

  footer {
    color: rgba(255,255,255,.4);
    font-size: .82rem;
    padding: 1.5rem 0;
    border-top: 1px solid var(--border-soft);
  }

  @media (max-width: 991px) {
    .hero-side {
      padding: 2rem 1rem;
    }
  }
</style>
</head>
<body>

  <!-- Background photo layer -->
  <div class="bg-photo-wrapper">
    <div class="bg-photo"></div>
  </div>

  <!-- Navbar -->
  <nav class="navbar-custom sticky-top">
    <div class="container-fluid d-flex align-items-center justify-content-between px-4 px-lg-5">

      <a class="navbar-brand" href="#home">Confy<span>nex</span></a>

      <ul class="nav-links">
        <li><a href="index.jsp#who">Who We Are</a></li>
        <li><a href="index.jsp#what">What We Do</a></li>
        <li><a href="index.jsp#how">How We Do It</a></li>
        <li><a href="index.jsp#our">Our Work</a></li>
        <li><a href="index.jsp#features">Features</a></li>
        <li><a href="index.jsp#contact">Contact Us</a></li>
      </ul>

      <a href="index.jsp" class="btn-home-pill">
        <i class="bi bi-house-fill"></i>Home
      </a>

    </div>
  </nav>

  <div class="container py-5">
    <div class="row align-items-start g-5">

      <!-- Left informational side -->
      <div class="col-lg-5 hero-side">
        <h1 class="mb-3">
          Host Your Conference <span class="highlight">The Right Way</span>
        </h1>
        <p class="text-white-50 mb-4">
          Confynex gives organizers everything needed to plan, promote, and manage
          world-class conferences — from coordinator management to attendee check-in —
          all from a single dashboard.
        </p>

        <div class="feature-item">
          <div class="feature-icon"><i class="bi bi-people-fill"></i></div>
          <div>
            <strong>Coordinator Management</strong>
            <p class="text-white-50 mb-0" style="font-size:.85rem;">
              Upload your coordinators list via Excel and assign roles instantly.
            </p>
          </div>
        </div>

        <div class="feature-item">
          <div class="feature-icon"><i class="bi bi-geo-alt-fill"></i></div>
          <div>
            <strong>Venue &amp; Scheduling Tools</strong>
            <p class="text-white-50 mb-0" style="font-size:.85rem;">
              Set your venue and date once — Confynex handles reminders and logistics.
            </p>
          </div>
        </div>

        <div class="feature-item">
          <div class="feature-icon"><i class="bi bi-shield-lock-fill"></i></div>
          <div>
            <strong>Secure &amp; Verified Accounts</strong>
            <p class="text-white-50 mb-0" style="font-size:.85rem;">
              Every host account is protected with strong password policies and verification.
            </p>
          </div>
        </div>

        <div class="row g-3 mt-3">
          <div class="col-4">
            <div class="stat-box">
              <h3>50+</h3>
              <small>Conferences Managed</small>
            </div>
          </div>
          <div class="col-4">
            <div class="stat-box">
              <h3>12K+</h3>
              <small>Delegate Onboarded</small>
            </div>
          </div>
          <div class="col-4">
            <div class="stat-box">
              <h3>99.9%</h3>
              <small>Clint Satisfaction</small>
            </div>
          </div>
        </div>
      </div>

      <!-- Right registration form -->
      <div class="col-lg-7">
        <div class="form-panel">
          <h5 class="mb-1"><i class="bi bi-person-plus me-2 text-gold"></i>Create Your Host Account</h5>
          <p class="text-white-50 mb-4" style="font-size:.88rem;">
            Join Confynex and start managing world-class conferences.
          </p>

          <form method="post" id="registrationForm" action="registerHost" enctype="multipart/form-data" class="needs-validation" novalidate>

            <div class="row">

              <div class="col-md-6 mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" class="form-control" name="full_name" id="full_name" placeholder="John Smith" />
                <div class="invalid-feedback">Name must contain only letters (minimum 3).</div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Work Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="john@gmail.com" />
                <div class="invalid-feedback">Email must be a valid Gmail address.</div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Phone Number</label>
                <input type="tel" class="form-control" name="phone" id="phone" placeholder="9876543210" />
                <div class="invalid-feedback">Phone must start with 6,7,8,9 and be 10 digits.</div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Company Name</label>
                <input type="text" class="form-control" name="company_name" id="company_name" placeholder="Your company name" />
                <div class="invalid-feedback">Company Name must contain minimum 4 letters.</div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Conference Title</label>
                <input type="text" class="form-control" name="conference_title" id="conference_title" placeholder="Enter conference title" />
                <div class="invalid-feedback">Title must contain only letters (minimum 3).</div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Conference Date</label>
                <input type="date" class="form-control" name="conference_date" id="conference_date" />
                <div class="invalid-feedback">Conference date is required.</div>
              </div>

              <div class="col-12 mb-3">
                <label class="form-label">Venue</label>
                <textarea class="form-control" name="venue" id="venue" rows="2" placeholder="Enter conference venue"></textarea>
                <div class="invalid-feedback">Venue must contain minimum 4 characters.</div>
              </div>

              <div class="col-12 mb-3">
                <label class="form-label">
                  Coordinators List (upload Excel file)
                </label>
                <input type="file" class="form-control" name="excelFile" id="excelFile" accept=".xls,.xlsx" />
                <small class="text-white-50 d-block mt-2">Accepted formats: .xls, .xlsx</small>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Password</label>
                <div class="position-relative">
                  <input type="password" class="form-control pe-5" id="password" name="password" placeholder="Create a strong password" />
                  <i class="bi bi-eye-slash toggle-password" toggle="#password"></i>
                  <div class="invalid-feedback">8-12 chars with uppercase, lowercase, number &amp; special char.</div>
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Confirm Password</label>
                <div class="position-relative">
                  <input type="password" class="form-control pe-5" id="confirmPassword" name="confirm_password" placeholder="Confirm your password" />
                  <i class="bi bi-eye-slash toggle-password" toggle="#confirmPassword"></i>
                  <div class="invalid-feedback">Passwords do not match.</div>
                </div>
              </div>

            </div>

            <div class="form-check mb-3">
              <input class="form-check-input" type="checkbox" id="termsCheck" required>
              <label class="form-check-label text-white-50" for="termsCheck" style="font-size:.85rem;">
                I agree to the <a href="terms.jsp" class="text-gold">Terms of Service</a> and <a href="privacy.jsp" class="text-gold">Privacy Policy</a>.
              </label>
              <div class="invalid-feedback">You must agree before submitting.</div>
            </div>

            <button type="submit" class="btn btn-gold w-100 py-3 mb-3">
              Create Account <i class="bi bi-arrow-right ms-1"></i>
            </button>

            <p class="text-center text-white-50 mb-0" style="font-size:.85rem;">
              Already have an account?
              <a href="hostLogin.jsp" class="modal-link">Sign In</a>
            </p>

          </form>
        </div>
      </div>

    </div>

    <div class="section-divider"></div>

    <div class="row text-center">
      <div class="col-md-4 mb-3">
        <i class="bi bi-clock-history text-gold fs-4"></i>
        <p class="text-white-50 mb-0 mt-2" style="font-size:.85rem;">Quick setup — start hosting in minutes</p>
      </div>
      <div class="col-md-4 mb-3">
        <i class="bi bi-headset text-gold fs-4"></i>
        <p class="text-white-50 mb-0 mt-2" style="font-size:.85rem;">24/7 dedicated host support</p>
      </div>
      <div class="col-md-4 mb-3">
        <i class="bi bi-graph-up-arrow text-gold fs-4"></i>
        <p class="text-white-50 mb-0 mt-2" style="font-size:.85rem;">Real-time analytics for every event</p>
      </div>
    </div>
  </div>

  <footer class="text-center">
    &copy; <%= java.time.Year.now() %> Confynex. All rights reserved.
  </footer>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // Password show/hide toggle
    document.querySelectorAll('.toggle-password').forEach(function (icon) {
      icon.addEventListener('click', function () {
        var target = document.querySelector(icon.getAttribute('toggle'));
        if (target.type === 'password') {
          target.type = 'text';
          icon.classList.remove('bi-eye-slash');
          icon.classList.add('bi-eye');
        } else {
          target.type = 'password';
          icon.classList.remove('bi-eye');
          icon.classList.add('bi-eye-slash');
        }
      });
    });

    // Custom validation rules
    (function () {
      'use strict';

      var form = document.getElementById('registrationForm');

      var nameRegex = /^[A-Za-z ]{3,}$/;
      var gmailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/;
      var phoneRegex = /^[6-9][0-9]{9}$/;
      var companyRegex = /^.{4,}$/;
      var titleRegex = /^[A-Za-z ]{3,}$/;
      var venueRegex = /^.{4,}$/;
      var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,12}$/;

      function setValidity(input, isValid) {
        if (isValid) {
          input.classList.remove('is-invalid');
          input.classList.add('is-valid');
        } else {
          input.classList.remove('is-valid');
          input.classList.add('is-invalid');
        }
      }

      form.addEventListener('submit', function (event) {
        var fullName = document.getElementById('full_name');
        var email = document.getElementById('email');
        var phone = document.getElementById('phone');
        var company = document.getElementById('company_name');
        var title = document.getElementById('conference_title');
        var date = document.getElementById('conference_date');
        var venue = document.getElementById('venue');
        var password = document.getElementById('password');
        var confirmPassword = document.getElementById('confirmPassword');

        var valid = true;

        valid = nameRegex.test(fullName.value.trim()) && (setValidity(fullName, true), true) || (setValidity(fullName, false), false);
        valid = gmailRegex.test(email.value.trim()) ? (setValidity(email, true), valid) : (setValidity(email, false), false);
        valid = phoneRegex.test(phone.value.trim()) ? (setValidity(phone, true), valid) : (setValidity(phone, false), false);
        valid = companyRegex.test(company.value.trim()) ? (setValidity(company, true), valid) : (setValidity(company, false), false);
        valid = titleRegex.test(title.value.trim()) ? (setValidity(title, true), valid) : (setValidity(title, false), false);
        valid = date.value !== '' ? (setValidity(date, true), valid) : (setValidity(date, false), false);
        valid = venueRegex.test(venue.value.trim()) ? (setValidity(venue, true), valid) : (setValidity(venue, false), false);
        valid = passwordRegex.test(password.value) ? (setValidity(password, true), valid) : (setValidity(password, false), false);
        valid = (confirmPassword.value !== '' && confirmPassword.value === password.value) ? (setValidity(confirmPassword, true), valid) : (setValidity(confirmPassword, false), false);

        if (!form.checkValidity() || !valid) {
          event.preventDefault();
          event.stopPropagation();
        }

        form.classList.add('was-validated');
      }, false);
    })();
  </script>

</body>
</html>
