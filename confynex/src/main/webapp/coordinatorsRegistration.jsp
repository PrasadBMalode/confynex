<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Coordinator Registration – Confynex</title>

  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link
    href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap"
    rel="stylesheet" />

  <style>
    :root {
      --gold: #C9A84C;
      --gold-lt: #E8C97A;
      --navy: #0B1D3A;
      --navy-lt: #122451;
      --cream: #F9F5EE;
      --dark: #070F1E;
      --text: #3A3A4A;
      --muted: #7A8399;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'DM Sans', sans-serif;
      color: var(--text);
      background: #fff;
      overflow-x: hidden;
    }

    h1, h2, h3, h4, h5 {
      font-family: 'Playfair Display', serif;
    }

    /* ── NAVBAR ── */
    .navbar {
      background: rgba(7, 15, 30, .97);
      backdrop-filter: blur(12px);
      border-bottom: 1px solid rgba(201, 168, 76, .18);
      padding: 14px 0;
      position: sticky;
      top: 0;
      z-index: 1000;
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

    .nav-link {
      color: rgba(255, 255, 255, .82) !important;
      font-weight: 500;
      font-size: .88rem;
      letter-spacing: .05em;
      text-transform: uppercase;
      padding: 6px 14px !important;
      transition: color .25s;
    }

    .nav-link:hover,
    .nav-link.active {
      color: var(--gold) !important;
    }

    .dropdown-menu {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .2);
      border-radius: 8px;
      min-width: 160px;
    }

    .dropdown-item {
      color: rgba(255, 255, 255, .82);
      font-size: .88rem;
      font-weight: 500;
      letter-spacing: .04em;
      padding: 10px 20px;
      transition: background .2s, color .2s;
    }

    .dropdown-item:hover {
      background: rgba(201, 168, 76, .12);
      color: var(--gold);
    }

    .btn-gold {
      background: linear-gradient(135deg, var(--gold), var(--gold-lt));
      color: var(--navy);
      font-weight: 700;
      border: none;
      border-radius: 50px;
      padding: 9px 26px;
      font-size: .88rem;
      letter-spacing: .06em;
      text-transform: uppercase;
      transition: opacity .25s, transform .2s;
    }

    .btn-gold:hover {
      opacity: .88;
      transform: translateY(-1px);
      color: var(--navy);
    }

    .navbar-toggler {
      border-color: rgba(201, 168, 76, .4);
    }

    .navbar-toggler-icon {
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 30 30'%3e%3cpath stroke='rgba(201,168,76,0.9)' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
    }

    .btn-outline-gold {
      border: 1px solid var(--gold);
      color: var(--gold);
      border-radius: 50px;
      padding: 9px 26px;
      font-size: .88rem;
      font-weight: 700;
      letter-spacing: .05em;
      background: transparent;
      transition: all .25s;
    }

    .btn-outline-gold:hover {
      background: var(--gold);
      color: var(--navy);
    }

    /* ── PAGE HERO BANNER ── */
    .page-banner {
      background:
        linear-gradient(160deg, rgba(7, 15, 30, .92) 55%, rgba(11, 29, 58, .78) 100%),
        url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=1600&auto=format&fit=crop') center/cover no-repeat;
      padding: 80px 0 60px;
      position: relative;
    }

    .page-banner::after {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 70% 60% at 80% 50%, rgba(201, 168, 76, .07), transparent);
      pointer-events: none;
    }

    .banner-tag {
      display: inline-block;
      background: rgba(201, 168, 76, .15);
      border: 1px solid rgba(201, 168, 76, .35);
      color: var(--gold);
      font-size: .78rem;
      font-weight: 600;
      letter-spacing: .12em;
      text-transform: uppercase;
      border-radius: 50px;
      padding: 6px 18px;
      margin-bottom: 18px;
    }

    .banner-title {
      font-size: clamp(2rem, 4vw, 3.2rem);
      color: #fff;
      line-height: 1.15;
      margin-bottom: 14px;
    }

    .banner-title em {
      font-style: normal;
      background: linear-gradient(90deg, var(--gold), var(--gold-lt));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .banner-sub {
      font-size: 1rem;
      color: rgba(255, 255, 255, .6);
      max-width: 520px;
      line-height: 1.75;
    }

    /* ── FORM SECTION ── */
    .form-section {
      background: var(--cream);
      padding: 80px 0 100px;
    }

    .form-card {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .18);
      border-radius: 24px;
      padding: 48px 44px;
      box-shadow: 0 32px 80px rgba(11, 29, 58, .18);
    }

    .form-card-title {
      font-size: 1.7rem;
      color: #fff;
      margin-bottom: 6px;
    }

    .form-card-sub {
      font-size: .9rem;
      color: rgba(255, 255, 255, .45);
      margin-bottom: 36px;
    }

    .form-control,
    .form-select {
      background: rgba(255, 255, 255, .06) !important;
      border: 1px solid rgba(255, 255, 255, .12) !important;
      color: #fff !important;
      border-radius: 10px !important;
      padding: 12px 16px !important;
      font-size: .92rem !important;
      font-family: 'DM Sans', sans-serif;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, .28) !important;
    }

    .form-control:focus,
    .form-select:focus {
      box-shadow: 0 0 0 3px rgba(201, 168, 76, .2) !important;
      border-color: rgba(201, 168, 76, .45) !important;
      outline: none;
    }

    .form-label {
      color: rgba(255, 255, 255, .6);
      font-size: .85rem;
      font-weight: 500;
      margin-bottom: 7px;
    }

    .field-divider {
      border-color: rgba(255, 255, 255, .07);
      margin: 28px 0;
    }

    .section-label {
      font-size: .72rem;
      font-weight: 700;
      letter-spacing: .14em;
      text-transform: uppercase;
      color: var(--gold);
      margin-bottom: 20px;
    }

    /* info sidebar */
    .info-card {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .15);
      border-radius: 20px;
      padding: 36px 30px;
      position: sticky;
      top: 100px;
    }

    .info-card-title {
      font-size: 1.25rem;
      color: #fff;
      margin-bottom: 6px;
    }

    .info-card-sub {
      font-size: .85rem;
      color: rgba(255, 255, 255, .4);
      margin-bottom: 28px;
      line-height: 1.7;
    }

    .info-item {
      display: flex;
      align-items: flex-start;
      gap: 14px;
      padding: 14px 0;
      border-bottom: 1px solid rgba(255, 255, 255, .06);
    }

    .info-item:last-of-type {
      border-bottom: none;
    }

    .info-icon {
      width: 40px;
      height: 40px;
      flex-shrink: 0;
      background: rgba(201, 168, 76, .1);
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--gold);
      font-size: 1.1rem;
    }

    .info-text strong {
      display: block;
      font-size: .9rem;
      color: #fff;
      margin-bottom: 3px;
    }

    .info-text span {
      font-size: .82rem;
      color: rgba(255, 255, 255, .45);
      line-height: 1.6;
    }

    .already-link {
      color: var(--gold-lt);
      font-size: .85rem;
      cursor: pointer;
      text-decoration: underline;
    }

    /* ── FOOTER ── */
    footer {
      background: var(--navy);
      padding: 28px 0;
      border-top: 1px solid rgba(201, 168, 76, .1);
      text-align: center;
      color: rgba(255, 255, 255, .35);
      font-size: .82rem;
    }

    footer span {
      color: var(--gold);
    }

    html {
      scroll-behavior: smooth;
    }

    @media(max-width: 991px) {
      .form-card {
        padding: 32px 24px;
      }

      .info-card {
        position: static;
        margin-bottom: 32px;
      }
    }
  </style>
</head>

<body>

  <!-- ═══════════════════════════════ NAVBAR (identical to main page) ═══════════════════════════════ -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Confy<span>nex</span></a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navMain">
        <ul class="navbar-nav mx-auto gap-1">
          <li class="nav-item"><a class="nav-link" href="index.jsp#home">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#who">Who We Are</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#what">What We Do</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#how">How We Do It</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#work">Our Work</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#features">Features</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#contact">Contact Us</a></li>
        </ul>

        <div class="dropdown ms-1">
          <div class="dropdown ms-3">
            <button class="btn btn-gold dropdown-toggle" data-bs-toggle="dropdown">
              <i class="bi bi-person-circle me-1"></i> Account
            </button>
            <ul class="dropdown-menu dropdown-menu-end">
              <li>
                <a class="dropdown-item" href="index.jsp" data-bs-toggle="modal" data-bs-target="#signupModal">
                  <i class="bi bi-person-plus me-2"></i>Sign Up
                </a>
              </li>
              <li>
                <a class="dropdown-item" href="index.jsp" data-bs-toggle="modal" data-bs-target="#signinModal">
                  <i class="bi bi-box-arrow-in-right me-2"></i>Sign In
                </a>
              </li>
              <li><hr class="dropdown-divider" style="border-color:rgba(201,168,76,.15);"></li>
              <li>
                <a class="dropdown-item active" href="coordinatorRegister.jsp">
                  <i class="bi bi-person-badge me-2"></i>Coordinator Register
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <!-- ═══════════════════════════════ PAGE BANNER ═══════════════════════════════ -->
  <div class="page-banner">
    <div class="container position-relative" style="z-index:1">
      <div class="banner-tag"><i class="bi bi-person-badge me-1"></i> Coordinator Portal</div>
      <h1 class="banner-title">Register as a <em>Coordinator</em></h1>
      <p class="banner-sub">
        Join the Confynex team as a certified coordinator and help deliver world-class conference experiences to thousands of delegates.
      </p>
    </div>
  </div>

  <!-- ═══════════════════════════════ FORM SECTION ═══════════════════════════════ -->
  <section class="form-section">
    <div class="container">

      <!-- Feedback messages -->
      <c:if test="${not empty coordinatorSuccess}">
        <div class="alert text-center mb-4" style="background:rgba(25,135,84,.15); border:1px solid rgba(25,135,84,.3); color:#75dd9a; border-radius:12px;">
          <i class="bi bi-check-circle me-2"></i>${coordinatorSuccess}
        </div>
      </c:if>
      <c:if test="${not empty coordinatorFailed}">
        <div class="alert text-center mb-4" style="background:rgba(220,53,69,.12); border:1px solid rgba(220,53,69,.3); color:#f08080; border-radius:12px;">
          <i class="bi bi-exclamation-circle me-2"></i>${coordinatorFailed}
        </div>
      </c:if>
      <c:if test="${not empty coordinatorExists}">
        <div class="alert text-center mb-4" style="background:rgba(255,193,7,.1); border:1px solid rgba(255,193,7,.3); color:#ffc107; border-radius:12px;">
          <i class="bi bi-info-circle me-2"></i>${coordinatorExists}
        </div>
      </c:if>

      <div class="row g-5 align-items-start">

        <!-- ── LEFT: Info sidebar ── -->
        <!--<div class="col-lg-4 order-lg-1 order-2">
          <div class="info-card">
            <h5 class="info-card-title">Why Become a Coordinator?</h5>
            <p class="info-card-sub">Coordinators are the backbone of every successful Confynex event.</p>

            <div class="info-item">
              <div class="info-icon"><i class="bi bi-people"></i></div>
              <div class="info-text">
                <strong>Manage Delegates</strong>
                <span>Oversee registrations, check-ins, and delegate queries for your assigned conference.</span>
              </div>
            </div>
            <div class="info-item">
              <div class="info-icon"><i class="bi bi-calendar2-check"></i></div>
              <div class="info-text">
                <strong>Session Control</strong>
                <span>Access live session dashboards and manage real-time attendee flow.</span>
              </div>
            </div>
            <div class="info-item">
              <div class="info-icon"><i class="bi bi-headset"></i></div>
              <div class="info-text">
                <strong>Dedicated Support</strong>
                <span>Get priority access to the Confynex ops team throughout your event.</span>
              </div>
            </div>
            <div class="info-item">
              <div class="info-icon"><i class="bi bi-shield-check"></i></div>
              <div class="info-text">
                <strong>Verified Badge</strong>
                <span>Receive a verified coordinator credential recognised across all Confynex events.</span>
              </div>
            </div>

            <hr class="field-divider" />
            <p class="text-white-50 mb-0" style="font-size:.84rem;">
              Already registered?
              <a href="index.jsp" class="already-link">Sign In here</a>
            </p>
          </div>
        </div>-->

        <!-- ── RIGHT: Registration form ── -->
        <div class="col-lg-8 order-lg-2 order-1">
          <div class="form-card">

            <h4 class="form-card-title">Coordinator Registration</h4>
            <p class="form-card-sub">Fill in your details below. All fields marked are required.</p>

            <form method="post" id="coordinatorForm" action="registerCoordinator" enctype="multipart/form-data" class="needs-validation" novalidate>

              <input type="hidden" name="timestamp" id="coordinatorTimestamp" />

              <div class="section-label"><i class="bi bi-person me-1"></i>Personal Details</div>
              <div class="row g-3">

                <div class="col-md-6">
                  <label class="form-label">Full Name <span style="color:var(--gold)">*</span></label>
                  <input
                    type="text"
                    class="form-control"
                    name="fullName"
                    id="fullName"
                    placeholder="e.g. Priya Sharma"
                    required
                  />
                  <div class="invalid-feedback">Full Name must contain only letters (minimum 3).</div>
                </div>

                <div class="col-md-6">
                  <label class="form-label">Email Address <span style="color:var(--gold)">*</span></label>
                  <input
                    type="email"
                    class="form-control"
                    name="email"
                    id="email"
                    placeholder="priya@gmail.com"
                    required
                  />
                  <div class="invalid-feedback">Email must be a valid Gmail address.</div>
                </div>

                <div class="col-md-6">
                  <label class="form-label">Phone Number <span style="color:var(--gold)">*</span></label>
                  <input
                    type="tel"
                    class="form-control"
                    name="phoneNumber"
                    id="phoneNumber"
                    placeholder="9876543210"
                    required
                  />
                  <div class="invalid-feedback">Phone number must be 10 digits and start with 6,7,8 or 9.</div>
                </div>

                <div class="col-md-6">
                  <label class="form-label">Designation <span style="color:var(--gold)">*</span></label>
                  <input
                    type="text"
                    class="form-control"
                    name="designation"
                    id="designation"
                    placeholder="e.g. Event Manager"
                    required
                  />
                  <div class="invalid-feedback">Please enter a valid designation (minimum 2 chars).</div>
                </div>

              </div>

              <hr class="field-divider" />

              <div class="section-label"><i class="bi bi-building me-1"></i>Organisation Details</div>
              <div class="row g-3">

                <div class="col-md-6">
                  <label class="form-label">Organisation Name <span style="color:var(--gold)">*</span></label>
                  <input
                    type="text"
                    class="form-control"
                    name="organisationName"
                    id="organisationName"
                    placeholder="Your organisation"
                    required
                  />
                  <div class="invalid-feedback">Organisation Name must contain minimum 3 letters.</div>
                </div>

                <div class="col-md-6">
                  <label class="form-label">LinkedIn Profile URL</label>
                  <input
                    type="url"
                    class="form-control"
                    name="linkedInUrl"
                    id="linkedInUrl"
                    placeholder="https://linkedin.com/in/yourprofile"
                  />
                  <div class="invalid-feedback">Please enter a valid LinkedIn URL.</div>
                </div>

              </div>

              <hr class="field-divider" />

              <div class="section-label"><i class="bi bi-file-earmark-spreadsheet me-1"></i>Delegate Data Upload</div>
              <div class="row g-3">

                <div class="col-12">
                  <label class="form-label">
                    Upload Excel File
                    <span style="color:rgba(255,255,255,.35); font-size:.8rem; font-weight:400;"> — delegate / coordinator list</span>
                  </label>
                  <input
                      type="file"
                      class="form-control"
                      name="excelFile"
                      id="excelFile"
                      accept=".xls,.xlsx"
                  />
                  <small style="color:rgba(255,255,255,.35); font-size:.8rem; display:block; margin-top:6px;">
                    <i class="bi bi-info-circle me-1"></i>Accepted formats: .xls, .xlsx
                  </small>
                </div>

              </div>

              <hr class="field-divider" />

              <button type="submit" class="btn btn-gold w-100 py-3" style="font-size:.96rem;">
                Register as Coordinator &nbsp;<i class="bi bi-arrow-right"></i>
              </button>

              <p class="text-center mt-3 mb-0" style="color:rgba(255,255,255,.4); font-size:.85rem;">
                Already have an account?
                <a href="index.jsp" class="already-link">Go back & Sign In</a>
              </p>

            </form>
          </div>
        </div>

      </div>
    </div>
  </section>

  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1100">
    <div id="coordinatorToast" class="toast align-items-center text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body" id="toastMessage">
          </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>

  <!-- ═══════════════════════════════ FOOTER ═══════════════════════════════ -->
  <footer>
    <div class="container">
      <p>© 2025 <span>Confynex</span>. All rights reserved. Crafted with precision for world-class conferences.</p>
    </div>
  </footer>



  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // Auto-fill hidden timestamp on page load
    document.addEventListener('DOMContentLoaded', () => {
      const ts = document.getElementById('coordinatorTimestamp');
      if (ts) ts.value = new Date().toISOString().slice(0, 19).replace('T', ' ');
    });



    document.addEventListener('DOMContentLoaded', () => {
      // 1. Auto-fill hidden timestamp
      const ts = document.getElementById('coordinatorTimestamp');
      if (ts) ts.value = new Date().toISOString().slice(0, 19).replace('T', ' ');

      // 2. Exact validation expressions matching your DTO annotations
      const rules = {
        fullName: /^[A-Za-z\s.'-]{3,}$/,
        email: /^[a-zA-Z0-9._%+-]+@gmail\.com$/,
        organisationName: /^[A-Za-z\s]{3,}$/,
        phoneNumber: /^[6-9][0-9]{9}$/,
        designation: /^[A-Za-z0-9\s.&()-]{2,}$/,
        linkedInUrl: /^(https?:\/\/)?(www\.)?linkedin\.com\/.*$/
      };

      function validateField(input) {
        const name = input.name;
        const value = input.value.trim();
        let isValid = true;

        // Run rules matching field names
        if (rules[name]) {
          // If Optional LinkedIn URL is empty, skip verification constraint
          if (name === 'linkedInUrl' && value === '') {
            isValid = true;
          } else {
            isValid = rules[name].test(value);
          }
        } else if (input.hasAttribute('required')) {
          isValid = value !== "";
        }

        if (!isValid) {
          input.classList.add("is-invalid");
          input.classList.remove("is-valid");
        } else {
          input.classList.remove("is-invalid");
          // Only mark positive validation styles if values exist
          if (value !== "") {
            input.classList.add("is-valid");
          } else {
            input.classList.remove("is-valid");
          }
        }
        return isValid;
      }

      // Attach real-time processing listeners
      const form = document.getElementById("coordinatorForm");
      const inputs = form.querySelectorAll("input, textarea");

      inputs.forEach(input => {
        if (input.type !== 'file' && input.type !== 'hidden' && input.type !== 'submit') {
          input.addEventListener("blur", () => {
            validateField(input);
          });
        }
      });

      // Submit check safeguard interceptor
      form.addEventListener("submit", (e) => {
        let isFormValid = true;
        inputs.forEach(input => {
          if (input.type !== 'file' && input.type !== 'hidden' && input.type !== 'submit') {
            if (!validateField(input)) {
              isFormValid = false;
            }
          }
        });

        if (!isFormValid) {
          e.preventDefault();
          e.stopPropagation();
        }
      });

      // 3. Monitor backend message responses and prompt context UI Toasts
      const successMsg = "${coordinatorSuccess}";
      const failedMsg = "${coordinatorFailed}";
      const existMsg = "${coordinatorExists}";

      const toastEl = document.getElementById('coordinatorToast');
      const toastMessage = document.getElementById('toastMessage');

      if (toastEl && typeof bootstrap !== 'undefined') {
        const bootstrapToast = new bootstrap.Toast(toastEl, { delay: 6000 });

        console.log("Success =", successMsg);
        console.log("Failed =", failedMsg);
        console.log("Exists =", existMsg);

        if (successMsg && successMsg.trim() !== "") {
            toastEl.classList.remove("bg-danger", "bg-warning", "text-dark");
            toastEl.classList.add("bg-success");
            toastMessage.textContent = successMsg;
            bootstrapToast.show();
        }
        else if (failedMsg && failedMsg.trim() !== "") {
            toastEl.classList.remove("bg-success", "bg-warning", "text-dark");
            toastEl.classList.add("bg-danger");
            toastMessage.textContent = failedMsg;
            bootstrapToast.show();
        }
        else if (existMsg && existMsg.trim() !== "") {
            toastEl.classList.remove("bg-success", "bg-danger");
            toastEl.classList.add("bg-warning", "text-dark");
            toastMessage.textContent = existMsg;
            bootstrapToast.show();
        }
      }
    });
  </script>

</body>
</html>
