<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password – Confynex</title>

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
            animation: fadeSlideUp .6s ease both;
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

        .btn-home-pill {
            background-color: var(--gold);
            color: #0d1117;
            border: none;
            border-radius: 30px;
            padding: .55rem 1.5rem;
            font-weight: 700;
            font-size: .78rem;
            letter-spacing: .08em;
            text-transform: uppercase;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: .45rem;
            transition: background-color .2s ease, transform .15s ease, box-shadow .2s ease;
        }

        .btn-home-pill:hover {
            background-color: var(--gold-light);
            color: #0d1117;
            transform: translateY(-1px);
            box-shadow: 0 8px 24px rgba(201,162,39,0.3);
        }

        /* ── BACKGROUND ─────────────────────────────── */
        .bg-wrapper {
            position: fixed;
            inset: 0;
            z-index: -2;
            overflow: hidden;
            background-color: var(--bg-deep);
        }

        .bg-photo {
            position: absolute;
            inset: -20px;
            background-image:
                linear-gradient(160deg, rgba(13,17,23,0.90) 0%, rgba(13,17,23,0.82) 45%, rgba(13,17,23,0.93) 100%),
                url('https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=1920&q=80');
            background-size: cover;
            background-position: center;
            filter: saturate(0.9) brightness(0.85);
            animation: kenburns 32s ease-in-out infinite alternate;
        }

        @keyframes kenburns {
            0%   { transform: scale(1) translate(0, 0); }
            100% { transform: scale(1.12) translate(-1.5%, -1%); }
        }

        .bg-grid {
            position: absolute;
            inset: 0;
            z-index: -1;
            background-image:
                linear-gradient(rgba(201,162,39,0.05) 1px, transparent 1px),
                linear-gradient(90deg, rgba(201,162,39,0.05) 1px, transparent 1px);
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

        /* ── ENTRANCE ANIMATIONS ──────────────────────── */
        @keyframes fadeSlideUp {
            0%   { opacity: 0; transform: translateY(28px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        @keyframes shimmer {
            0%   { background-position: 0% 0; }
            100% { background-position: -200% 0; }
        }

        .reset-card {
            animation: fadeSlideUp .8s ease .15s both;
        }

        /* ── CARD ────────────────────────────────────── */
        .reset-card {
            background: rgba(19, 26, 38, 0.88);
            backdrop-filter: blur(6px);
            border: 1px solid var(--border);
            border-radius: 24px;
            padding: 50px 46px 44px;
            box-shadow:
                0 0 0 1px rgba(255,255,255,0.03) inset,
                0 24px 64px rgba(0,0,0,0.55),
                0 0 80px rgba(201,162,39,0.05);
            position: relative;
            overflow: hidden;
            transition: box-shadow .35s ease;
        }

        .reset-card:hover {
            box-shadow:
                0 0 0 1px rgba(255,255,255,0.04) inset,
                0 28px 72px rgba(0,0,0,0.6),
                0 0 100px rgba(201,162,39,0.09);
        }

        .reset-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, transparent, var(--gold), var(--gold-light), var(--gold), transparent);
            background-size: 200% 100%;
            animation: shimmer 6s linear infinite;
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
            transition: box-shadow .2s, border-color .2s, background .2s;
        }

        .form-control::placeholder {
            color: rgba(138,149,163,0.5);
        }

        .form-control:focus {
            border-color: var(--border-focus) !important;
            background: rgba(201,162,39,0.05) !important;
            box-shadow: 0 0 0 3px rgba(201,162,39,0.1) !important;
        }

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

        .field-error {
            font-size: .76rem;
            color: var(--error);
            margin-top: 6px;
            display: block;
        }

        .pw-hint {
            font-size: .76rem;
            color: var(--text-muted);
            margin-top: 8px;
            letter-spacing: 0.02em;
        }

        /* Password strength meter */
        .pw-strength {
            display: flex;
            gap: 6px;
            margin-top: 10px;
        }

        .pw-strength span {
            height: 4px;
            flex: 1;
            border-radius: 2px;
            background: rgba(255,255,255,0.08);
            transition: background .25s ease;
        }

        .pw-strength.weak span:nth-child(1) { background: var(--error); }
        .pw-strength.medium span:nth-child(1),
        .pw-strength.medium span:nth-child(2) { background: var(--gold); }
        .pw-strength.strong span { background: var(--success); }

        /* ── ALERTS ──────────────────────────────────── */
        .alert-gold-error {
            background: rgba(224,92,92,0.1);
            border: 1px solid rgba(224,92,92,0.3);
            color: #ef8f8f;
            border-radius: 10px;
            font-size: .85rem;
            padding: 12px 16px;
            animation: fadeSlideUp .4s ease both;
        }

        .alert-gold-success {
            background: rgba(76,175,138,0.1);
            border: 1px solid rgba(76,175,138,0.3);
            color: #6fcba7;
            border-radius: 10px;
            font-size: .85rem;
            padding: 12px 16px;
            animation: fadeSlideUp .4s ease both;
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

        /* ── SECURITY STRIP ──────────────────────────── */
        .security-strip {
            margin-top: 22px;
            text-align: center;
            font-size: .72rem;
            color: rgba(138,149,163,0.55);
            letter-spacing: 0.03em;
        }

        @media (prefers-reduced-motion: reduce) {
            .bg-photo,
            .navbar,
            .reset-card,
            .reset-card::before,
            .alert-gold-error,
            .alert-gold-success {
                animation: none !important;
            }
        }

        @media (max-width: 520px) {
            .reset-card { padding: 36px 26px 32px; }
            .card-title { font-size: 1.6rem; }
        }
    </style>
</head>
<body>

    <!-- Background -->
    <div class="bg-wrapper">
        <div class="bg-photo"></div>
        <div class="bg-grid"></div>
    </div>

    <!-- Navbar: title + Home button only -->
    <nav class="navbar">
        <div class="container d-flex align-items-center justify-content-between">
            <a href="index.jsp" class="navbar-brand mb-0">Confy<span>nex</span></a>
            <a href="index.jsp" class="btn-home-pill">
                <i class="bi bi-house-fill"></i> Home
            </a>
        </div>
    </nav>

    <!-- Main -->
    <main class="page-wrap">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-8">
                    <div class="reset-card">

                        <div class="badge-gold"><i class="bi bi-shield-lock-fill"></i> Password Reset</div>

                        <h1 class="card-title">Reset Your <em>Password</em></h1>
                        <p class="card-sub">Choose a new password to secure your Confynex account.</p>

                        <hr class="gold-divider">

                        <!-- Server-side messages from servlet -->
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

                        <c:if test="${not empty resetError}">
                            <div class="alert-gold-error mb-3 d-flex align-items-center gap-2">
                                <i class="bi bi-exclamation-triangle-fill"></i> ${resetError}
                            </div>
                        </c:if>

                        <!-- Client-side message -->
                        <div class="alert-gold-error mb-3 d-none align-items-center gap-2" id="clientError">
                            <i class="bi bi-exclamation-triangle-fill"></i> <span id="clientErrorText"></span>
                        </div>

                        <form id="resetForm" action="resetPassword" method="post" novalidate>

                            <!-- Reset token, populated by the server (e.g. from the emailed link) -->
                            <input type="hidden" name="token" value="${param.token}">

                            <!-- New Password -->
                            <div class="mb-3">
                                <label for="newPassword" class="form-label">New Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock"></i></span>
                                    <input
                                        type="password"
                                        id="newPassword"
                                        name="newPassword"
                                        class="form-control"
                                        placeholder="Create a strong password"
                                        autocomplete="new-password"
                                        required
                                    >
                                    <button type="button" class="btn btn-eye toggle-password" toggle="#newPassword" aria-label="Show password" title="Show password">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                                <div class="pw-strength" id="pwStrength"><span></span><span></span><span></span></div>
                                <p class="pw-hint">8–12 characters, with uppercase, lowercase, a number &amp; a special character.</p>
                                <c:if test="${not empty newPasswordError}">
                                    <span class="field-error">${newPasswordError}</span>
                                </c:if>
                            </div>

                            <!-- Confirm Password -->
                            <div class="mb-2">
                                <label for="confirmPassword" class="form-label">Confirm New Password</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                                    <input
                                        type="password"
                                        id="confirmPassword"
                                        name="confirmPassword"
                                        class="form-control"
                                        placeholder="Re-enter your new password"
                                        autocomplete="new-password"
                                        required
                                    >
                                    <button type="button" class="btn btn-eye toggle-password" toggle="#confirmPassword" aria-label="Show password" title="Show password">
                                        <i class="bi bi-eye"></i>
                                    </button>
                                </div>
                                <c:if test="${not empty confirmPasswordError}">
                                    <span class="field-error">${confirmPasswordError}</span>
                                </c:if>
                            </div>

                            <button type="submit" class="btn btn-login mt-4">
                                Reset Password <i class="bi bi-arrow-right ms-1"></i>
                            </button>
                        </form>

                        <div class="card-footer-links">
                            <a href="hostLogin.jsp">Back to Sign In</a>
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
        // Show / hide password toggles
        document.querySelectorAll('.toggle-password').forEach(function (btn) {
            btn.addEventListener('click', function () {
                var target = document.querySelector(btn.getAttribute('toggle'));
                var icon = btn.querySelector('i');
                var isHidden = target.type === 'password';
                target.type = isHidden ? 'text' : 'password';
                icon.classList.toggle('bi-eye', !isHidden);
                icon.classList.toggle('bi-eye-slash', isHidden);
                btn.setAttribute('aria-label', isHidden ? 'Hide password' : 'Show password');
                btn.setAttribute('title', isHidden ? 'Hide password' : 'Show password');
            });
        });

        // Password strength meter
        var newPasswordInput = document.getElementById('newPassword');
        var strengthBar = document.getElementById('pwStrength');

        newPasswordInput.addEventListener('input', function () {
            var val = newPasswordInput.value;
            var score = 0;
            if (val.length >= 8) score++;
            if (/[A-Z]/.test(val) && /[a-z]/.test(val)) score++;
            if (/\d/.test(val) && /[\W_]/.test(val)) score++;

            strengthBar.classList.remove('weak', 'medium', 'strong');
            if (val.length === 0) {
                // no class, empty bar
            } else if (score <= 1) {
                strengthBar.classList.add('weak');
            } else if (score === 2) {
                strengthBar.classList.add('medium');
            } else {
                strengthBar.classList.add('strong');
            }
        });

        // Client-side validation
        var form              = document.getElementById('resetForm');
        var confirmInput      = document.getElementById('confirmPassword');
        var clientError       = document.getElementById('clientError');
        var clientErrorTxt    = document.getElementById('clientErrorText');
        var passwordRegex     = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,12}$/;

        function showError(msg) {
            clientErrorTxt.textContent = msg;
            clientError.classList.remove('d-none');
            clientError.classList.add('d-flex');
        }

        function clearError() {
            clientError.classList.add('d-none');
            clientError.classList.remove('d-flex');
        }

        form.addEventListener('submit', function (e) {
            clearError();

            var pwd = newPasswordInput.value;
            var confirmPwd = confirmInput.value;

            if (!pwd) {
                e.preventDefault();
                showError('Please enter a new password.');
                newPasswordInput.focus();
                return;
            }

            if (!passwordRegex.test(pwd)) {
                e.preventDefault();
                showError('Password must be 8-12 characters with uppercase, lowercase, a number and a special character.');
                newPasswordInput.focus();
                return;
            }

            if (!confirmPwd) {
                e.preventDefault();
                showError('Please confirm your new password.');
                confirmInput.focus();
                return;
            }

            if (pwd !== confirmPwd) {
                e.preventDefault();
                showError('Passwords do not match.');
                confirmInput.focus();
                return;
            }
        });

        [newPasswordInput, confirmInput].forEach(function (el) {
            el.addEventListener('input', clearError);
        });
    </script>

</body>
</html>
