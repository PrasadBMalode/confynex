<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delegate Login – Confynex</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700;900&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --bg-deep:      #0d1117;
            --bg-card:      #131a26;
            --gold:         #c9a227;
            --gold-light:   #e2b84a;
            --gold-dim:     rgba(201, 162, 39, 0.18);
            --text-primary: #f0ece2;
            --text-muted:   #8a95a3;
            --border:       rgba(201, 162, 39, 0.22);
            --border-focus: rgba(201, 162, 39, 0.7);
            --error:        #e05c5c;
            --success:      #4caf8a;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-deep);
            color: var(--text-primary);
            min-height: 100vh;
        }

        h1, h2, h3, h4, h5 {
            font-family: 'Playfair Display', serif;
        }

        /* ── NAVBAR ─────────────────────────────────── */
        .navbar {
            background: rgba(13, 17, 23, 0.92);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border);
            padding: 18px 0;
        }

        .navbar-brand {
            font-family: 'Playfair Display', serif;
            font-size: 1.7rem;
            font-weight: 700;
            color: var(--text-primary) !important;
            letter-spacing: 0.01em;
        }

        .navbar-brand span {
            color: var(--gold);
        }

        .nav-link {
            color: var(--text-muted) !important;
            font-size: .85rem;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            padding: 8px 16px !important;
            transition: color .2s;
        }

        .nav-link:hover,
        .nav-link.active {
            color: var(--gold) !important;
        }

        /* ── BACKGROUND ─────────────────────────────── */
        .bg-wrapper {
            position: fixed;
            inset: 0;
            z-index: -1;
            background:
                radial-gradient(ellipse 60% 50% at 15% 60%, rgba(201,162,39,0.07) 0%, transparent 60%),
                radial-gradient(ellipse 50% 40% at 85% 30%, rgba(201,162,39,0.05) 0%, transparent 55%),
                linear-gradient(160deg, #0d1117 0%, #111827 50%, #0d1117 100%);
        }

        .bg-grid {
            position: absolute;
            inset: 0;
            background-image:
                linear-gradient(rgba(201,162,39,0.04) 1px, transparent 1px),
                linear-gradient(90deg, rgba(201,162,39,0.04) 1px, transparent 1px);
            background-size: 48px 48px;
            mask-image: radial-gradient(ellipse 80% 80% at 50% 50%, black 30%, transparent 100%);
        }

        /* ── PAGE LAYOUT ─────────────────────────────── */
        .page-wrap {
            min-height: calc(100vh - 85px);
            display: flex;
            align-items: center;
            padding: 60px 0;
        }

        /* ── CARD ────────────────────────────────────── */
        .login-card {
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 50px 46px 44px;
            box-shadow:
                0 0 0 1px rgba(255,255,255,0.03) inset,
                0 24px 64px rgba(0,0,0,0.55),
                0 0 80px rgba(201,162,39,0.05);
            position: relative;
            overflow: hidden;
        }

        .login-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
        }

        /* badge */
        .badge-gold {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: var(--gold-dim);
            border: 1px solid var(--border);
            border-radius: 30px;
            padding: 6px 16px;
            font-size: .72rem;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--gold-light);
            margin-bottom: 22px;
        }

        .card-title {
            font-size: 2rem;
            font-weight: 700;
            line-height: 1.2;
            color: var(--text-primary);
            margin-bottom: 8px;
        }

        .card-title em {
            font-style: normal;
            color: var(--gold);
        }

        .card-sub {
            font-size: .9rem;
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 30px;
        }

        hr.gold-divider {
            border: none;
            border-top: 1px solid var(--border);
            margin: 0 0 28px;
        }

        /* ── FORM ────────────────────────────────────── */
        .form-label {
            font-size: .72rem;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 8px;
        }

        .input-group-text {
            background: rgba(255,255,255,0.04);
            border: 1px solid var(--border);
            color: var(--text-muted);
            border-radius: 10px 0 0 10px !important;
        }

        .form-control {
            background: rgba(255,255,255,0.04) !important;
            border: 1px solid var(--border) !important;
            color: var(--text-primary) !important;
            padding: 13px 16px !important;
            font-size: .92rem !important;
            letter-spacing: 0.02em;
        }

        .form-control::placeholder {
            color: rgba(138,149,163,0.5);
        }

        .form-control:focus {
            border-color: var(--border-focus) !important;
            background: rgba(201,162,39,0.05) !important;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.1) !important;
        }

        /* Kill browser autofill white/yellow background */
        .form-control:-webkit-autofill,
        .form-control:-webkit-autofill:hover,
        .form-control:-webkit-autofill:focus,
        .form-control:-webkit-autofill:active {
            -webkit-text-fill-color: var(--text-primary) !important;
            caret-color: var(--text-primary) !important;
            box-shadow: 0 0 0 1000px rgba(255,255,255,0.04) inset !important;
            -webkit-box-shadow: 0 0 0 1000px rgba(255,255,255,0.04) inset !important;
            transition: background-color 9999s ease-in-out 0s;
        }

        .input-group:focus-within .input-group-text {
            border-color: var(--border-focus);
            color: var(--gold);
        }

        .input-group .btn-eye {
            background: rgba(255,255,255,0.04);
            border: 1px solid var(--border);
            border-left: none;
            color: var(--text-muted);
            border-radius: 0 10px 10px 0 !important;
            padding: 0 16px;
            transition: color .2s;
        }

        .input-group .btn-eye:hover,
        .input-group .btn-eye:focus {
            color: var(--gold);
            background: rgba(255,255,255,0.06);
            box-shadow: none;
        }

        .input-group:focus-within .btn-eye {
            border-color: var(--border-focus);
        }

        .pin-hint {
            font-size: .76rem;
            color: var(--text-muted);
            margin-top: 8px;
            letter-spacing: 0.02em;
        }

        .field-error {
            font-size: .76rem;
            color: var(--error);
            margin-top: 6px;
            display: block;
        }

        /* ── ALERTS ──────────────────────────────────── */
        .alert-gold-error {
            background: rgba(224,92,92,0.1);
            border: 1px solid rgba(224,92,92,0.3);
            color: #ef8f8f;
            border-radius: 10px;
            font-size: .85rem;
            padding: 12px 16px;
        }

        .alert-gold-success {
            background: rgba(76,175,138,0.1);
            border: 1px solid rgba(76,175,138,0.3);
            color: #6fcba7;
            border-radius: 10px;
            font-size: .85rem;
            padding: 12px 16px;
        }

        /* ── SUBMIT BUTTON ───────────────────────────── */
        .btn-login {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, var(--gold) 0%, #a8821c 100%);
            color: #0d1117;
            border: none;
            border-radius: 10px;
            font-size: .82rem;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            transition: filter .2s, transform .15s, box-shadow .2s;
            box-shadow: 0 4px 20px rgba(201,162,39,0.25);
            margin-top: 8px;
        }

        .btn-login:hover {
            filter: brightness(1.1);
            transform: translateY(-1px);
            box-shadow: 0 8px 28px rgba(201,162,39,0.35);
            color: #0d1117;
        }

        .btn-login:active {
            transform: translateY(0);
        }

        /* ── FOOTER LINKS ────────────────────────────── */
        .card-footer-links {
            margin-top: 26px;
            text-align: center;
            font-size: .82rem;
            color: var(--text-muted);
        }

        .card-footer-links a {
            color: var(--gold-light);
            text-decoration: none;
            font-weight: 500;
        }

        .card-footer-links a:hover {
            color: var(--gold);
            text-decoration: underline;
        }

        .dot-sep {
            margin: 0 10px;
            opacity: .4;
        }

        /* ── SECURITY STRIP ──────────────────────────── */
        .security-strip {
            margin-top: 22px;
            text-align: center;
            font-size: .72rem;
            color: rgba(138,149,163,0.55);
            letter-spacing: 0.03em;
        }

        /* ── SIDE PANEL ──────────────────────────────── */
        .side-panel {
            color: var(--text-primary);
            padding: 20px 20px 20px 0;
        }

        .side-icon {
            width: 52px;
            height: 52px;
            border-radius: 14px;
            background: var(--gold-dim);
            border: 1px solid var(--border);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--gold);
            font-size: 1.3rem;
            margin-bottom: 18px;
        }

        .side-panel h2 {
            font-size: 2.1rem;
            line-height: 1.25;
            margin-bottom: 16px;
        }

        .side-panel h2 em {
            font-style: normal;
            color: var(--gold);
        }

        .side-panel p.lead-text {
            font-size: .95rem;
            color: var(--text-muted);
            line-height: 1.8;
            max-width: 440px;
            margin-bottom: 32px;
        }

        .side-stats-row {
            display: flex;
            gap: 28px;
            margin-bottom: 32px;
            padding-bottom: 28px;
            border-bottom: 1px solid var(--border);
        }

        .side-stat-number {
            font-family: 'Playfair Display', serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--gold);
            line-height: 1;
        }

        .side-stat-label {
            font-size: .72rem;
            color: var(--text-muted);
            text-transform: uppercase;
            letter-spacing: 0.06em;
            margin-top: 6px;
            max-width: 110px;
        }

        .side-quote {
            background: rgba(255,255,255,0.03);
            border: 1px solid var(--border);
            border-radius: 16px;
            padding: 26px 24px;
            max-width: 460px;
            position: relative;
        }

        .side-quote-icon {
            font-size: 1.8rem;
            color: var(--gold);
            opacity: .55;
            line-height: 1;
            display: block;
            margin-bottom: 6px;
        }

        .side-quote-text {
            font-size: .92rem;
            color: var(--text-primary);
            line-height: 1.7;
            margin-bottom: 18px;
        }

        .side-quote-author {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .side-quote-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: var(--gold-dim);
            border: 1px solid var(--border);
            color: var(--gold-light);
            font-size: .75rem;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .side-quote-name {
            font-size: .82rem;
            font-weight: 600;
            color: var(--text-primary);
        }

        .side-quote-role {
            font-size: .72rem;
            color: var(--text-muted);
        }

        @media (max-width: 991px) {
            .side-panel { display: none; }
        }

        @media (max-width: 520px) {
            .login-card { padding: 36px 26px 32px; }
            .card-title { font-size: 1.6rem; }
        }
    </style>
</head>
<body>

    <!-- Background -->
    <div class="bg-wrapper">
        <div class="bg-grid"></div>
    </div>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <div class="d-flex justify-content-center position-relative w-100 align-items-center">
                <a href="index.jsp" class="navbar-brand position-absolute start-0">Confy<span>nex</span></a>

                <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" style="border-color: var(--border);">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse d-lg-flex justify-content-lg-center" id="navMain">
                    <ul class="navbar-nav gap-lg-2 text-center">
                        <li class="nav-item"><a class="nav-link" href="index.jsp#home">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#who">Who We Are</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#what">What We Do</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#how">How We Do It</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#work">Our Work</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#features">Features</a></li>
                        <li class="nav-item"><a class="nav-link" href="index.jsp#contact">Contact Us</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main -->
    <main class="page-wrap">
        <div class="container">
            <div class="row align-items-center justify-content-center g-5">

                <!-- Side info panel -->
                <div class="col-lg-5 side-panel">
                    <div class="side-icon"><i class="bi bi-shield-lock"></i></div>
                    <h2>Your conference,<br><em>one secure login away.</em></h2>
                    <p class="lead-text">
                        Access your personalised delegate dashboard — session schedules, entry badges, and certificates, all in one place.
                    </p>

                    <div class="side-stats-row">
                        <div class="side-stat">
                            <div class="side-stat-number">12K+</div>
                            <div class="side-stat-label">Delegates Onboarded</div>
                        </div>
                        <div class="side-stat">
                            <div class="side-stat-number">50+</div>
                            <div class="side-stat-label">Conferences Hosted</div>
                        </div>
                        <div class="side-stat">
                            <div class="side-stat-number">99.9%</div>
                            <div class="side-stat-label">Platform Uptime</div>
                        </div>
                    </div>

                    <div class="side-quote">
                        <i class="bi bi-quote side-quote-icon"></i>
                        <p class="side-quote-text">
                            Confynex turned a three-day, multi-track summit into a smooth, paperless experience for every delegate — from check-in to certificate.
                        </p>
                        <div class="side-quote-author">
                            <div class="side-quote-avatar">RM</div>
                            <div>
                                <div class="side-quote-name">Rhea Malhotra</div>
                                <div class="side-quote-role">Event Director, Summit Collective</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Login card -->
                <div class="col-lg-5 col-md-8">
                    <div class="login-card">

                        <div class="badge-gold"><i class="bi bi-lightning-charge-fill"></i> Delegate Portal</div>

                        <h1 class="card-title">Welcome back,<br><em>Delegate.</em></h1>
                        <p class="card-sub">Sign in to access your conference dashboard, session schedule, and badge details.</p>

                        <hr class="gold-divider">

                        <!-- Server-side error from servlet -->
                        <%
                            String errorMsg   = (String) request.getAttribute("error");
                            String successMsg = (String) request.getAttribute("success");
                        %>
                        <% if (errorMsg != null && !errorMsg.isEmpty()) { %>
                            <div class="alert-gold-error mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-exclamation-triangle-fill"></i> <%= errorMsg %>
                            </div>
                        <% } %>
                        <% if (successMsg != null && !successMsg.isEmpty()) { %>
                            <div class="alert-gold-success mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-check-circle-fill"></i> <%= successMsg %>
                            </div>
                        <% } %>

                        <c:if test="${not empty loginError}">
                            <div class="alert-gold-error mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-exclamation-triangle-fill"></i> ${loginError}
                            </div>
                        </c:if>

                        <!-- Client-side message -->
                        <div class="alert-gold-error mb-3 d-none align-items-center gap-2" id="clientError">
                            <i class="bi bi-exclamation-triangle-fill"></i> <span id="clientErrorText"></span>
                        </div>

                        <form id="loginForm" action="delegateLogin" method="post" novalidate>

                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email Address</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                                    <input
                                        type="email"
                                        id="email"
                                        name="email"
                                        class="form-control"
                                        placeholder="delegate@example.com"
                                        autocomplete="email"
                                        required
                                    >
                                </div>
                                <c:if test="${not empty emailError}">
                                    <span class="field-error">${emailError}</span>
                                </c:if>
                            </div>

                            <!-- 6-digit PIN -->
                            <div class="mb-2">
                                <label for="accessPIN" class="form-label">6-Digit Access PIN</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-key"></i></span>
                                    <input
                                        type="password"
                                        id="accessPIN"
                                        name="accessPIN"
                                        class="form-control"
                                        placeholder="••••••"
                                        maxlength="6"
                                        inputmode="numeric"
                                        autocomplete="current-password"
                                        required
                                    >
                                    <button type="button" class="btn btn-eye" id="togglePw" aria-label="Show PIN" title="Show PIN">
                                        <i class="bi bi-eye" id="toggleIcon"></i>
                                    </button>
                                </div>
                                <c:if test="${not empty accessPINError}">
                                    <span class="field-error">${accessPINError}</span>
                                </c:if>
                                <p class="pin-hint">Enter the 6-digit PIN sent to you during registration.</p>
                            </div>

                            <button type="submit" class="btn btn-login">
                                Access Dashboard <i class="bi bi-arrow-right ms-1"></i>
                            </button>
                        </form>

                        <div class="card-footer-links">
                            <a href="ForgotPinServlet">Forgot your PIN?</a>
                            <span class="dot-sep">·</span>
                            <a href="index.jsp">Back to Home</a>
                        </div>

                        <div class="security-strip">
                            <i class="bi bi-shield-check"></i> Secured with 256-bit encryption &nbsp;·&nbsp; Confynex Conference Intelligence Platform
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </main>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // Show / hide PIN
        const toggleBtn  = document.getElementById('togglePw');
        const toggleIcon = document.getElementById('toggleIcon');
        const pwInput    = document.getElementById('accessPIN');

        toggleBtn.addEventListener('click', () => {
            const isHidden = pwInput.type === 'password';
            pwInput.type = isHidden ? 'text' : 'password';
            toggleIcon.classList.toggle('bi-eye', !isHidden);
            toggleIcon.classList.toggle('bi-eye-slash', isHidden);
            toggleBtn.setAttribute('aria-label', isHidden ? 'Hide PIN' : 'Show PIN');
            toggleBtn.setAttribute('title', isHidden ? 'Hide PIN' : 'Show PIN');
        });

        // Allow only numeric input for PIN
        pwInput.addEventListener('input', () => {
            pwInput.value = pwInput.value.replace(/\D/g, '').slice(0, 6);
        });

        // Client-side validation
        const form           = document.getElementById('loginForm');
        const emailInput     = document.getElementById('email');
        const clientError    = document.getElementById('clientError');
        const clientErrorTxt = document.getElementById('clientErrorText');

        function showError(msg) {
            clientErrorTxt.textContent = msg;
            clientError.classList.remove('d-none');
            clientError.classList.add('d-flex');
        }

        function clearError() {
            clientError.classList.add('d-none');
            clientError.classList.remove('d-flex');
        }

        form.addEventListener('submit', (e) => {
            clearError();

            const email = emailInput.value.trim();
            const pin   = pwInput.value.trim();
            const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            if (!email) {
                e.preventDefault();
                showError('Please enter your registered email address.');
                emailInput.focus();
                return;
            }

            if (!emailPattern.test(email)) {
                e.preventDefault();
                showError('Enter a valid email address (e.g. name@domain.com).');
                emailInput.focus();
                return;
            }

            if (!pin || pin.length < 6) {
                e.preventDefault();
                showError('Your PIN must be exactly 6 digits.');
                pwInput.focus();
                return;
            }
        });

        // Clear error on input change
        [emailInput, pwInput].forEach(el => {
            el.addEventListener('input', clearError);
        });
    </script>

</body>
</html>
