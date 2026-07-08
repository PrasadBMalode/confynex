<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Conference Delegate Management</title>

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

    h1,
    h2,
    h3,
    h4,
    h5 {
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

    /* ── HERO ── */
    #home {
      min-height: 100vh;
      background:
        linear-gradient(160deg, rgba(7, 15, 30, .88) 55%, rgba(11, 29, 58, .72) 100%),
        url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=1600&auto=format&fit=crop') center/cover no-repeat;
      display: flex;
      align-items: center;
      position: relative;
    }

    #home::after {
      content: '';
      position: absolute;
      inset: 0;
      background: radial-gradient(ellipse 70% 60% at 80% 50%, rgba(201, 168, 76, .08), transparent);
      pointer-events: none;
    }

    .hero-tag {
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
      margin-bottom: 22px;
    }

    .hero-title {
      font-size: clamp(2.8rem, 6vw, 5.2rem);
      color: #fff;
      line-height: 1.1;
      margin-bottom: 24px;
    }

    .hero-title em {
      font-style: normal;
      background: linear-gradient(90deg, var(--gold), var(--gold-lt));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .hero-sub {
      font-size: 1.12rem;
      color: rgba(255, 255, 255, .65);
      max-width: 520px;
      line-height: 1.75;
      margin-bottom: 38px;
    }

    .hero-stats {
      display: flex;
      gap: 36px;
      margin-top: 48px;
      padding-top: 32px;
      border-top: 1px solid rgba(255, 255, 255, .1);
    }

    .stat-num {
      font-family: 'Playfair Display', serif;
      font-size: 2rem;
      font-weight: 900;
      color: var(--gold);
    }

    .stat-lbl {
      font-size: .8rem;
      color: rgba(255, 255, 255, .5);
      letter-spacing: .08em;
      text-transform: uppercase;
    }

    /* ── SECTION SHARED ── */
    section {
      padding: 100px 0;
    }

    .sec-tag {
      font-size: .75rem;
      font-weight: 700;
      letter-spacing: .16em;
      text-transform: uppercase;
      color: var(--gold);
      margin-bottom: 12px;
    }

    .sec-title {
      font-size: clamp(1.9rem, 3.5vw, 2.8rem);
      color: var(--navy);
      line-height: 1.2;
      margin-bottom: 18px;
    }

    .sec-sub {
      color: var(--muted);
      font-size: 1.05rem;
      line-height: 1.8;
    }

    /* ── WHO WE ARE ── */
    #who {
      background: var(--cream);
    }

    .who-img {
      border-radius: 20px;
      overflow: hidden;
      position: relative;
      box-shadow: 0 30px 80px rgba(11, 29, 58, .18);
    }

    .who-img img {
      width: 100%;
      height: 480px;
      object-fit: cover;
    }

    .who-badge {
      position: absolute;
      bottom: 28px;
      left: -24px;
      background: var(--navy);
      color: #fff;
      border-radius: 14px;
      padding: 18px 28px;
      box-shadow: 0 12px 40px rgba(0, 0, 0, .25);
    }

    .who-badge .num {
      font-family: 'Playfair Display', serif;
      font-size: 2.2rem;
      color: var(--gold);
      font-weight: 900;
    }

    .who-badge .lbl {
      font-size: .8rem;
      color: rgba(255, 255, 255, .6);
      letter-spacing: .08em;
      text-transform: uppercase;
    }

    .check-list {
      list-style: none;
      padding: 0;
      margin: 28px 0;
    }

    .check-list li {
      display: flex;
      align-items: flex-start;
      gap: 12px;
      padding: 10px 0;
      border-bottom: 1px solid rgba(0, 0, 0, .06);
      font-size: .95rem;
      color: var(--text);
    }

    .check-list li i {
      color: var(--gold);
      font-size: 1.1rem;
      margin-top: 2px;
      flex-shrink: 0;
    }

    /* ── WHAT WE DO ── */
    #what {
      background: #fff;
    }

    .do-card {
      background: #fff;
      border: 1px solid rgba(0, 0, 0, .07);
      border-radius: 18px;
      overflow: hidden;
      transition: transform .3s, box-shadow .3s;
      height: 100%;
    }

    .do-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 24px 60px rgba(11, 29, 58, .1);
    }

    .do-card img {
      width: 100%;
      height: 200px;
      object-fit: cover;
    }

    .do-card-body {
      padding: 24px;
    }

    .do-icon {
      width: 48px;
      height: 48px;
      background: rgba(201, 168, 76, .12);
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--gold);
      font-size: 1.3rem;
      margin-bottom: 14px;
    }

    .do-card-body h5 {
      font-size: 1.15rem;
      color: var(--navy);
      margin-bottom: 8px;
    }

    .do-card-body p {
      font-size: .9rem;
      color: var(--muted);
      line-height: 1.7;
      margin: 0;
    }

    /* ── HOW WE DO IT ── */
    #how {
      background: var(--navy);
    }

    #how .sec-title {
      color: #fff;
    }

    #how .sec-sub {
      color: rgba(255, 255, 255, .55);
    }

    .step-wrap {
      position: relative;
    }

    .step-line {
      position: absolute;
      left: 36px;
      top: 0;
      bottom: 0;
      width: 2px;
      background: linear-gradient(180deg, var(--gold) 0%, rgba(201, 168, 76, .08) 100%);
    }

    .step-item {
      display: flex;
      gap: 28px;
      padding: 0 0 40px 0;
      position: relative;
    }

    .step-num {
      width: 72px;
      height: 72px;
      flex-shrink: 0;
      background: rgba(201, 168, 76, .1);
      border: 2px solid rgba(201, 168, 76, .3);
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-family: 'Playfair Display', serif;
      font-size: 1.4rem;
      font-weight: 900;
      color: var(--gold);
      position: relative;
      z-index: 1;
    }

    .step-content h5 {
      color: #fff;
      font-size: 1.1rem;
      margin-bottom: 8px;
    }

    .step-content p {
      color: rgba(255, 255, 255, .5);
      font-size: .9rem;
      line-height: 1.75;
      margin: 0;
    }

    .how-img {
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 30px 80px rgba(0, 0, 0, .4);
    }

    .how-img img {
      width: 100%;
      height: 520px;
      object-fit: cover;
    }

    /* ── OUR WORK ── */
    #work {
      background: #fff;
    }

    .work-card {
      border-radius: 16px;
      overflow: hidden;
      position: relative;
      cursor: pointer;
    }

    .work-card img {
      width: 100%;
      height: 280px;
      object-fit: cover;
      transition: transform .4s;
    }

    .work-card:hover img {
      transform: scale(1.06);
    }

    .work-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(0deg, rgba(7, 15, 30, .9) 0%, transparent 60%);
      display: flex;
      flex-direction: column;
      justify-content: flex-end;
      padding: 24px;
      opacity: 0;
      transition: opacity .3s;
    }

    .work-card:hover .work-overlay {
      opacity: 1;
    }

    .work-tag {
      font-size: .72rem;
      font-weight: 700;
      letter-spacing: .12em;
      text-transform: uppercase;
      color: var(--gold);
      margin-bottom: 6px;
    }

    .work-overlay h5 {
      color: #fff;
      font-size: 1.1rem;
      margin: 0;
    }

    /* always-visible bottom strip */
    .work-strip {
      background: var(--cream);
      padding: 14px 18px;
    }

    .work-strip h6 {
      font-size: .95rem;
      color: var(--navy);
      margin: 0 0 2px;
    }

    .work-strip span {
      font-size: .8rem;
      color: var(--muted);
    }

    /* ── FEATURES ── */
    #features {
      background: var(--cream);
    }

    .feat-item {
      display: flex;
      gap: 20px;
      padding: 24px;
      background: #fff;
      border-radius: 16px;
      border: 1px solid rgba(0, 0, 0, .06);
      transition: box-shadow .3s;
      height: 100%;
    }

    .feat-item:hover {
      box-shadow: 0 16px 50px rgba(11, 29, 58, .08);
    }

    .feat-icon {
      width: 56px;
      height: 56px;
      flex-shrink: 0;
      background: linear-gradient(135deg, var(--gold), var(--gold-lt));
      border-radius: 14px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--navy);
      font-size: 1.4rem;
    }

    .feat-text h6 {
      font-size: 1rem;
      color: var(--navy);
      margin-bottom: 6px;
    }

    .feat-text p {
      font-size: .88rem;
      color: var(--muted);
      line-height: 1.7;
      margin: 0;
    }

    /* ── CONTACT ── */
    #contact {
      background: var(--dark);
    }

    #contact .sec-title {
      color: #fff;
    }

    #contact .sec-sub {
      color: rgba(255, 255, 255, .45);
    }

    .contact-card {
      background: rgba(255, 255, 255, .04);
      border: 1px solid rgba(255, 255, 255, .08);
      border-radius: 20px;
      padding: 42px 38px;
    }

    .form-control,
    .form-select {
      background: rgba(255, 255, 255, .06) !important;
      border: 1px solid rgba(255, 255, 255, .12) !important;
      color: #fff !important;
      border-radius: 10px !important;
      padding: 12px 16px !important;
      font-size: .92rem !important;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, .3) !important;
    }

    .form-control:focus,
    .form-select:focus {
      box-shadow: 0 0 0 3px rgba(201, 168, 76, .2) !important;
      border-color: rgba(201, 168, 76, .45) !important;
    }

    .form-label {
      color: rgba(255, 255, 255, .6);
      font-size: .85rem;
      font-weight: 500;
      margin-bottom: 6px;
    }

    .contact-info-item {
      display: flex;
      align-items: center;
      gap: 16px;
      padding: 18px 0;
      border-bottom: 1px solid rgba(255, 255, 255, .06);
      color: rgba(255, 255, 255, .6);
      font-size: .92rem;
    }

    .contact-info-item i {
      color: var(--gold);
      font-size: 1.2rem;
      width: 22px;
      text-align: center;
    }

    .contact-info-item strong {
      color: #fff;
      display: block;
      font-size: .95rem;
      margin-bottom: 2px;
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

    /* ── SCROLL SMOOTH ── */
    html {
      scroll-behavior: smooth;
    }

    /* ── MODAL FORMS ── */
    .modal-content {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .2);
      border-radius: 18px;
    }

    .modal-header {
      border-bottom: 1px solid rgba(255, 255, 255, .08);
    }

    .modal-title {
      color: var(--gold);
      font-family: 'Playfair Display', serif;
    }

    .modal-body .form-control {
      background: rgba(255, 255, 255, .07) !important;
      border: 1px solid rgba(255, 255, 255, .15) !important;
      color: #fff !important;
      border-radius: 10px !important;
      padding: 11px 15px !important;
    }

    .modal-body .form-control::placeholder {
      color: rgba(255, 255, 255, .28) !important;
    }

    .modal-body .form-label {
      color: rgba(255, 255, 255, .55);
      font-size: .85rem;
    }

    .btn-close-white {
      filter: invert(1) grayscale(1);
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

    .modal-link {
      color: var(--gold-lt);
      font-size: .88rem;
      cursor: pointer;
      text-decoration: underline;
    }

    @media(max-width:767px) {
      .who-badge {
        display: none;
      }

      .hero-stats {
        flex-wrap: wrap;
        gap: 22px;
      }

      .step-line {
        display: none;
      }
    }


    .navbar-brand img {
        object-fit: contain;
    }

    .navbar-brand {
        font-size: 1.8rem;
        font-weight: 700;
    }

  </style>
</head>

<body>

  <!-- ═══════════════════════════════ NAVBAR ═══════════════════════════════ -->
  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <!-- Brand -->

      <a class="navbar-brand" href="#home">Confy<span>nex</span></a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navMain">
        <ul class="navbar-nav mx-auto gap-1">
          <li class="nav-item"><a class="nav-link" href="#home">Home</a></li>
          <li class="nav-item"><a class="nav-link" href="#who">Who We Are</a></li>
          <li class="nav-item"><a class="nav-link" href="#what">What We Do</a></li>
          <li class="nav-item"><a class="nav-link" href="#how">How We Do It</a></li>
          <li class="nav-item"><a class="nav-link" href="#work">Our Work</a></li>
          <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
          <li class="nav-item"><a class="nav-link" href="#contact">Contact Us</a></li>
        </ul>

        <!-- Auth dropdown -->
        <div class="dropdown ms-1">
          <div class="dropdown ms-3">
            <button class="btn btn-gold dropdown-toggle" data-bs-toggle="dropdown">
              <i class="bi bi-person-circle me-1"></i> Account
            </button>

            <ul class="dropdown-menu dropdown-menu-end">

              <!-- 1. Host Sign Up -->
              <li>
                <a class="dropdown-item" href="hostRegistration.jsp">
                  <i class="bi bi-person-plus me-2"></i>Host Sign Up
                </a>
              </li>

              <!-- 2. Coordinator Register -->
              <li>
                <a class="dropdown-item" href="coordinatorsRegistration.jsp">
                  <i class="bi bi-person-plus me-2"></i>Coordinator Sign Up
                </a>
              </li>

              <li>
                <hr class="dropdown-divider" style="border-color:rgba(201,168,76,.15);">
              </li>

              <!-- 3. Sign In -->
              <li>
                <a class="dropdown-item" href="hostLogin.jsp">
                  <i class="bi bi-box-arrow-in-right me-2"></i>Host Sign In
                </a>
              </li>

            </ul>
          </div>
        </div>
      </div>
    </div>
  </nav>

  <!-- ═══════════════════════════════ HERO ═══════════════════════════════ -->
  <section id="home">
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-7">
          <div class="hero-tag"><i class="bi bi-stars me-1"></i> Conference Intelligence Platform</div>
          <h1 class="hero-title">
            Manage Every<br /><em>Delegate</em> with<br />Precision & Grace
          </h1>
          <p class="hero-sub">
            Confynex redefines how conferences are orchestrated — from delegate onboarding to real-time session
            tracking, badge printing, and seamless attendee experiences at scale.
          </p>
          <div class="d-flex flex-wrap gap-3">
            <a href="#contact" class="btn btn-gold px-4 py-3">
              Request a Demo <i class="bi bi-arrow-right ms-1"></i>
            </a>
            <a href="#what" class="btn btn-outline-gold px-4 py-3">Explore Features</a>

             <form action="delegateLogin" method="post" class="d-inline">
                 <button type="submit" class="btn btn-gold px-4 py-3">
                     Delegate Login <i class="bi bi-person-badge ms-1"></i>
                 </button>
             </form>
          </div>

          <div class="hero-stats">
            <div>
              <div class="stat-num">50+</div>
              <div class="stat-lbl">Events Managed</div>
            </div>
            <div>
              <div class="stat-num">12k</div>
              <div class="stat-lbl">Delegates Handled</div>
            </div>
            <div>
              <div class="stat-num">99.9%</div>
              <div class="stat-lbl">Client Satisfaction</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ WHO WE ARE ═══════════════════════════════ -->
  <section id="who">
    <div class="container">
      <div class="row align-items-center g-5">
        <div class="col-lg-5">
          <div class="who-img">
            <img src="https://images.unsplash.com/photo-1529156069898-49953e39b3ac?w=800&auto=format&fit=crop"
              alt="Our Team" />
            <div class="who-badge">
              <div class="num">12+</div>
              <div class="lbl">Years of Excellence</div>
            </div>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="sec-tag"><i class="bi bi-building me-1"></i>Who We Are</div>
          <h2 class="sec-title">A Team Built Around<br />World-Class Conferences</h2>
          <p class="sec-sub">
            Confynex was born out of frustration with fragmented, cumbersome delegate management tools. We are a team of
            event technologists, UX designers, and hospitality veterans committed to creating seamless conference
            ecosystems.
          </p>
          <ul class="check-list">
            <li><i class="bi bi-check-circle-fill"></i> Pioneering delegate intelligence since 2012</li>
            <li><i class="bi bi-check-circle-fill"></i> Trusted by Fortune 500 companies and government bodies</li>
            <li><i class="bi bi-check-circle-fill"></i> GDPR compliant & ISO 27001 certified platform</li>
            <li><i class="bi bi-check-circle-fill"></i> 24/7 white-glove support for every event</li>
            <li><i class="bi bi-check-circle-fill"></i> Presence across 40+ countries worldwide</li>
          </ul>
          <a href="#contact" class="btn btn-gold px-4">Get In Touch <i class="bi bi-arrow-right ms-1"></i></a>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ WHAT WE DO ═══════════════════════════════ -->
  <section id="what">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <div class="sec-tag"><i class="bi bi-grid me-1"></i>What We Do</div>
          <h2 class="sec-title">End-to-End Conference Solutions</h2>
          <p class="sec-sub">Every service is designed to reduce friction and amplify the delegate experience.</p>
        </div>
      </div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1560439514-4e9645039924?w=600&auto=format&fit=crop"
              alt="Registration" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-person-check"></i></div>
              <h5>Delegate Registration</h5>
              <p>Streamlined online and onsite registration flows with custom forms, group registration, and instant
                confirmation workflows.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=600&auto=format&fit=crop"
              alt="Badge Printing" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-badge-hd"></i></div>
              <h5>Smart Badge Printing</h5>
              <p>QR and RFID-enabled badges printed on-demand with role-based access permissions and session scanning.
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1551818255-e6e10975bc17?w=600&auto=format&fit=crop"
              alt="Session Management" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-calendar2-event"></i></div>
              <h5>Session Management</h5>
              <p>Build and manage complex multi-track agendas with capacity controls, waitlists, and live attendee
                analytics.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1556761175-4b46a572b786?w=600&auto=format&fit=crop"
              alt="Networking" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-people"></i></div>
              <h5>Networking Hub</h5>
              <p>AI-powered matchmaking, meeting scheduler, and virtual networking lounges to foster meaningful
                connections.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1504868584819-f8e8b4b6d7e3?w=600&auto=format&fit=crop"
              alt="Analytics" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-bar-chart-line"></i></div>
              <h5>Real-Time Analytics</h5>
              <p>Dashboards with live delegate activity, engagement heatmaps, session popularity, and post-event
                reporting.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="do-card">
            <img src="https://images.unsplash.com/photo-1563986768494-4dee2763ff3f?w=600&auto=format&fit=crop"
              alt="Communication" />
            <div class="do-card-body">
              <div class="do-icon"><i class="bi bi-chat-dots"></i></div>
              <h5>Delegate Communication</h5>
              <p>Automated multi-channel messaging — email, SMS, and push — for reminders, updates, and personalised
                schedules.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ HOW WE DO IT ═══════════════════════════════ -->
  <section id="how">
    <div class="container">
      <div class="row align-items-center g-5">
        <div class="col-lg-6">
          <div class="sec-tag"><i class="bi bi-gear me-1"></i>How We Do It</div>
          <h2 class="sec-title">Our Proven Process</h2>
          <p class="sec-sub mb-5">A structured, repeatable methodology that delivers flawless conferences every single
            time.</p>

          <div class="step-wrap">
            <div class="step-line"></div>
            <div class="step-item">
              <div class="step-num">01</div>
              <div class="step-content">
                <h5>Discovery & Scoping</h5>
                <p>We deeply understand your conference goals, audience profile, venue constraints, and brand identity
                  before a single line of code is configured.</p>
              </div>
            </div>
            <div class="step-item">
              <div class="step-num">02</div>
              <div class="step-content">
                <h5>Platform Configuration</h5>
                <p>Our team tailors the Confynex platform — registration flows, badge templates, agenda builder, and
                  integrations — to your exact event blueprint.</p>
              </div>
            </div>
            <div class="step-item">
              <div class="step-num">03</div>
              <div class="step-content">
                <h5>Delegate Onboarding</h5>
                <p>Automated invitations, personalised delegate portals, and live support ensure every attendee arrives
                  informed and prepared.</p>
              </div>
            </div>
            <div class="step-item">
              <div class="step-num">04</div>
              <div class="step-content">
                <h5>On-Site Execution</h5>
                <p>Our on-ground team operates check-in kiosks, badge printers, and live dashboards — ensuring zero
                  queues and zero confusion.</p>
              </div>
            </div>
            <div class="step-item" style="padding-bottom:0">
              <div class="step-num">05</div>
              <div class="step-content">
                <h5>Post-Event Intelligence</h5>
                <p>Comprehensive analytics reports, feedback aggregation, and ROI summaries delivered within 48 hours of
                  event close.</p>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="how-img">
            <img src="https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800&auto=format&fit=crop"
              alt="Our Process" />
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ OUR WORK ═══════════════════════════════ -->
  <section id="work">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <div class="sec-tag"><i class="bi bi-collection me-1"></i>Our Work</div>
          <h2 class="sec-title">Events That Defined Industries</h2>
          <p class="sec-sub">A curated portfolio of landmark conferences we've powered around the globe.</p>
        </div>
      </div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=700&auto=format&fit=crop"
              alt="Global Tech Summit" />
            <div class="work-overlay">
              <div class="work-tag">Technology</div>
              <h5>Global Tech Summit 2024</h5>
            </div>
            <div class="work-strip">
              <h6>Global Tech Summit</h6>
              <span>Dubai · 12,000 Delegates</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1587825140708-dfaf72ae4b04?w=700&auto=format&fit=crop"
              alt="Healthcare Congress" />
            <div class="work-overlay">
              <div class="work-tag">Healthcare</div>
              <h5>World Health Congress 2024</h5>
            </div>
            <div class="work-strip">
              <h6>World Health Congress</h6>
              <span>Geneva · 8,500 Delegates</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=700&auto=format&fit=crop"
              alt="Finance Forum" />
            <div class="work-overlay">
              <div class="work-tag">Finance</div>
              <h5>Global Finance Forum</h5>
            </div>
            <div class="work-strip">
              <h6>Global Finance Forum</h6>
              <span>London · 5,200 Delegates</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1558008258-3256797b43f3?w=700&auto=format&fit=crop"
              alt="Sustainability Summit" />
            <div class="work-overlay">
              <div class="work-tag">Sustainability</div>
              <h5>Climate Leaders Summit</h5>
            </div>
            <div class="work-strip">
              <h6>Climate Leaders Summit</h6>
              <span>Singapore · 3,800 Delegates</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1475721027785-f74eccf877e2?w=700&auto=format&fit=crop"
              alt="Education Conference" />
            <div class="work-overlay">
              <div class="work-tag">Education</div>
              <h5>EdTech World Conference</h5>
            </div>
            <div class="work-strip">
              <h6>EdTech World Conference</h6>
              <span>New York · 6,100 Delegates</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="work-card">
            <img src="https://images.unsplash.com/photo-1591115765373-5207764f72e7?w=700&auto=format&fit=crop"
              alt="Government Forum" />
            <div class="work-overlay">
              <div class="work-tag">Government</div>
              <h5>G20 Side Events 2023</h5>
            </div>
            <div class="work-strip">
              <h6>G20 Side Events</h6>
              <span>New Delhi · 4,400 Delegates</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ FEATURES ═══════════════════════════════ -->
  <section id="features">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <div class="sec-tag"><i class="bi bi-lightning-charge me-1"></i>Features</div>
          <h2 class="sec-title">Everything You Need to Run a Flawless Event</h2>
          <p class="sec-sub">Purpose-built tools for the demands of modern large-scale conferencing.</p>
        </div>
      </div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-qr-code"></i></div>
            <div class="feat-text">
              <h6>QR & RFID Check-In</h6>
              <p>Sub-second check-in with QR codes and RFID wristbands. Zero queues, zero errors.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-globe"></i></div>
            <div class="feat-text">
              <h6>Multi-Language Support</h6>
              <p>Full platform localisation in 28 languages with RTL support.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-shield-lock"></i></div>
            <div class="feat-text">
              <h6>Enterprise Security</h6>
              <p>SOC2 Type II, GDPR-compliant, end-to-end encryption, and granular access controls.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-phone"></i></div>
            <div class="feat-text">
              <h6>Native Mobile App</h6>
              <p>iOS & Android apps for delegates with personalised agendas, maps, and live updates.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-plug"></i></div>
            <div class="feat-text">
              <h6>API & Integrations</h6>
              <p>Connect with Salesforce, HubSpot, Zoom, Cvent, and 100+ tools via REST API.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-graph-up-arrow"></i></div>
            <div class="feat-text">
              <h6>Live Analytics Dashboard</h6>
              <p>Real-time attendee flow, session engagement, and revenue tracking in one view.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-cash-coin"></i></div>
            <div class="feat-text">
              <h6>Payment Processing</h6>
              <p>Accept payments in 135+ currencies with Stripe, PayPal, and local payment gateways.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-robot"></i></div>
            <div class="feat-text">
              <h6>AI Delegate Insights</h6>
              <p>Predictive no-show modelling, personalised recommendations, and sentiment analysis.</p>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4">
          <div class="feat-item">
            <div class="feat-icon"><i class="bi bi-headset"></i></div>
            <div class="feat-text">
              <h6>24/7 Live Support</h6>
              <p>Dedicated event success managers on standby throughout every live event.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ CONTACT ═══════════════════════════════ -->
  <section id="contact">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <div class="sec-tag" style="color:var(--gold-lt)"><i class="bi bi-envelope me-1"></i>Contact Us</div>
          <h2 class="sec-title">Let's Build Something Extraordinary</h2>
          <p class="sec-sub">Tell us about your next conference and we'll craft the perfect solution.</p>
        </div>
      </div>
      <div class="row g-5">
        <div class="col-lg-5">
          <div class="contact-info-item">
            <i class="bi bi-geo-alt"></i>
            <div>
              <strong>Headquarters</strong>
              Level 22, Prestige Tower, MG Road, Bengaluru – 560001, India
            </div>
          </div>
          <div class="contact-info-item">
            <i class="bi bi-telephone"></i>
            <div>
              <strong>Phone</strong>
              +91 6360211265
            </div>
          </div>
          <div class="contact-info-item">
            <i class="bi bi-envelope"></i>
            <div>
              <strong>Email</strong>
              hello@confynex.com
            </div>
          </div>
          <div class="contact-info-item" style="border:none">
            <i class="bi bi-clock"></i>
            <div>
              <strong>Support Hours</strong>
              Mon to Fri, 9 AM to 8 PM IST
            </div>
          </div>
          <div class="d-flex gap-3 mt-4">
            <a href="#" class="btn btn-outline-gold"><i class="bi bi-linkedin"></i></a>
            <a href="#" class="btn btn-outline-gold"><i class="bi bi-twitter-x"></i></a>
            <a href="#" class="btn btn-outline-gold"><i class="bi bi-instagram"></i></a>
            <a href="#" class="btn btn-outline-gold"><i class="bi bi-youtube"></i></a>
          </div>
        </div>
        <div class="col-lg-7">
          <div class="contact-card">
            <div class="row g-3">
              <div class="col-md-6">
                <label class="form-label">First Name</label>
                <input type="text" class="form-control" placeholder="John" />
              </div>
              <div class="col-md-6">
                <label class="form-label">Last Name</label>
                <input type="text" class="form-control" placeholder="Smith" />
              </div>
              <div class="col-md-6">
                <label class="form-label">Work Email</label>
                <input type="email" class="form-control" placeholder="john@company.com" />
              </div>
              <div class="col-md-6">
                <label class="form-label">Phone</label>
                <input type="tel" class="form-control" placeholder="+91 ##########" />
              </div>
              <div class="col-12">
                <label class="form-label">Expected Delegates</label>
                <select class="form-select">
                  <option value="">Select range</option>
                  <option>Under 500</option>
                  <option>500 – 2,000</option>
                  <option>2,000 – 10,000</option>
                  <option>10,000+</option>
                </select>
              </div>
              <div class="col-12">
                <label class="form-label">Tell us about your event</label>
                <textarea class="form-control" rows="4"
                  placeholder="Conference name, date, venue, requirements..."></textarea>
              </div>
              <div class="col-12 mt-2">
                <button class="btn btn-gold w-100 py-3" style="font-size:.95rem;">
                  Send Message &nbsp;<i class="bi bi-send"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ═══════════════════════════════ FOOTER ═══════════════════════════════ -->
  <footer>
    <div class="container">
      <p>@2025 <span>Confynex</span>. All rights reserved. Crafted with precision for world-class conferences.</p>
    </div>
  </footer>

  <!--<div class="modal fade" id="signupModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg">
      <div class="modal-content">

        <form method="post" id="registrationForm" action="registerHost" enctype="multipart/form-data" class="needs-validation" novalidate>

          <div class="modal-header px-4 pt-4 border-0">
            <h5 class="modal-title">
              <i class="bi bi-person-plus me-2"></i>Create Your Account
            </h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
          </div>

          <div class="modal-body px-4 pb-4">
            <p class="text-white-50 mb-4" style="font-size:.88rem;">
              Join Confynex and start managing world-class conferences.
            </p>

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
                  <span class="text-white-50" style="font-size:.8rem;">
                    Coordinators List (upload Excel file)
                  </span>
                </label>
                <input type="file" class="form-control" name="excelFile" id="excelFile" accept=".xls,.xlsx" />
                <small class="text-white-50 d-block mt-2">Accepted formats: .xls, .xlsx</small>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Password</label>
                <div class="position-relative">
                  <input type="password" class="form-control pe-5" id="password" name="password" placeholder="Create a strong password" />
                  <i class="bi bi-eye-slash toggle-password" toggle="#password" style="position:absolute; top:50%; right:15px; transform:translateY(-50%); cursor:pointer; color:#ccc;"></i>
                  <div class="invalid-feedback">8-12 chars with uppercase, lowercase, number & special char.</div>
                </div>
              </div>

              <div class="col-md-6 mb-3">
                <label class="form-label">Confirm Password</label>
                <div class="position-relative">
                  <input type="password" class="form-control pe-5" id="confirmPassword" name="confirm_password" placeholder="Confirm your password" />
                  <i class="bi bi-eye-slash toggle-password" toggle="#confirmPassword" style="position:absolute; top:50%; right:15px; transform:translateY(-50%); cursor:pointer; color:#ccc;"></i>
                  <div class="invalid-feedback">Passwords do not match.</div>
                </div>
              </div>

            </div>

            <button type="submit" class="btn btn-gold w-100 py-3 mb-3">
              Create Account <i class="bi bi-arrow-right ms-1"></i>
            </button>

            <p class="text-center text-white-50" style="font-size:.85rem;">
              Already have an account?
              <span class="modal-link" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#signinModal">Sign In</span>
            </p>

          </div>
        </form>

      </div>
    </div>
  </div>-->


  <<!-- ═══════════════════════════════ SIGN IN MODAL ═══════════════════════════════ -->
   <!--<div class="modal fade" id="signinModal" tabindex="-1">
     <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">

         <form action="signin" method="POST">

           <div class="modal-header px-4 pt-4 border-0">
             <h5 class="modal-title">
               <i class="bi bi-box-arrow-in-right me-2"></i>
               Welcome Back
             </h5>

             <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
           </div>

           <div class="modal-body px-4 pb-4">

             <p class="text-white-50 mb-4" style="font-size:.88rem;">
               Sign in to your Host dashboard.
             </p>

             <!-- Email -->
             <div class="mb-3">
               <label class="form-label">Email Address</label>
               <input
                 type="email"
                 name="email"
                 class="form-control"
                 placeholder="john@company.com"
                 required
               />
             </div>

             <!-- Password -->
             <div class="mb-2">
               <label class="form-label">Password</label>
               <input
                 type="password"
                 name="password"
                 class="form-control"
                 placeholder="Your password"
                 required
               />
             </div>

             <!-- Forgot Password -->
             <div class="text-end mb-4">
               <a href="forgotPassword.jsp"
                  class="text-decoration-none"
                  style="color:#c9a84c; font-size:0.9rem;">
                 Forgot Password?
               </a>
             </div>

             <!-- Sign In Button -->
             <button type="submit" class="btn btn-gold w-100 py-3 mb-3">
               Sign In <i class="bi bi-arrow-right ms-1"></i>
             </button>

             <!-- Sign Up Link -->
             <p class="text-center text-white-50 mb-0" style="font-size:.85rem;">
               Don't have an account?
               <span
                 class="modal-link"
                 data-bs-dismiss="modal"
                 data-bs-toggle="modal"
                 data-bs-target="#signupModal"
                 style="cursor:pointer;">
                 Sign Up
               </span>
             </p>

           </div>

         </form>

       </div>
     </div>
   </div>-->

  <!-- ═══════════════════════════════ COORDINATOR REGISTER MODAL ═══════════════════════════════ -->
  <!--<div class="modal fade" id="coordinatorModal" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
      <div class="modal-content">

        <!-- Feedback messages -->
        <h6 class="text-success text-center pt-3 px-4">${coordinatorSuccess}</h6>
        <h6 class="text-danger text-center px-4">${coordinatorFailed}</h6>
        <h6 class="text-danger text-center px-4">${coordinatorExists}</h6>

        <form method="post" action="registerCoordinator" enctype="multipart/form-data">

          <div class="modal-header px-4 pt-4 border-0">
            <h5 class="modal-title">
              <i class="bi bi-person-badge me-2"></i>Coordinator Registration
            </h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
          </div>

          <div class="modal-body px-4 pb-2">
            <p class="text-white-50 mb-4" style="font-size:.88rem;">
              Register as a Confynex coordinator to manage delegates and sessions for your assigned conference.
            </p>

            <div class="row">

              <!-- Timestamp (auto-filled, hidden) -->
              <input type="hidden" name="timestamp" id="coordinatorTimestamp" />

              <!-- Full Name -->
              <div class="col-md-6 mb-3">
                <label class="form-label">Full Name</label>
                <input
                  type="text"
                  class="form-control"
                  name="fullName"
                  placeholder="e.g. Priya Sharma"
                  required
                />
              </div>

              <!-- Email -->
              <div class="col-md-6 mb-3">
                <label class="form-label">Email Address</label>
                <input
                  type="email"
                  class="form-control"
                  name="email"
                  placeholder="priya@company.com"
                  required
                />
              </div>

              <!-- Organisation Name -->
              <div class="col-md-6 mb-3">
                <label class="form-label">Organisation Name</label>
                <input
                  type="text"
                  class="form-control"
                  name="organisationName"
                  placeholder="Your organisation"
                  required
                />
              </div>

              <!-- Phone Number -->
              <div class="col-md-6 mb-3">
                <label class="form-label">Phone Number</label>
                <input
                  type="tel"
                  class="form-control"
                  name="phoneNumber"
                  placeholder="+91 98765 43210"
                  required
                />
              </div>

              <!-- Designation -->
              <div class="col-md-6 mb-3">
                <label class="form-label">Designation</label>
                <input
                  type="text"
                  class="form-control"
                  name="designation"
                  placeholder="e.g. Event Manager"
                  required
                />
              </div>

              <!-- LinkedIn URL -->
              <div class="col-md-6 mb-3">
                <label class="form-label">LinkedIn Profile URL</label>
                <input
                  type="url"
                  class="form-control"
                  name="linkedInUrl"
                  placeholder="https://linkedin.com/in/yourprofile"
                />
              </div>

              <!-- Excel File Upload -->
              <div class="col-12 mb-3">
                <label class="form-label">
                  Delegate / Coordinator Data
                  <span class="text-white-50" style="font-size:.78rem; font-weight:400;"> — upload Excel file</span>
                </label>
                <input
                  type="file"
                  class="form-control"
                  name="excelFile"
                  accept=".xls,.xlsx"
                />
                <small class="text-white-50 d-block mt-1">Accepted formats: .xls, .xlsx</small>
              </div>

            </div><!-- /row -->
          </div><!-- /modal-body -->

          <div class="modal-footer border-0 px-4 pb-4 pt-1 flex-column gap-2">

            <!-- Submit -->
            <button type="submit" class="btn btn-gold w-100 py-3" style="font-size:.95rem;">
              Register as Coordinator &nbsp;<i class="bi bi-arrow-right"></i>
            </button>

            <!-- Cross-links -->
            <p class="text-center text-white-50 mb-0" style="font-size:.85rem;">
              Already have an account?
              <span class="modal-link"
                    data-bs-dismiss="modal"
                    data-bs-toggle="modal"
                    data-bs-target="#signinModal">
                Sign In
              </span>
              &nbsp;·&nbsp;
              <span class="modal-link"
                    data-bs-dismiss="modal"
                    data-bs-toggle="modal"
                    data-bs-target="#signupModal">
                Host Sign Up
              </span>
            </p>

          </div>

        </form>

      </div>
    </div>
  </div>

  <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="registrationToast" class="toast align-items-center text-white border-0" role="alert" aria-live="assertive" aria-atomic="true">
      <div class="d-flex">
        <div class="toast-body" id="toastMessage">
          </div>
        <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
    </div>
  </div>-->
  <!-- ═══════════════════════════════ END COORDINATOR MODAL ═══════════════════════════════ -->


  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    // Active nav link on scroll
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-link');
    window.addEventListener('scroll', () => {
      let current = '';
      sections.forEach(sec => {
        if (window.scrollY >= sec.offsetTop - 100) current = sec.getAttribute('id');
      });
      navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href') === '#' + current) link.classList.add('active');
      });
    });
  </script>

  <script>
    // Show / Hide Password
    document.querySelectorAll('.toggle-password').forEach(icon => {
      icon.addEventListener('click', function () {
        const input = document.querySelector(this.getAttribute('toggle'));
        if (input.type === 'password') {
          input.type = 'text';
          this.classList.remove('bi-eye-slash');
          this.classList.add('bi-eye');
        } else {
          input.type = 'password';
          this.classList.remove('bi-eye');
          this.classList.add('bi-eye-slash');
        }
      });
    });

    // Auto-fill coordinator timestamp on modal open
    const coordinatorModal = document.getElementById('coordinatorModal');
    if (coordinatorModal) {
      coordinatorModal.addEventListener('show.bs.modal', () => {
        const ts = document.getElementById('coordinatorTimestamp');
        if (ts) ts.value = new Date().toISOString().slice(0, 19).replace('T', ' ');
      });
    }




    document.addEventListener("DOMContentLoaded", function () {

        // --- 1. FIELD-BY-FIELD BLUR VALIDATION ---
        const rules = {
            full_name: /^[A-Za-z\s]{3,}$/,
            company_name: /^[A-Za-z\s]{4,}$/,
            email: /^[a-zA-Z0-9._%+-]+@gmail\.com$/,
            phone: /^[6-9][0-9]{9}$/,
            conference_title: /^[A-Za-z\s]{3,}$/,
            venue: /^[A-Za-z0-9,./\s-]{4,}$/,
            password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,12}$/
        };

        function validateField(input) {
            const name = input.name;
            const value = input.value.trim();
            let isValid = true;

            if (rules[name]) {
                isValid = rules[name].test(value);
            } else if (name === 'conference_date') {
                isValid = value !== "";
            } else if (name === 'confirm_password') {
                const pwd = document.getElementById("password").value;
                isValid = value === pwd && value !== "";
            }

            if (!isValid) {
                input.classList.add("is-invalid");
                input.classList.remove("is-valid");
            } else {
                input.classList.remove("is-invalid");
                input.classList.add("is-valid");
            }
            return isValid;
        }

        // Attach blur event listeners to all fields inside the registration form
        const form = document.getElementById("registrationForm");
        const inputs = form.querySelectorAll("input, textarea");

        inputs.forEach(input => {
            if(input.type !== 'file' && input.type !== 'submit') {
                input.addEventListener("blur", function () {
                    validateField(input);
                });
            }
        });

        // Form submission validation trap
        form.addEventListener("submit", function (e) {
            let isFormValid = true;
            inputs.forEach(input => {
                if(input.type !== 'file' && input.type !== 'submit') {
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


        // --- 2. BACKEND RESPONSE POPUP (TOAST CONTROL) ---
        // Read messages delivered into JSP / Thymeleaf context from Controller redirects
        const successMsg = "${registerSuccess}";
        const failedMsg = "${registerFailed}";
        const existMsg = "${existData}";

        const toastEl = document.getElementById('registrationToast');
        const toastMessage = document.getElementById('toastMessage');

        // Check if Bootstrap 5 Toast is ready
        if (toastEl) {
            const bootstrapToast = new bootstrap.Toast(toastEl, { delay: 5000 });

            if (successMsg && successMsg.trim() !== "" && !successMsg.includes("{")) {
                toastEl.classList.add("bg-success");
                toastMessage.textContent = successMsg;
                bootstrapToast.show();
            } else if (failedMsg && failedMsg.trim() !== "" && !failedMsg.includes("{")) {
                toastEl.classList.add("bg-danger");
                toastMessage.textContent = failedMsg;
                bootstrapToast.show();
            } else if (existMsg && existMsg.trim() !== "" && !existMsg.includes("{")) {
                toastEl.classList.add("bg-warning", "text-dark");
                toastMessage.textContent = existMsg;
                bootstrapToast.show();
            }
        }
    });
  </script>

</body>

</html>
