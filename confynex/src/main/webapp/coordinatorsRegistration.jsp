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
      color: rgba(255, 255, 255, .85);
      background: var(--dark);
      overflow-x: hidden;
    }

    h1, h2, h3, h4, h5 {
      font-family: 'Playfair Display', serif;
    }

    /* ── NAVBAR ── */
    .navbar {
      background: rgba(7, 15, 30, .97);
      backdrop-filter: blur(16px);
      border-bottom: 1px solid rgba(201, 168, 76, .12);
      padding: 14px 0;
      position: sticky;
      top: 0;
      z-index: 1000;
      transition: box-shadow .3s ease;
    }

    .navbar.scrolled {
      box-shadow: 0 4px 40px rgba(0, 0, 0, .4);
    }

    .navbar-brand {
      font-family: 'Playfair Display', serif;
      font-size: 1.65rem;
      font-weight: 900;
      color: var(--gold) !important;
      letter-spacing: .04em;
      position: relative;
    }

    .navbar-brand span {
      color: #fff;
    }

    .nav-link {
      color: rgba(255, 255, 255, .78) !important;
      font-weight: 500;
      font-size: .85rem;
      letter-spacing: .06em;
      text-transform: uppercase;
      padding: 6px 14px !important;
      transition: color .25s, transform .2s;
      position: relative;
    }

    .nav-link::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      width: 0;
      height: 2px;
      background: var(--gold);
      transition: width .3s ease, left .3s ease;
    }

    .nav-link:hover::after,
    .nav-link.active::after {
      width: 60%;
      left: 20%;
    }

    .nav-link:hover,
    .nav-link.active {
      color: var(--gold) !important;
      transform: translateY(-1px);
    }

    .dropdown-menu {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .2);
      border-radius: 12px;
      min-width: 180px;
      padding: 8px;
      box-shadow: 0 16px 48px rgba(0, 0, 0, .45);
      animation: dropIn .25s ease;
    }

    @keyframes dropIn {
      from { opacity: 0; transform: translateY(-8px) scale(.97); }
      to { opacity: 1; transform: translateY(0) scale(1); }
    }

    .dropdown-item {
      color: rgba(255, 255, 255, .82);
      font-size: .88rem;
      font-weight: 500;
      letter-spacing: .04em;
      padding: 10px 18px;
      border-radius: 8px;
      transition: background .2s, color .2s, padding-left .25s;
    }

    .dropdown-item:hover {
      background: rgba(201, 168, 76, .12);
      color: var(--gold);
      padding-left: 22px;
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
      transition: opacity .25s, transform .2s, box-shadow .25s;
      position: relative;
      overflow: hidden;
    }

    .btn-gold::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,.25), transparent);
      transition: left .5s ease;
    }

    .btn-gold:hover::before {
      left: 100%;
    }

    .btn-gold:hover {
      opacity: .92;
      transform: translateY(-2px);
      box-shadow: 0 8px 28px rgba(201, 168, 76, .35);
      color: var(--navy);
    }

    .navbar-toggler {
      border-color: rgba(201, 168, 76, .4);
      padding: 6px 10px;
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
      box-shadow: 0 6px 24px rgba(201, 168, 76, .3);
    }

    /* ── PAGE HERO BANNER ── */
    .page-banner {
      background:
        linear-gradient(160deg, rgba(7, 15, 30, .94) 50%, rgba(11, 29, 58, .82) 100%),
        url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=1600&auto=format&fit=crop') center/cover no-repeat;
      padding: 90px 0 70px;
      position: relative;
      overflow: hidden;
    }

    .page-banner::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -20%;
      width: 600px;
      height: 600px;
      background: radial-gradient(circle, rgba(201, 168, 76, .06) 0%, transparent 70%);
      border-radius: 50%;
      animation: floatOrb 8s ease-in-out infinite;
    }

    .page-banner::after {
      content: '';
      position: absolute;
      bottom: -30%;
      left: -10%;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(201, 168, 76, .04) 0%, transparent 70%);
      border-radius: 50%;
      animation: floatOrb 10s ease-in-out infinite reverse;
    }

    @keyframes floatOrb {
      0%, 100% { transform: translate(0, 0) scale(1); }
      50% { transform: translate(30px, -20px) scale(1.05); }
    }

    .banner-decoration {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      pointer-events: none;
      overflow: hidden;
    }

    .banner-decoration .line {
      position: absolute;
      background: linear-gradient(180deg, rgba(201, 168, 76, .12), transparent);
      width: 1px;
    }

    .banner-decoration .line:nth-child(1) { left: 15%; height: 100%; animation: lineGrow 2s ease forwards; }
    .banner-decoration .line:nth-child(2) { left: 85%; height: 70%; top: 30%; animation: lineGrow 2.5s ease forwards .3s; opacity: .5; }

    @keyframes lineGrow {
      from { transform: scaleY(0); transform-origin: top; }
      to { transform: scaleY(1); transform-origin: top; }
    }

    .banner-tag {
      display: inline-flex;
      align-items: center;
      background: rgba(201, 168, 76, .1);
      border: 1px solid rgba(201, 168, 76, .3);
      color: var(--gold);
      font-size: .76rem;
      font-weight: 600;
      letter-spacing: .14em;
      text-transform: uppercase;
      border-radius: 50px;
      padding: 7px 20px;
      margin-bottom: 20px;
      animation: fadeUp .6s ease forwards;
      opacity: 0;
    }

    .banner-title {
      font-size: clamp(2rem, 4.5vw, 3.4rem);
      color: #fff;
      line-height: 1.12;
      margin-bottom: 16px;
      animation: fadeUp .6s ease forwards .15s;
      opacity: 0;
    }

    .banner-title em {
      font-style: normal;
      background: linear-gradient(90deg, var(--gold), var(--gold-lt));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      position: relative;
    }

    .banner-title em::after {
      content: '';
      position: absolute;
      bottom: 2px;
      left: 0;
      width: 100%;
      height: 3px;
      background: linear-gradient(90deg, var(--gold), transparent);
      border-radius: 2px;
    }

    .banner-sub {
      font-size: 1.02rem;
      color: rgba(255, 255, 255, .55);
      max-width: 540px;
      line-height: 1.8;
      animation: fadeUp .6s ease forwards .3s;
      opacity: 0;
    }

    .banner-stats {
      display: flex;
      gap: 40px;
      margin-top: 30px;
      animation: fadeUp .6s ease forwards .45s;
      opacity: 0;
    }

    .banner-stat {
      text-align: left;
    }

    .banner-stat-number {
      font-family: 'Playfair Display', serif;
      font-size: 1.8rem;
      font-weight: 900;
      color: var(--gold);
      line-height: 1;
    }

    .banner-stat-label {
      font-size: .75rem;
      color: rgba(255, 255, 255, .4);
      text-transform: uppercase;
      letter-spacing: .1em;
      margin-top: 4px;
    }

    @keyframes fadeUp {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    /* ── FORM SECTION ── */
    .form-section {
      background: var(--dark);
      padding: 80px 0 100px;
      position: relative;
      overflow: hidden;
    }

    .form-section::before {
      content: '';
      position: absolute;
      top: -200px;
      right: -200px;
      width: 500px;
      height: 500px;
      background: radial-gradient(circle, rgba(201, 168, 76, .04) 0%, transparent 70%);
      border-radius: 50%;
      pointer-events: none;
    }

    .form-section::after {
      content: '';
      position: absolute;
      bottom: -150px;
      left: -150px;
      width: 400px;
      height: 400px;
      background: radial-gradient(circle, rgba(201, 168, 76, .05) 0%, transparent 70%);
      border-radius: 50%;
      pointer-events: none;
    }

    .form-card {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .15);
      border-radius: 28px;
      padding: 52px 48px;
      box-shadow:
        0 32px 80px rgba(11, 29, 58, .18),
        0 0 0 1px rgba(201, 168, 76, .05),
        inset 0 1px 0 rgba(255, 255, 255, .03);
      position: relative;
      overflow: hidden;
      animation: cardReveal .8s ease forwards;
      opacity: 0;
      height: 100%;
    }

    @keyframes cardReveal {
      from { opacity: 0; transform: translateY(30px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-card::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 3px;
      background: linear-gradient(90deg, transparent, var(--gold), var(--gold-lt), var(--gold), transparent);
      border-radius: 28px 28px 0 0;
    }

    .form-card-icon {
      width: 56px;
      height: 56px;
      background: linear-gradient(135deg, rgba(201, 168, 76, .15), rgba(201, 168, 76, .05));
      border: 1px solid rgba(201, 168, 76, .2);
      border-radius: 16px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.5rem;
      color: var(--gold);
      margin-bottom: 20px;
    }

    .form-card-title {
      font-size: 1.8rem;
      color: #fff;
      margin-bottom: 6px;
      letter-spacing: -.01em;
    }

    .form-card-sub {
      font-size: .9rem;
      color: rgba(255, 255, 255, .4);
      margin-bottom: 36px;
      line-height: 1.6;
    }

    /* Progress Bar */
    .form-progress {
      margin-bottom: 32px;
    }

    .progress-steps {
      display: flex;
      justify-content: space-between;
      position: relative;
      margin-bottom: 8px;
    }

    .progress-steps::before {
      content: '';
      position: absolute;
      top: 16px;
      left: 24px;
      right: 24px;
      height: 2px;
      background: rgba(255, 255, 255, .08);
    }

    .progress-steps::after {
      content: '';
      position: absolute;
      top: 16px;
      left: 24px;
      width: var(--progress-width, 0%);
      max-width: calc(100% - 48px);
      height: 2px;
      background: linear-gradient(90deg, var(--gold), var(--gold-lt));
      transition: width .4s ease;
    }

    .step-dot {
      width: 34px;
      height: 34px;
      border-radius: 50%;
      background: rgba(255, 255, 255, .06);
      border: 2px solid rgba(255, 255, 255, .12);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: .7rem;
      font-weight: 700;
      color: rgba(255, 255, 255, .35);
      position: relative;
      z-index: 1;
      transition: all .3s ease;
    }

    .step-dot.active {
      border-color: var(--gold);
      background: rgba(201, 168, 76, .15);
      color: var(--gold);
      box-shadow: 0 0 16px rgba(201, 168, 76, .2);
    }

    .step-dot.completed {
      border-color: var(--gold);
      background: var(--gold);
      color: var(--navy);
    }

    .step-labels {
      display: flex;
      justify-content: space-between;
    }

    .step-label {
      font-size: .7rem;
      color: rgba(255, 255, 255, .3);
      text-align: center;
      width: 34px;
      transition: color .3s;
    }

    .step-label.active {
      color: var(--gold);
    }

    /* Form Controls */
    .form-control,
    .form-select {
      background: rgba(255, 255, 255, .05) !important;
      border: 1px solid rgba(255, 255, 255, .1) !important;
      color: #fff !important;
      border-radius: 12px !important;
      padding: 13px 18px !important;
      font-size: .92rem !important;
      font-family: 'DM Sans', sans-serif;
      transition: all .3s ease !important;
    }

    .form-control::placeholder {
      color: rgba(255, 255, 255, .22) !important;
    }

    .form-control:focus,
    .form-select:focus {
      background: rgba(255, 255, 255, .08) !important;
      box-shadow: 0 0 0 3px rgba(201, 168, 76, .15), 0 4px 16px rgba(201, 168, 76, .08) !important;
      border-color: rgba(201, 168, 76, .4) !important;
      outline: none;
      transform: translateY(-1px);
    }

    .form-control.is-valid {
      border-color: rgba(40, 167, 69, .5) !important;
    }

    .form-control.is-valid:focus {
      box-shadow: 0 0 0 3px rgba(40, 167, 69, .15) !important;
    }

    .form-control.is-invalid {
      border-color: rgba(220, 53, 69, .5) !important;
    }

    .form-control.is-invalid:focus {
      box-shadow: 0 0 0 3px rgba(220, 53, 69, .15) !important;
    }

    .form-label {
      color: rgba(255, 255, 255, .55);
      font-size: .84rem;
      font-weight: 500;
      margin-bottom: 8px;
      transition: color .2s;
    }

    .form-group:hover .form-label,
    .form-control:focus ~ .form-label {
      color: rgba(255, 255, 255, .8);
    }

    .field-divider {
      border-color: rgba(255, 255, 255, .06);
      margin: 30px 0;
      position: relative;
    }

    .section-label {
      font-size: .72rem;
      font-weight: 700;
      letter-spacing: .16em;
      text-transform: uppercase;
      color: var(--gold);
      margin-bottom: 22px;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .section-label::after {
      content: '';
      flex: 1;
      height: 1px;
      background: linear-gradient(90deg, rgba(201, 168, 76, .25), transparent);
      margin-left: 12px;
    }

    /* File Upload */
    .file-upload-area {
      border: 2px dashed rgba(201, 168, 76, .2);
      border-radius: 16px;
      padding: 32px;
      text-align: center;
      transition: all .3s ease;
      cursor: pointer;
      position: relative;
      background: rgba(201, 168, 76, .02);
    }

    .file-upload-area:hover {
      border-color: rgba(201, 168, 76, .4);
      background: rgba(201, 168, 76, .05);
    }

    .file-upload-area.drag-over {
      border-color: var(--gold);
      background: rgba(201, 168, 76, .08);
      transform: scale(1.01);
    }

    .file-upload-icon {
      font-size: 2rem;
      color: var(--gold);
      margin-bottom: 10px;
      opacity: .7;
    }

    .file-upload-text {
      color: rgba(255, 255, 255, .5);
      font-size: .88rem;
    }

    .file-upload-text strong {
      color: var(--gold);
    }

    .file-upload-area input[type="file"] {
      position: absolute;
      inset: 0;
      opacity: 0;
      cursor: pointer;
    }

    .file-name-display {
      margin-top: 12px;
      padding: 8px 16px;
      background: rgba(201, 168, 76, .1);
      border-radius: 8px;
      color: var(--gold);
      font-size: .84rem;
      display: none;
      align-items: center;
      gap: 8px;
    }

    .file-name-display.show {
      display: inline-flex;
    }

    /* Submit Button */
    .btn-submit {
      background: linear-gradient(135deg, var(--gold), var(--gold-lt), var(--gold));
      background-size: 200% 200%;
      color: var(--navy);
      font-weight: 700;
      border: none;
      border-radius: 14px;
      padding: 16px;
      font-size: .96rem;
      letter-spacing: .06em;
      text-transform: uppercase;
      transition: all .3s ease;
      position: relative;
      overflow: hidden;
    }

    .btn-submit::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255,255,255,.3), transparent);
      transition: left .6s ease;
    }

    .btn-submit:hover::before {
      left: 100%;
    }

    .btn-submit:hover {
      transform: translateY(-2px);
      box-shadow: 0 12px 36px rgba(201, 168, 76, .35);
      background-position: right center;
    }

    .btn-submit:active {
      transform: translateY(0);
    }

    /* Already link */
    .already-link {
      color: var(--gold-lt);
      font-size: .85rem;
      cursor: pointer;
      text-decoration: none;
      transition: color .2s, text-shadow .2s;
      position: relative;
    }

    .already-link::after {
      content: '';
      position: absolute;
      bottom: -2px;
      left: 0;
      width: 0;
      height: 1px;
      background: var(--gold);
      transition: width .3s ease;
    }

    .already-link:hover {
      color: var(--gold);
      text-shadow: 0 0 12px rgba(201, 168, 76, .3);
    }

    .already-link:hover::after {
      width: 100%;
    }

    /* ── SIDEBAR INFO CARD (Why Join) ── */
    .info-card {
      background: var(--navy);
      border: 1px solid rgba(201, 168, 76, .15);
      border-radius: 28px;
      padding: 44px 36px;
      color: #fff;
      box-shadow:
        0 32px 80px rgba(11, 29, 58, .18),
        0 0 0 1px rgba(201, 168, 76, .05);
      position: sticky;
      top: 100px;
      height: 100%;
      animation: cardReveal .8s ease forwards .1s;
      opacity: 0;
    }

    .info-card-title {
      font-size: 1.4rem;
      color: #fff;
      margin-bottom: 10px;
    }

    .info-card-sub {
      font-size: .86rem;
      color: rgba(255, 255, 255, .45);
      line-height: 1.7;
      margin-bottom: 0;
    }

    .info-list {
      list-style: none;
      padding: 0;
      margin: 28px 0 0;
    }

    .info-list li {
      display: flex;
      align-items: flex-start;
      gap: 14px;
      padding: 16px 0;
      border-bottom: 1px solid rgba(255, 255, 255, .06);
    }

    .info-list li:last-child {
      border-bottom: none;
      padding-bottom: 0;
    }

    .info-icon {
      width: 40px;
      height: 40px;
      border-radius: 11px;
      background: rgba(201, 168, 76, .12);
      border: 1px solid rgba(201, 168, 76, .2);
      display: flex;
      align-items: center;
      justify-content: center;
      color: var(--gold);
      flex-shrink: 0;
      font-size: 1.05rem;
    }

    .info-list-title {
      font-size: .92rem;
      font-weight: 600;
      color: #fff;
      margin-bottom: 3px;
    }

    .info-list-text {
      font-size: .8rem;
      color: rgba(255, 255, 255, .45);
      line-height: 1.55;
    }

    .info-stats-row {
      margin-top: 28px;
      padding-top: 26px;
      border-top: 1px solid rgba(255, 255, 255, .08);
    }

    .info-stat-number {
      font-family: 'Playfair Display', serif;
      font-size: 1.35rem;
      font-weight: 900;
      color: var(--gold);
      line-height: 1;
    }

    .info-stat-label {
      font-size: .66rem;
      color: rgba(255, 255, 255, .4);
      text-transform: uppercase;
      letter-spacing: .08em;
      margin-top: 4px;
    }

    @media (max-width: 991px) {
      .info-card {
        position: static;
        height: auto;
      }
    }

    /* ── FOOTER ── */
    footer {
      background: var(--dark);
      padding: 32px 0;
      border-top: 1px solid rgba(201, 168, 76, .08);
      text-align: center;
      color: rgba(255, 255, 255, .3);
      font-size: .82rem;
      position: relative;
    }

    footer::before {
      content: '';
      position: absolute;
      top: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 120px;
      height: 2px;
      background: linear-gradient(90deg, transparent, var(--gold), transparent);
    }

    footer span {
      color: var(--gold);
      font-weight: 600;
    }

    html {
      scroll-behavior: smooth;
    }

    /* ── TOAST ── */
    .toast {
      border-radius: 14px !important;
      font-size: .9rem;
      backdrop-filter: blur(12px);
    }

    .toast.bg-success { background: rgba(25, 135, 84, .92) !important; }
    .toast.bg-danger { background: rgba(220, 53, 69, .92) !important; }
    .toast.bg-warning { background: rgba(255, 193, 7, .92) !important; }

    /* ── ALERT ── */
    .alert {
      backdrop-filter: blur(8px);
      animation: fadeUp .5s ease forwards;
    }

    /* ── RESPONSIVE ── */
    @media(max-width: 991px) {
      .form-card {
        padding: 32px 22px;
      }

      .banner-stats {
        gap: 24px;
      }

      .form-card::before {
        height: 2px;
      }
    }

    @media(max-width: 576px) {
      .banner-stats {
        flex-direction: column;
        gap: 14px;
      }

      .page-banner {
        padding: 60px 0 50px;
      }

      .form-section {
        padding: 50px 0 70px;
      }

      .step-label {
        font-size: .6rem;
      }
    }

    /* ── CUSTOM SCROLLBAR ── */
    ::-webkit-scrollbar {
      width: 8px;
    }
    ::-webkit-scrollbar-track {
      background: var(--dark);
    }
    ::-webkit-scrollbar-thumb {
      background: rgba(201, 168, 76, .3);
      border-radius: 4px;
    }
    ::-webkit-scrollbar-thumb:hover {
      background: rgba(201, 168, 76, .5);
    }

    /* ── SELECTION ── */
    ::selection {
      background: rgba(201, 168, 76, .25);
      color: #fff;
    }

    /* ── LOADING SPINNER ── */
    .spinner-gold {
      display: inline-block;
      width: 20px;
      height: 20px;
      border: 2px solid rgba(11, 29, 58, .3);
      border-top-color: var(--navy);
      border-radius: 50%;
      animation: spin .6s linear infinite;
      vertical-align: middle;
      margin-right: 8px;
      display: none;
    }

    @keyframes spin {
      to { transform: rotate(360deg); }
    }
  </style>
</head>

<body>

  <!-- ═══════════════════════════════ NAVBAR ═══════════════════════════════ -->
  <nav class="navbar navbar-expand-lg" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="index.jsp">Confy<span>nex</span></a>

      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navMain">
        <ul class="navbar-nav mx-auto gap-1">

          <li class="nav-item"><a class="nav-link" href="index.jsp#who">Who We Are</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#what">What We Do</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#how">How We Do It</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#work">Our Work</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#features">Features</a></li>
          <li class="nav-item"><a class="nav-link" href="index.jsp#contact">Contact Us</a></li>
        </ul>

        <div class="ms-3">
            <a href="index.jsp" class="btn btn-gold">
                <i class="bi bi-house-door-fill me-1"></i> Home
            </a>
        </div>
      </div>
    </div>
  </nav>

  <!-- ═══════════════════════════════ PAGE BANNER ═══════════════════════════════ -->
  <div class="page-banner">
    <div class="banner-decoration">
      <div class="line"></div>
      <div class="line"></div>
    </div>
    <div class="container position-relative" style="z-index:1">
      <div class="banner-tag"><i class="bi bi-person-badge me-1"></i> Coordinator Portal</div>
      <h1 class="banner-title">Register as a <em>Coordinator</em></h1>
      <p class="banner-sub">
        Join the Confynex team as a certified coordinator and help deliver world-class conference experiences to thousands of delegates.
      </p>
      <div class="banner-stats">
        <div class="banner-stat">
          <div class="banner-stat-number">500+</div>
          <div class="banner-stat-label">Coordinators</div>
        </div>
        <div class="banner-stat">
          <div class="banner-stat-number">120+</div>
          <div class="banner-stat-label">Events Managed</div>
        </div>
        <div class="banner-stat">
          <div class="banner-stat-number">98%</div>
          <div class="banner-stat-label">Satisfaction Rate</div>
        </div>
      </div>
    </div>
  </div>

  <!-- ═══════════════════════════════ FORM SECTION ═══════════════════════════════ -->
  <section class="form-section">
    <div class="container">

      <!-- Feedback messages -->
      <c:if test="${not empty coordinatorSuccess}">
        <div class="alert text-center mb-4" style="background:rgba(25,135,84,.12); border:1px solid rgba(25,135,84,.25); color:#75dd9a; border-radius:14px; padding:16px;">
          <i class="bi bi-check-circle-fill me-2" style="font-size:1.1rem;"></i>${coordinatorSuccess}
        </div>
      </c:if>
      <c:if test="${not empty coordinatorFailed}">
        <div class="alert text-center mb-4" style="background:rgba(220,53,69,.1); border:1px solid rgba(220,53,69,.25); color:#f08080; border-radius:14px; padding:16px;">
          <i class="bi bi-exclamation-triangle-fill me-2" style="font-size:1.1rem;"></i>${coordinatorFailed}
        </div>
      </c:if>
      <c:if test="${not empty coordinatorExists}">
        <div class="alert text-center mb-4" style="background:rgba(255,193,7,.08); border:1px solid rgba(255,193,7,.25); color:#ffc107; border-radius:14px; padding:16px;">
          <i class="bi bi-info-circle-fill me-2" style="font-size:1.1rem;"></i>${coordinatorExists}
        </div>
      </c:if>

      <div class="row g-4 align-items-stretch justify-content-center">

        <!-- ── Why join sidebar ── -->
        <div class="col-lg-4 order-lg-2">
          <div class="info-card">
            <div class="form-card-icon">
              <i class="bi bi-stars"></i>
            </div>
            <h5 class="info-card-title">Why Join as a Coordinator?</h5>
            <p class="info-card-sub">
              Become part of a growing network of certified professionals delivering exceptional conference experiences worldwide.
            </p>

            <ul class="info-list">
              <li>
                <div class="info-icon"><i class="bi bi-calendar2-check"></i></div>
                <div>
                  <div class="info-list-title">Flexible Engagements</div>
                  <div class="info-list-text">Coordinate events on your own schedule, locally or remotely.</div>
                </div>
              </li>
              <li>
                <div class="info-icon"><i class="bi bi-award"></i></div>
                <div>
                  <div class="info-list-title">Certified Recognition</div>
                  <div class="info-list-text">Earn an official Confynex Coordinator certificate.</div>
                </div>
              </li>
              <li>
                <div class="info-icon"><i class="bi bi-people"></i></div>
                <div>
                  <div class="info-list-title">Industry Network</div>
                  <div class="info-list-text">Connect with hosts, delegates and partners across every event.</div>
                </div>
              </li>
              <li>
                <div class="info-icon"><i class="bi bi-graph-up-arrow"></i></div>
                <div>
                  <div class="info-list-title">Performance Incentives</div>
                  <div class="info-list-text">Unlock rewards based on delegate satisfaction scores.</div>
                </div>
              </li>
            </ul>

            <div class="row info-stats-row text-center g-3">
              <div class="col-4">
                <div class="info-stat-number">500+</div>
                <div class="info-stat-label">Coordinators</div>
              </div>
              <div class="col-4">
                <div class="info-stat-number">120+</div>
                <div class="info-stat-label">Events</div>
              </div>
              <div class="col-4">
                <div class="info-stat-number">98%</div>
                <div class="info-stat-label">Satisfaction</div>
              </div>
            </div>
          </div>
        </div>

        <!-- ── Registration form ── -->
        <div class="col-lg-8 order-lg-1">
          <div class="form-card">

            <div class="form-card-icon">
              <i class="bi bi-person-badge"></i>
            </div>
            <h4 class="form-card-title">Coordinator Registration</h4>
            <p class="form-card-sub">Fill in your details below. All fields marked are required.</p>

            <!-- Progress Steps -->
            <div class="form-progress">
              <div class="progress-steps" style="--progress-width: 0%">
                <div class="step-dot active" data-step="1">1</div>
                <div class="step-dot" data-step="2">2</div>
                <div class="step-dot" data-step="3">3</div>
              </div>
              <div class="step-labels">
                <span class="step-label active">Personal</span>
                <span class="step-label">Organisation</span>
                <span class="step-label">Upload</span>
              </div>
            </div>

            <form method="post" id="coordinatorForm" action="registerCoordinator" enctype="multipart/form-data" class="needs-validation" novalidate>

              <input type="hidden" name="timestamp" id="coordinatorTimestamp" />

              <div class="section-label"><i class="bi bi-person me-1"></i>Personal Details</div>
              <div class="row g-4">

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
              <div class="row g-4">

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
              <div class="row g-4">

                <div class="col-12">
                  <label class="form-label">
                    Upload Excel File
                    <span style="color:rgba(255,255,255,.3); font-size:.78rem; font-weight:400;"> — delegate / coordinator list</span>
                  </label>
                  <div class="file-upload-area" id="fileUploadArea">
                    <input
                      type="file"
                      name="excelFile"
                      id="excelFile"
                      accept=".xls,.xlsx"
                    />
                    <div class="file-upload-icon"><i class="bi bi-cloud-arrow-up"></i></div>
                    <div class="file-upload-text">
                      <strong>Click to upload</strong> or drag and drop<br/>
                      <small style="opacity:.6;">Accepted formats: .xls, .xlsx</small>
                    </div>
                  </div>
                  <div class="file-name-display" id="fileNameDisplay">
                    <i class="bi bi-file-earmark-spreadsheet"></i>
                    <span id="fileNameText"></span>
                    <i class="bi bi-x-circle" style="cursor:pointer; margin-left:auto;" id="removeFile"></i>
                  </div>
                </div>

              </div>

              <hr class="field-divider" />

              <button type="submit" class="btn btn-submit w-100" id="submitBtn">
                <span class="spinner-gold" id="submitSpinner"></span>
                <span id="submitText">Register as Coordinator</span>
                &nbsp;<i class="bi bi-arrow-right" id="submitArrow"></i>
              </button>

              <p class="text-center mt-4 mb-0" style="color:rgba(255,255,255,.35); font-size:.85rem;">
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
        <div class="toast-body" id="toastMessage"></div>
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
    document.addEventListener('DOMContentLoaded', () => {
      // 1. Auto-fill hidden timestamp
      const ts = document.getElementById('coordinatorTimestamp');
      if (ts) ts.value = new Date().toISOString().slice(0, 19).replace('T', ' ');

      // 2. Navbar scroll effect
      const navbar = document.getElementById('mainNav');
      window.addEventListener('scroll', () => {
        navbar.classList.toggle('scrolled', window.scrollY > 20);
      });

      // 3. Validation rules
      const rules = {
        fullName: /^[A-Za-z\s.'-]{3,}$/,
        email: /^[a-zA-Z0-9._%+-]+@gmail\.com$/,
        organisationName: /^[A-Za-z\s]{3,}$/,
        phoneNumber: /^[6-9][0-9]{9}$/,
        designation: /^[A-Za-z0-9\s.&()-]{2,}$/,
        linkedInUrl: /^(https?:\/\/)?(www\.)?linkedin\.com\/.*$/
      };

      // Field grouping for progress steps
      const stepFields = {
        1: ['fullName', 'email', 'phoneNumber', 'designation'],
        2: ['organisationName', 'linkedInUrl'],
        3: ['excelFile']
      };

      function validateField(input) {
        const name = input.name;
        const value = input.value.trim();
        let isValid = true;

        if (rules[name]) {
          if (name === 'linkedInUrl' && value === '') {
            isValid = true;
          } else {
            isValid = rules[name].test(value);
          }
        } else if (input.hasAttribute('required')) {
          isValid = value !== '';
        }

        if (!isValid) {
          input.classList.add('is-invalid');
          input.classList.remove('is-valid');
        } else {
          input.classList.remove('is-invalid');
          if (value !== '') {
            input.classList.add('is-valid');
          } else {
            input.classList.remove('is-valid');
          }
        }
        updateProgress();
        return isValid;
      }

      // 4. Progress bar update
      function updateProgress() {
        let completedSteps = 0;

        for (let step = 1; step <= 3; step++) {
          const fields = stepFields[step];
          let stepComplete = true;

          fields.forEach(fieldName => {
            const input = document.getElementById(fieldName);
            if (input) {
              const value = input.value.trim();
              const isRequired = input.hasAttribute('required');

              if (isRequired && value === '') {
                stepComplete = false;
              } else if (value !== '' && rules[fieldName] && !rules[fieldName].test(value)) {
                stepComplete = false;
              }
            }
          });

          const dot = document.querySelector(`.step-dot[data-step="${step}"]`);
          const label = document.querySelectorAll('.step-label')[step - 1];

          if (stepComplete && fields.some(f => {
            const inp = document.getElementById(f);
            return inp && inp.value.trim() !== '';
          })) {
            completedSteps++;
            dot.classList.add('completed');
            dot.classList.remove('active');
            dot.innerHTML = '<i class="bi bi-check2" style="font-size:.75rem;"></i>';
            label.classList.add('active');
          } else if (!stepComplete && completedSteps === step - 1) {
            dot.classList.add('active');
            dot.classList.remove('completed');
            dot.textContent = step;
            label.classList.add('active');
          } else {
            dot.classList.remove('active', 'completed');
            dot.textContent = step;
            label.classList.remove('active');
          }
        }

        const progressPercent = (completedSteps / 3) * 100;
        document.querySelector('.progress-steps').style.setProperty('--progress-width', progressPercent + '%');
      }

      // Attach real-time listeners
      const form = document.getElementById('coordinatorForm');
      const inputs = form.querySelectorAll('input, textarea');

      inputs.forEach(input => {
        if (input.type !== 'file' && input.type !== 'hidden' && input.type !== 'submit') {
          input.addEventListener('blur', () => validateField(input));
          input.addEventListener('input', () => {
            if (input.classList.contains('is-invalid')) {
              validateField(input);
            }
          });
        }
      });

      // 5. File upload drag & drop
      const fileArea = document.getElementById('fileUploadArea');
      const fileInput = document.getElementById('excelFile');
      const fileNameDisplay = document.getElementById('fileNameDisplay');
      const fileNameText = document.getElementById('fileNameText');
      const removeFileBtn = document.getElementById('removeFile');

      ['dragenter', 'dragover'].forEach(e => {
        fileArea.addEventListener(e, (ev) => {
          ev.preventDefault();
          fileArea.classList.add('drag-over');
        });
      });

      ['dragleave', 'drop'].forEach(e => {
        fileArea.addEventListener(e, (ev) => {
          ev.preventDefault();
          fileArea.classList.remove('drag-over');
        });
      });

      fileArea.addEventListener('drop', (ev) => {
        const files = ev.dataTransfer.files;
        if (files.length) {
          fileInput.files = files;
          showFileName(files[0].name);
        }
      });

      fileInput.addEventListener('change', () => {
        if (fileInput.files.length) {
          showFileName(fileInput.files[0].name);
        }
        updateProgress();
      });

      function showFileName(name) {
        fileNameText.textContent = name;
        fileNameDisplay.classList.add('show');
        fileArea.style.display = 'none';
      }

      removeFileBtn.addEventListener('click', () => {
        fileInput.value = '';
        fileNameDisplay.classList.remove('show');
        fileArea.style.display = '';
        updateProgress();
      });

      // 6. Submit
      const submitBtn = document.getElementById('submitBtn');
      const submitSpinner = document.getElementById('submitSpinner');
      const submitTextEl = document.getElementById('submitText');
      const submitArrow = document.getElementById('submitArrow');

      form.addEventListener('submit', (e) => {
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

          // Shake animation on invalid
          submitBtn.style.animation = 'none';
          submitBtn.offsetHeight;
          submitBtn.style.animation = 'shake .4s ease';

          // Scroll to first invalid
          const firstInvalid = form.querySelector('.is-invalid');
          if (firstInvalid) {
            firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
            firstInvalid.focus();
          }
        } else {
          // Show loading state
          submitSpinner.style.display = 'inline-block';
          submitTextEl.textContent = 'Registering...';
          submitArrow.style.display = 'none';
          submitBtn.style.pointerEvents = 'none';
          submitBtn.style.opacity = '.8';
        }
      });

      // 7. Backend toast messages
      const successMsg = "${coordinatorSuccess}";
      const failedMsg = "${coordinatorFailed}";
      const existMsg = "${coordinatorExists}";

      const toastEl = document.getElementById('coordinatorToast');
      const toastMessage = document.getElementById('toastMessage');

      if (toastEl && typeof bootstrap !== 'undefined') {
        const bootstrapToast = new bootstrap.Toast(toastEl, { delay: 6000 });

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

      // Initial progress
      updateProgress();
    });

    // Shake keyframe (injected via JS since it's used dynamically)
    const shakeStyle = document.createElement('style');
    shakeStyle.textContent = `
      @keyframes shake {
        0%, 100% { transform: translateX(0); }
        20% { transform: translateX(-6px); }
        40% { transform: translateX(6px); }
        60% { transform: translateX(-4px); }
        80% { transform: translateX(4px); }
      }
    `;
    document.head.appendChild(shakeStyle);
  </script>

</body>
</html>
