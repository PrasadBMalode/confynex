<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delegate Login – Confynex</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;600;700&family=Inter:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --bg-deep:      #0d1117;
            --bg-card:      #131a26;
            --bg-overlay:   rgba(13, 17, 23, 0.82);
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

        html, body {
            height: 100%;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--bg-deep);
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* ── NAVBAR ─────────────────────────────────── */
        nav {
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 100;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 60px;
            height: 85px;
            background: rgba(13, 17, 23, 0.92);
            backdrop-filter: blur(12px);
            border-bottom: 1px solid var(--border);
        }

        .nav-logo {
            display: flex;
            align-items: center;
            gap: 25px;
            text-decoration: none;
        }

        .nav-logo-icon {
            width: 42px;
            height: 42px;
            font-size: 20px;
            background: var(--gold-dim);
            border: 1px solid var(--border);
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;

        }

        .nav-logo-text {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            font-weight: 700;
            color: var(--text-primary);
            letter-spacing: 0.01em;
        }

        .nav-logo-text span {
            color: var(--gold);
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 42px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            font-size: 17px;
            font-weight: 600;
            color: var(--text-muted);
            letter-spacing: 0.06em;
            text-transform: uppercase;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: var(--gold);
        }

        /* ── BACKGROUND ─────────────────────────────── */
        .bg-wrapper {
            position: fixed;
            inset: 0;
            z-index: 0;
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
        .page {
            position: relative;
            z-index: 1;
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 100px 24px 48px;
        }

        /* ── CARD ────────────────────────────────────── */
        .card {
            width: 100%;
            max-width: 460px;
            background: var(--bg-card);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 48px 44px 44px;
            box-shadow:
                0 0 0 1px rgba(255,255,255,0.03) inset,
                0 24px 64px rgba(0,0,0,0.55),
                0 0 80px rgba(201,162,39,0.05);
        }

        /* badge */
        .badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            background: var(--gold-dim);
            border: 1px solid var(--border);
            border-radius: 30px;
            padding: 5px 14px;
            font-size: 10.5px;
            font-weight: 600;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            color: var(--gold-light);
            margin-bottom: 22px;
        }

        .badge::before {
            content: '⚡';
            font-size: 11px;
        }

        .card-title {
            font-family: 'Playfair Display', serif;
            font-size: 30px;
            font-weight: 700;
            line-height: 1.2;
            color: var(--text-primary);
            margin-bottom: 6px;
        }

        .card-title em {
            font-style: normal;
            color: var(--gold);
        }

        .card-sub {
            font-size: 13.5px;
            color: var(--text-muted);
            line-height: 1.55;
            margin-bottom: 36px;
        }

        /* ── DIVIDER ─────────────────────────────────── */
        .divider {
            height: 1px;
            background: var(--border);
            margin-bottom: 32px;
        }

        /* ── FORM ────────────────────────────────────── */
        .form-group {
            margin-bottom: 22px;
        }

        label {
            display: block;
            font-size: 11.5px;
            font-weight: 600;
            letter-spacing: 0.08em;
            text-transform: uppercase;
            color: var(--text-muted);
            margin-bottom: 8px;
        }

        .input-wrap {
            position: relative;
        }

        .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 15px;
            color: var(--text-muted);
            pointer-events: none;
            transition: color 0.2s;
        }

        input[type="email"],
        input[type="password"],
        input[type="text"] {
            width: 100%;
            background: rgba(255,255,255,0.04);
            border: 1px solid var(--border);
            border-radius: 10px;
            padding: 14px 16px 14px 44px;
            font-family: 'Inter', sans-serif;
            font-size: 14.5px;
            color: var(--text-primary);
            outline: none;
            transition: border-color 0.2s, background 0.2s, box-shadow 0.2s;
            letter-spacing: 0.02em;
        }

        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="text"]:focus {
            border-color: var(--border-focus);
            background: rgba(201,162,39,0.04);
            box-shadow: 0 0 0 3px rgba(201,162,39,0.08);
        }

        input[type="email"]:focus + .input-icon,
        input[type="password"]:focus + .input-icon {
            color: var(--gold);
        }

        /* flip icon to come after for sibling selector trick */
        .input-wrap input:focus ~ .input-icon {
            color: var(--gold);
        }

        input::placeholder {
            color: rgba(138,149,163,0.5);
        }

        /* 6-digit OTP style password */
        .pin-hint {
            font-size: 11px;
            color: var(--text-muted);
            margin-top: 6px;
            letter-spacing: 0.03em;
        }

        /* show/hide toggle */
        .toggle-pw {
            position: absolute;
            right: 14px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: var(--text-muted);
            font-size: 14px;
            padding: 2px 4px;
            border-radius: 4px;
            transition: color 0.2s;
            line-height: 1;
        }

        .toggle-pw:hover {
            color: var(--gold);
        }

        /* ── ERROR / SUCCESS MESSAGES ─────────────────── */
        .msg {
            display: none;
            align-items: center;
            gap: 8px;
            font-size: 12.5px;
            font-weight: 500;
            padding: 10px 14px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .msg.error {
            background: rgba(224,92,92,0.1);
            border: 1px solid rgba(224,92,92,0.3);
            color: #ef8f8f;
        }

        .msg.success {
            background: rgba(76,175,138,0.1);
            border: 1px solid rgba(76,175,138,0.3);
            color: #6fcba7;
        }

        .msg.show {
            display: flex;
        }

        /* ── SUBMIT BUTTON ───────────────────────────── */
        .btn-login {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, var(--gold) 0%, #a8821c 100%);
            color: #0d1117;
            border: none;
            border-radius: 10px;
            font-family: 'Inter', sans-serif;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.1em;
            text-transform: uppercase;
            cursor: pointer;
            transition: filter 0.2s, transform 0.15s, box-shadow 0.2s;
            box-shadow: 0 4px 20px rgba(201,162,39,0.25);
            margin-top: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-login:hover {
            filter: brightness(1.1);
            transform: translateY(-1px);
            box-shadow: 0 8px 28px rgba(201,162,39,0.35);
        }

        .btn-login:active {
            transform: translateY(0);
        }

        .btn-login .arrow {
            font-size: 14px;
            transition: transform 0.2s;
        }

        .btn-login:hover .arrow {
            transform: translateX(3px);
        }

        /* ── FOOTER LINKS ────────────────────────────── */
        .card-footer {
            margin-top: 28px;
            text-align: center;
            font-size: 12.5px;
            color: var(--text-muted);
        }

        .card-footer a {
            color: var(--gold-light);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.2s;
        }

        .card-footer a:hover {
            color: var(--gold);
            text-decoration: underline;
        }

        .dot-sep {
            margin: 0 10px;
            opacity: 0.4;
        }

        /* ── SECURITY STRIP ──────────────────────────── */
        .security-strip {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            margin-top: 24px;
            font-size: 11px;
            color: rgba(138,149,163,0.55);
            letter-spacing: 0.04em;
        }

        .security-strip::before {
            content: '🔒';
            font-size: 11px;
        }

        /* ── RESPONSIVE ──────────────────────────────── */
        @media (max-width: 520px) {
            nav { padding: 0 20px; }
            .nav-links { display: none; }
            .card { padding: 36px 24px 32px; }
            .card-title { font-size: 26px; }
        }
    </style>
</head>
<body>

    <!-- Background -->
    <div class="bg-wrapper">
        <div class="bg-grid"></div>
    </div>

    <!-- Navbar -->
    <nav>
        <a href="index.jsp" class="nav-logo">
            <div class="nav-logo-icon">✦</div>
            <div class="nav-logo-text">Confy<span>nex</span></div>
        </a>
        <ul class="nav-links">
            <li class="nav-item"><a class="nav-link" href="index.jsp#home">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#who">Who We Are</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#what">What We Do</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#how">How We Do It</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#work">Our Work</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#features">Features</a></li>
            <li class="nav-item"><a class="nav-link" href="index.jsp#contact">Contact Us</a></li>
        </ul>
    </nav>

    <!-- Main -->
    <main class="page">
        <div class="card">

            <div class="badge">Delegate Portal</div>

            <h1 class="card-title">Welcome back,<br><em>Delegate.</em></h1>
            <p class="card-sub">Sign in to access your conference dashboard, session schedule, and badge details.</p>

            <div class="divider"></div>

            <!-- Server-side error from servlet -->
            <%
                String errorMsg   = (String) request.getAttribute("error");
                String successMsg = (String) request.getAttribute("success");
            %>
            <div class="msg error <%= (errorMsg != null && !errorMsg.isEmpty()) ? "show" : "" %>">
                ⚠ <%= (errorMsg != null) ? errorMsg : "" %>
            </div>
            <div class="msg success <%= (successMsg != null && !successMsg.isEmpty()) ? "show" : "" %>">
                ✔ <%= (successMsg != null) ? successMsg : "" %>
            </div>

            <c:if test="${not empty loginError}">
                <div class="msg error show">
                    ⚠ ${loginError}
                </div>
            </c:if>

            <!-- Client-side message -->
            <div class="msg error" id="clientError"></div>

            <form id="loginForm" action="DelegateLoginServlet" method="post" novalidate>

                <!-- Email -->
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <div class="input-wrap">
                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="delegate@example.com"
                            autocomplete="email"
                            required
                        >
                        <span class="input-icon">✉</span>
                        <small class="text-danger">${emailError}

                    </div>
                </div>

                <!-- 6-digit PIN -->
                <div class="form-group">
                    <label for="password">6-Digit Access PIN</label>
                    <div class="input-wrap">
                        <input
                            type="password"
                                id="accessPIN"
                                name="accessPIN"
                                placeholder="••••••"
                                maxlength="6"
                            inputmode="numeric"
                            autocomplete="current-password"
                            required
                        >
                        <span class="input-icon">🔑</span>
                        <small class="text-danger">${accessPINError}

                        <button type="button" class="toggle-pw" id="togglePw" aria-label="Show PIN" title="Show PIN">
                            👁
                        </button>
                    </div>
                    <p class="pin-hint">Enter the 6-digit PIN sent to you during registration.</p>
                </div>

                <button type="submit" class="btn-login">
                    Access Dashboard <span class="arrow">→</span>
                </button>
            </form>

            <div class="card-footer">
                <a href="ForgotPinServlet">Forgot your PIN?</a>
                <span class="dot-sep">·</span>
                <a href="index.jsp">Back to Home</a>
            </div>

            <div class="security-strip">
                Secured with 256-bit encryption &nbsp;·&nbsp; Confynex Conference Intelligence Platform
            </div>

        </div>
    </main>

    <script>
        // Show / hide PIN
        const toggleBtn = document.getElementById('togglePw');
        const pwInput   = document.getElementById('password');

        toggleBtn.addEventListener('click', () => {
            const isHidden = pwInput.type === 'password';
            pwInput.type   = isHidden ? 'text' : 'password';
            toggleBtn.textContent = isHidden ? '🙈' : '👁';
            toggleBtn.setAttribute('aria-label', isHidden ? 'Hide PIN' : 'Show PIN');
        });

        // Allow only numeric input for PIN
        pwInput.addEventListener('input', () => {
            pwInput.value = pwInput.value.replace(/\D/g, '').slice(0, 6);
        });

        // Client-side validation
        const form        = document.getElementById('loginForm');
        const emailInput  = document.getElementById('email');
        const clientError = document.getElementById('clientError');

        function showError(msg) {
            clientError.textContent = '⚠ ' + msg;
            clientError.classList.add('show');
        }

        function clearError() {
            clientError.classList.remove('show');
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
