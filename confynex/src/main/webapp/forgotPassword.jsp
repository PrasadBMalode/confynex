<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confynex - Forgot Password</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Playfair+Display:wght@600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-primary: #0a0b12;
            --bg-secondary: #10111c;
            --bg-card: #12141f;
            --bg-input: #1a1c2a;
            --border-color: #262838;
            --border-focus: #d4af37;
            --accent: #d4af37;
            --accent-hover: #c9a227;
            --accent-glow: rgba(212, 175, 55, 0.25);
            --accent-dark-text: #1a1508;
            --text-primary: #f5f0e6;
            --text-secondary: #a8a29a;
            --text-muted: #6f7280;
            --success: #10b981;
            --success-bg: rgba(16, 185, 129, 0.12);
            --error: #ef4444;
            --error-bg: rgba(239, 68, 68, 0.12);
            --warning: #f59e0b;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--bg-primary);
            color: var(--text-primary);
            min-height: 100vh;
            overflow-x: hidden;
            position: relative;
        }

        /* ── Animated Background ── */
        .bg-photo {
            position: fixed;
            inset: 0;
            background-image: url('https://images.unsplash.com/photo-1762968274962-20c12e6e8ecd?q=80&w=1920&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            z-index: -2;
        }

        .bg-photo-overlay {
            position: fixed;
            inset: 0;
            background:
                linear-gradient(180deg, rgba(8, 9, 15, 0.88) 0%, rgba(8, 9, 15, 0.82) 45%, rgba(8, 9, 15, 0.94) 100%);
            z-index: -1;
        }

        .bg-grid {
            position: fixed;
            inset: 0;
            background-image:
                linear-gradient(rgba(212, 175, 55, 0.03) 1px, transparent 1px),
                linear-gradient(90deg, rgba(212, 175, 55, 0.03) 1px, transparent 1px);
            background-size: 60px 60px;
            z-index: 0;
        }

        .bg-glow-1 {
            position: fixed;
            width: 600px;
            height: 600px;
            background: radial-gradient(circle, rgba(212, 175, 55, 0.08) 0%, transparent 70%);
            top: -200px;
            right: -100px;
            border-radius: 50%;
            z-index: 0;
            animation: floatGlow 8s ease-in-out infinite;
        }

        .bg-glow-2 {
            position: fixed;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(184, 134, 11, 0.06) 0%, transparent 70%);
            bottom: -150px;
            left: -100px;
            border-radius: 50%;
            z-index: 0;
            animation: floatGlow 10s ease-in-out infinite reverse;
        }

        .bg-glow-3 {
            position: fixed;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(212, 175, 55, 0.05) 0%, transparent 70%);
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 50%;
            z-index: 0;
            animation: pulseGlow 4s ease-in-out infinite;
        }

        @keyframes floatGlow {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(30px, 20px) scale(1.1); }
        }

        @keyframes pulseGlow {
            0%, 100% { opacity: 0.5; transform: translate(-50%, -50%) scale(1); }
            50% { opacity: 1; transform: translate(-50%, -50%) scale(1.2); }
        }

        /* ── Navbar ── */
        .navbar-custom {
            background: rgba(16, 17, 28, 0.7);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--border-color);
            padding: 0.75rem 0;
            z-index: 100;
            position: relative;
        }

        .brand-logo {
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            font-weight: 800;
            color: var(--text-primary) !important;
            text-decoration: none;
            letter-spacing: -0.5px;
            display: inline-flex;
            align-items: center;
            gap: 0;
            transition: all 0.3s ease;
        }

        .brand-logo:hover {
            opacity: 0.9;
        }

        .brand-logo .brand-accent {
            color: var(--accent);
        }

        .nav-btn {
            border: 1px solid var(--border-color);
            background: transparent;
            color: var(--text-secondary);
            padding: 8px 20px;
            border-radius: 8px;
            font-family: 'Inter', sans-serif;
            font-size: 0.875rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.25s ease;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .nav-btn:hover {
            border-color: var(--accent);
            color: var(--accent);
            background: rgba(212, 175, 55, 0.06);
            transform: translateY(-1px);
        }

        .nav-btn-primary {
            background: var(--accent);
            border-color: var(--accent);
            color: var(--accent-dark-text);
            font-weight: 700;
        }

        .nav-btn-primary:hover {
            background: var(--accent-hover);
            border-color: var(--accent-hover);
            color: var(--accent-dark-text);
            box-shadow: 0 4px 20px var(--accent-glow);
        }

        /* ── Main Content ── */
        .main-wrapper {
            position: relative;
            z-index: 1;
            min-height: calc(100vh - 65px);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2.5rem 1rem;
        }

        /* ── Conference Details (above card) ── */
        .conference-banner {
            width: 100%;
            max-width: 620px;
            text-align: center;
            margin-bottom: 2rem;
        }

        .conference-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(212, 175, 55, 0.12);
            border: 1px solid rgba(212, 175, 55, 0.3);
            color: var(--accent);
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            padding: 6px 16px;
            border-radius: 999px;
            margin-bottom: 1rem;
        }

        .conference-title {
            font-family: 'Playfair Display', serif;
            font-size: 2rem;
            font-weight: 800;
            color: var(--text-primary);
            margin-bottom: 0.5rem;
            letter-spacing: -0.3px;
        }

        .conference-title .accent-text {
            color: var(--accent);
        }

        .conference-subtitle {
            color: var(--text-secondary);
            font-size: 0.95rem;
            max-width: 480px;
            margin: 0 auto 1.5rem;
            line-height: 1.6;
        }

        /* ── Card (Glassmorphism) ── */
        .forgot-card {
            width: 100%;
            max-width: 460px;
            background: rgba(19, 21, 32, 0.55);
            backdrop-filter: blur(22px);
            -webkit-backdrop-filter: blur(22px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 2.5rem;
            position: relative;
            overflow: hidden;
            box-shadow:
                0 4px 6px -1px rgba(0, 0, 0, 0.3),
                0 25px 50px -12px rgba(0, 0, 0, 0.55),
                inset 0 1px 0 rgba(255, 255, 255, 0.06);
        }

        .forgot-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--accent), #b8860b, transparent);
            opacity: 0.8;
        }

        /* ── Icon Circle ── */
        .icon-circle {
            width: 64px;
            height: 64px;
            border-radius: 16px;
            background: linear-gradient(135deg, rgba(212, 175, 55, 0.14), rgba(184, 134, 11, 0.08));
            border: 1px solid rgba(212, 175, 55, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 1.5rem;
            color: var(--accent);
            animation: iconFloat 3s ease-in-out infinite;
        }

        @keyframes iconFloat {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-4px); }
        }

        /* ── Headings ── */
        .card-title {
            font-family: 'Playfair Display', serif;
            font-size: 1.6rem;
            font-weight: 700;
            color: var(--text-primary);
            text-align: center;
            margin-bottom: 0.5rem;
            letter-spacing: -0.3px;
        }

        .card-subtitle {
            font-size: 0.9rem;
            color: var(--text-muted);
            text-align: center;
            line-height: 1.6;
            margin-bottom: 2rem;
        }

        .card-subtitle .email-highlight {
            color: var(--accent);
            font-weight: 600;
        }

        /* ── Form Controls ── */
        .form-label-custom {
            font-size: 0.8rem;
            font-weight: 600;
            color: var(--text-secondary);
            text-transform: uppercase;
            letter-spacing: 0.8px;
            margin-bottom: 0.5rem;
            display: block;
        }

        .input-group-custom {
            position: relative;
            margin-bottom: 1.5rem;
        }

        .input-group-custom .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-muted);
            font-size: 1.1rem;
            z-index: 2;
            transition: color 0.25s ease;
            pointer-events: none;
        }

        .form-control-custom {
            width: 100%;
            padding: 14px 14px 14px 44px;
            background: var(--bg-input);
            border: 1.5px solid var(--border-color);
            border-radius: 12px;
            color: var(--text-primary);
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-control-custom::placeholder {
            color: var(--text-muted);
            font-weight: 400;
        }

        .form-control-custom:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px var(--accent-glow);
            background: rgba(26, 28, 42, 0.9);
        }

        /* ── OTP Inputs ── */
        .otp-wrapper {
            display: flex;
            gap: 12px;
            justify-content: center;
            margin-bottom: 1.5rem;
        }

        .otp-input {
            width: 54px;
            height: 62px;
            text-align: center;
            font-size: 1.4rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            background: var(--bg-input);
            border: 1.5px solid var(--border-color);
            border-radius: 12px;
            color: var(--text-primary);
            outline: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            caret-color: var(--accent);
        }

        .otp-input:focus {
            border-color: var(--accent);
            box-shadow: 0 0 0 3px var(--accent-glow), 0 0 20px var(--accent-glow);
            transform: translateY(-3px) scale(1.04);
            background: rgba(26, 28, 42, 0.95);
        }

        .otp-input.filled {
            border-color: var(--accent);
            background: rgba(212, 175, 55, 0.08);
            animation: otpPop 0.25s ease;
        }

        .otp-input.error-shake {
            border-color: var(--error) !important;
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.2) !important;
            animation: shakeInput 0.5s ease;
        }

        .otp-input:disabled {
            opacity: 0.45;
            cursor: not-allowed;
        }

        @keyframes otpPop {
            0% { transform: scale(1); }
            50% { transform: scale(1.08); }
            100% { transform: scale(1); }
        }

        @keyframes shakeInput {
            0%, 100% { transform: translateX(0); }
            15% { transform: translateX(-8px); }
            30% { transform: translateX(6px); }
            45% { transform: translateX(-5px); }
            60% { transform: translateX(4px); }
            75% { transform: translateX(-2px); }
            90% { transform: translateX(1px); }
        }

        /* ── Primary Button ── */
        .btn-primary-custom {
            width: 100%;
            padding: 14px 24px;
            background: linear-gradient(135deg, var(--accent), #b8860b);
            border: none;
            border-radius: 12px;
            color: var(--accent-dark-text);
            font-family: 'Inter', sans-serif;
            font-size: 0.95rem;
            font-weight: 700;
            letter-spacing: 0.3px;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-primary-custom:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(212, 175, 55, 0.35);
        }

        .btn-primary-custom:active:not(:disabled) {
            transform: translateY(0);
        }

        .btn-primary-custom:disabled {
            opacity: 0.5;
            cursor: not-allowed;
        }

        /* ── Spinner ── */
        .spinner-custom {
            width: 20px;
            height: 20px;
            border: 2.5px solid rgba(26, 21, 8, 0.35);
            border-top-color: var(--accent-dark-text);
            border-radius: 50%;
            animation: spin 0.7s linear infinite;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        /* ── Resend Timer ── */
        .resend-section {
            text-align: center;
            margin-top: 1.25rem;
            font-size: 0.875rem;
            color: var(--text-muted);
        }

        .resend-link {
            color: var(--accent);
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.2s ease;
            background: none;
            border: none;
            font-family: 'Inter', sans-serif;
            font-size: 0.875rem;
            padding: 0;
        }

        .resend-link:hover:not(:disabled) {
            color: #eac35c;
            text-decoration: underline;
        }

        .resend-link:disabled {
            color: var(--text-muted);
            cursor: not-allowed;
        }

        .timer-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            background: rgba(212, 175, 55, 0.1);
            color: var(--accent);
            padding: 2px 10px;
            border-radius: 6px;
            font-weight: 600;
            font-size: 0.8rem;
            margin-left: 4px;
        }

        /* ── Back Link ── */
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.85rem;
            font-weight: 500;
            transition: all 0.2s ease;
            margin-top: 1.5rem;
        }

        .back-link:hover {
            color: var(--text-secondary);
            gap: 8px;
        }

        /* ── Step Sections ── */
        .step-section {
            display: none;
        }

        .step-section.active {
            display: block;
            animation: fadeSlideIn 0.45s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes fadeSlideIn {
            from {
                opacity: 0;
                transform: translateY(15px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* ── Step Indicator ── */
        .step-indicator {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-bottom: 2rem;
        }

        .step-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: var(--border-color);
            transition: all 0.3s ease;
        }

        .step-dot.active {
            background: var(--accent);
            box-shadow: 0 0 8px var(--accent-glow);
            width: 24px;
            border-radius: 4px;
        }

        .step-dot.done {
            background: var(--success);
        }

        .step-line {
            width: 40px;
            height: 2px;
            background: var(--border-color);
            border-radius: 1px;
        }

        .step-line.done {
            background: var(--success);
        }

        /* ── Footer Text ── */
        .footer-text {
            position: relative;
            z-index: 1;
            text-align: center;
            padding: 1.5rem;
            color: var(--text-muted);
            font-size: 0.78rem;
        }

        /* ── Responsive ── */
        @media (max-width: 576px) {
            .conference-title {
                font-size: 1.5rem;
            }

            .conference-subtitle {
                font-size: 0.85rem;
            }

            .forgot-card {
                padding: 1.75rem 1.5rem;
                border-radius: 16px;
            }

            .otp-input {
                width: 46px;
                height: 54px;
                font-size: 1.2rem;
            }

            .otp-wrapper {
                gap: 8px;
            }
        }

        /* ── Validation state ── */
        .form-control-custom.is-invalid {
            border-color: var(--error);
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.15);
        }

        .text-danger-custom {
            color: var(--error);
            font-size: 0.78rem;
            margin-top: 6px;
            display: block;
        }
    </style>
</head>
<body>

    <!-- Conference Background Photo -->
    <div class="bg-photo"></div>
    <div class="bg-photo-overlay"></div>

    <!-- Background Effects -->
    <div class="bg-grid"></div>
    <div class="bg-glow-1"></div>
    <div class="bg-glow-2"></div>
    <div class="bg-glow-3"></div>

    <!-- Navbar -->
    <nav class="navbar-custom">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <a href="#" class="brand-logo">
                    Confy<span class="brand-accent">nex</span>
                </a>
                <div class="d-flex align-items-center gap-2">
                   <a href="index.jsp#home" class="nav-btn nav-btn-primary">
                        <i class="bi bi-box-arrow-in-right"></i>
                        Home
                    </a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-wrapper">

        <!-- Conference Details -->
        <div class="conference-banner">
            <span class="conference-pill">
                <i class="bi bi-calendar-event"></i>
                Global Tech Summit 2026
            </span>
            <h1 class="conference-title">Confynex <span class="accent-text">Host Portal</span></h1>
            <p class="conference-subtitle">
                Three days of keynotes, workshops, and networking with 500+ speakers.
                Reset your password below to get back into your host dashboard.
            </p>
        </div>

        <div class="forgot-card">

            <!-- Step Indicator -->
            <div class="step-indicator">
                <div class="step-dot active" id="dot1"></div>
                <div class="step-line" id="line1"></div>
                <div class="step-dot" id="dot2"></div>
                <div class="step-line" id="line2"></div>
                <div class="step-dot" id="dot3"></div>
            </div>

            <!-- STEP 1: Email -->
            <div class="step-section active" id="stepEmail">
                <div class="icon-circle">
                    <i class="bi bi-envelope-lock"></i>
                </div>
                <h2 class="card-title">Forgot Password?</h2>
                <p class="card-subtitle">
                    No worries. Enter the email address associated with your account and we'll send you a verification code.
                </p>

                <form action="emailCheck" method="post" id="emailForm">
                    <div class="input-group-custom">
                        <label class="form-label-custom">Email Address</label>
                        <div style="position: relative;">
                            <input
                                type="email"
                                name="email"
                                class="form-control-custom"
                                id="email"
                                placeholder="you@example.com"
                                autocomplete="email"
                                required
                            >
                            <i class="bi bi-envelope input-icon" style="top: 50%;"></i>
                        </div>
                        <small class="text-danger-custom" id="emailErrorBox"></small>
                    </div>

                    <button type="button" class="btn-primary-custom" id="sendOtpBtn" onclick="sendOtp()">
                        <span id="sendOtpText">Send Verification Code</span>
                        <div class="spinner-custom" id="sendOtpSpinner" style="display: none;"></div>
                    </button>
                </form>

                <div class="text-center">
                    <a href="index.jsp#home" class="back-link">
                        <i class="bi bi-arrow-left"></i>
                        Back to Home
                    </a>
                </div>
            </div>

            <!-- STEP 2: OTP -->
            <div class="step-section" id="stepOtp">
                <div class="icon-circle">
                    <i class="bi bi-shield-lock"></i>
                </div>
                <h2 class="card-title">Enter Verification Code</h2>
                <p class="card-subtitle">
                    We've sent a 6-digit code to<br>
                    <span class="email-highlight" id="displayEmail">&nbsp;</span>
                </p>

                <form action="verifyOtp" method="post" id="otpForm" onsubmit="return validateOtpTime()">
                    <input type="hidden" name="email" id="otpEmail">
                    <input type="hidden" name="otp" id="otpValue">

                    <label class="form-label-custom" style="text-align: center;">Verification Code</label>
                    <div class="otp-wrapper" id="otpWrapper">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" autocomplete="one-time-code" data-index="0">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="1">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="2">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="3">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="4">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="5">
                    </div>
                    <small class="text-danger-custom text-center" id="otpErrorBox" style="display:block; text-align:center; margin-bottom: 0.5rem;">${otpError}</small>

                    <button type="submit" class="btn-primary-custom" id="verifyOtpBtn" disabled>
                        <span id="verifyOtpText">Verify Code</span>
                        <div class="spinner-custom" id="verifyOtpSpinner" style="display: none;"></div>
                    </button>
                </form>

                <div class="resend-section">
                    <span>Didn't receive the code?</span>
                    <button type="button" class="resend-link" id="resendBtn" onclick="resendOtp()" disabled>
                        Resend
                    </button>
                    <span class="timer-badge" id="timerBadge" style="display: none;">
                        <i class="bi bi-clock"></i>
                        <span id="timerText">00:30</span>
                    </span>
                </div>

                <div class="text-center">
                    <a href="#" class="back-link" id="changeEmailLink">
                        <i class="bi bi-arrow-left"></i>
                        Change email address
                    </a>
                </div>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <div class="footer-text">
        &copy; 2025 Confynex. All rights reserved.
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- OTP / EMAIL LOGIC (same behavior as the original verification page) -->
    <script>
        const stepEmail = document.getElementById('stepEmail');
        const stepOtp = document.getElementById('stepOtp');

        const dot1 = document.getElementById('dot1');
        const dot2 = document.getElementById('dot2');
        const dot3 = document.getElementById('dot3');
        const line1 = document.getElementById('line1');
        const line2 = document.getElementById('line2');

        const emailInput = document.getElementById('email');
        const emailErrorBox = document.getElementById('emailErrorBox');
        const sendOtpBtn = document.getElementById('sendOtpBtn');
        const sendOtpText = document.getElementById('sendOtpText');
        const sendOtpSpinner = document.getElementById('sendOtpSpinner');

        const otpEmail = document.getElementById('otpEmail');
        const otpValue = document.getElementById('otpValue');
        const displayEmail = document.getElementById('displayEmail');
        const otpInputs = document.querySelectorAll('.otp-input');
        const verifyOtpBtn = document.getElementById('verifyOtpBtn');
        const otpErrorBox = document.getElementById('otpErrorBox');

        const resendBtn = document.getElementById('resendBtn');
        const timerBadge = document.getElementById('timerBadge');
        const timerText = document.getElementById('timerText');
        const changeEmailLink = document.getElementById('changeEmailLink');

        let countdown = 30;
        let timerInterval;

        // ── Step switcher (visual only) ──
        function showStep(step) {
            stepEmail.classList.remove('active');
            stepOtp.classList.remove('active');

            if (step === 'email') {
                stepEmail.classList.add('active');
                dot1.className = 'step-dot active';
                dot2.className = 'step-dot';
                dot3.className = 'step-dot';
                line1.className = 'step-line';
                line2.className = 'step-line';
            } else if (step === 'otp') {
                stepOtp.classList.add('active');
                dot1.className = 'step-dot done';
                dot2.className = 'step-dot active';
                dot3.className = 'step-dot';
                line1.className = 'step-line done';
                line2.className = 'step-line';
            }
        }

        // ── Timer (same logic as original) ──
        function startTimer() {
            resendBtn.disabled = true;
            timerBadge.style.display = 'inline-flex';

            timerInterval = setInterval(() => {
                if (countdown <= 0) {
                    clearInterval(timerInterval);
                    timerText.textContent = "Expired";
                    resendBtn.disabled = false;

                    otpInputs.forEach(inp => inp.disabled = true);

                    return;
                }

                const m = String(Math.floor(countdown / 60)).padStart(2, '0');
                const s = String(countdown % 60).padStart(2, '0');
                timerText.textContent = m + ":" + s;
                countdown--;
            }, 1000);
        }

        // ── Block submit if OTP expired (same logic as original) ──
        function validateOtpTime() {
            if (countdown <= 0) {
                otpErrorBox.innerHTML = "Wrong OTP or Time expired! Please resend OTP.";
                return false;
            }
            return true;
        }

        // ── Combine the 6 boxes into the hidden otp field the server reads ──
        function syncOtpValue() {
            let val = "";
            otpInputs.forEach(inp => val += inp.value);
            otpValue.value = val;
            verifyOtpBtn.disabled = (val.length < 6);
        }

        otpInputs.forEach((input, index) => {
            input.addEventListener('input', function () {
                this.value = this.value.replace(/[^0-9]/g, '').charAt(0) || '';

                if (this.value) {
                    this.classList.add('filled');
                    this.classList.remove('error-shake');
                    if (index < otpInputs.length - 1) {
                        otpInputs[index + 1].focus();
                    }
                } else {
                    this.classList.remove('filled');
                }
                syncOtpValue();
            });

            input.addEventListener('keydown', function (e) {
                if (e.key === 'Backspace' && !this.value && index > 0) {
                    otpInputs[index - 1].focus();
                    otpInputs[index - 1].value = '';
                    otpInputs[index - 1].classList.remove('filled');
                    syncOtpValue();
                }
            });

            input.addEventListener('paste', function (e) {
                e.preventDefault();
                const pasted = (e.clipboardData || window.clipboardData).getData('text').replace(/[^0-9]/g, '');
                if (pasted.length >= 6) {
                    otpInputs.forEach((inp, i) => {
                        inp.value = pasted.charAt(i);
                        inp.classList.add('filled');
                    });
                    otpInputs[5].focus();
                    syncOtpValue();
                }
            });

            input.addEventListener('focus', function () {
                this.select();
            });
        });

        // ── Send OTP: fetch("${pageContext.request.contextPath}/emailCheck", { (same logic as original) ──
        function sendOtp() {
            const email = emailInput.value;
            emailErrorBox.innerHTML = "";

            if (email === "") {
                emailErrorBox.innerHTML = "Please enter email first";
                return;
            }

            sendOtpBtn.disabled = true;
            sendOtpText.textContent = 'Sending...';
            sendOtpSpinner.style.display = 'block';

            fetch("emailCheck", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "email=" + encodeURIComponent(email)
            })
            .then(response => response.text())
            .then(data => {
                sendOtpBtn.disabled = false;
                sendOtpText.textContent = 'Send Verification Code';
                sendOtpSpinner.style.display = 'none';

                if (data === "SUCCESS") {

                    otpEmail.value = email;
                    displayEmail.textContent = email;

                    otpInputs.forEach(inp => { inp.value = ''; inp.disabled = false; inp.classList.remove('filled', 'error-shake'); });
                    otpValue.value = '';
                    verifyOtpBtn.disabled = true;
                    otpErrorBox.innerHTML = "";

                    showStep('otp');

                    countdown = 30;
                    startTimer();

                    setTimeout(() => otpInputs[0].focus(), 100);

                } else if (data === "NOT_FOUND") {
                    emailErrorBox.innerHTML = "Email not found";
                }
            })
            .catch(error => console.error("Error:", error));
        }

        // ── Resend OTP: fetch("${pageContext.request.contextPath}/resendOtp", { (same logic as original) ──
        function resendOtp() {
            if (countdown > 0) {
                alert("Please wait " + countdown + " seconds");
                return;
            }

            const email = otpEmail.value;

            fetch("resendOtp", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "email=" + encodeURIComponent(email)
            })
            .then(response => response.text())
            .then(() => {
                alert("OTP resent successfully!");

                otpInputs.forEach(inp => { inp.value = ''; inp.disabled = false; inp.classList.remove('filled', 'error-shake'); });
                otpValue.value = '';
                verifyOtpBtn.disabled = true;
                otpErrorBox.innerHTML = "";

                countdown = 30;
                startTimer();

                otpInputs[0].focus();
            })
            .catch(error => console.error(error));
        }

        // ── Change email (visual only, resets to step 1) ──
        changeEmailLink.addEventListener('click', function (e) {
            e.preventDefault();
            clearInterval(timerInterval);
            showStep('email');
            emailInput.focus();
        });
    </script>

    <c:if test="${showOtpPopup}">
        <script>
            document.getElementById("otpEmail").value = "${email}";
            document.getElementById("displayEmail").textContent = "${email}";
            showStep('otp');

            countdown = 30;
            startTimer();
        </script>
    </c:if>

</body>
</html>
