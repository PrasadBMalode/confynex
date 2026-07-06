<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

        .conference-meta {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
        }

        .conference-meta .meta-chip {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(18, 20, 31, 0.55);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            color: var(--text-secondary);
            font-size: 0.8rem;
            font-weight: 500;
            padding: 8px 16px;
            border-radius: 10px;
        }

        .conference-meta .meta-chip i {
            color: var(--accent);
        }

        .conference-meta .meta-chip strong {
            color: var(--text-primary);
            font-weight: 700;
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

        .icon-circle.success-icon {
            background: linear-gradient(135deg, rgba(16, 185, 129, 0.12), rgba(16, 185, 129, 0.06));
            border-color: rgba(16, 185, 129, 0.2);
            color: var(--success);
        }

        .icon-circle.error-icon {
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.12), rgba(239, 68, 68, 0.06));
            border-color: rgba(239, 68, 68, 0.2);
            color: var(--error);
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

        .form-control-custom:focus + .input-icon,
        .form-control-custom:focus ~ .input-icon {
            color: var(--accent);
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

        .otp-input.success-fill {
            border-color: var(--success) !important;
            box-shadow: 0 0 0 3px rgba(16, 185, 129, 0.2) !important;
            background: rgba(16, 185, 129, 0.06) !important;
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

        .btn-primary-custom::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(135deg, transparent, rgba(255, 255, 255, 0.15));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .btn-primary-custom:hover:not(:disabled)::before {
            opacity: 1;
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

        /* ── Success State ── */
        .success-checkmark {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(16, 185, 129, 0.15), rgba(16, 185, 129, 0.08));
            border: 2px solid rgba(16, 185, 129, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2rem;
            color: var(--success);
            animation: successBounce 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        @keyframes successBounce {
            0% { transform: scale(0); opacity: 0; }
            60% { transform: scale(1.15); }
            100% { transform: scale(1); opacity: 1; }
        }

        /* ── Toast Notifications (Bottom Right) ── */
        .toast-container {
            position: fixed;
            bottom: 24px;
            right: 24px;
            z-index: 9999;
            display: flex;
            flex-direction: column-reverse;
            gap: 10px;
            pointer-events: none;
        }

        .toast-msg {
            pointer-events: all;
            display: flex;
            align-items: flex-start;
            gap: 12px;
            padding: 14px 18px;
            border-radius: 14px;
            min-width: 340px;
            max-width: 420px;
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid;
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.4);
            animation: toastSlideIn 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
        }

        .toast-msg.toast-exit {
            animation: toastSlideOut 0.35s cubic-bezier(0.4, 0, 0.2, 1) forwards;
        }

        .toast-msg.success {
            background: rgba(16, 185, 129, 0.1);
            border-color: rgba(16, 185, 129, 0.2);
        }

        .toast-msg.error {
            background: rgba(239, 68, 68, 0.1);
            border-color: rgba(239, 68, 68, 0.2);
        }

        .toast-msg.warning {
            background: rgba(245, 158, 11, 0.1);
            border-color: rgba(245, 158, 11, 0.2);
        }

        .toast-msg .toast-icon {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            flex-shrink: 0;
        }

        .toast-msg.success .toast-icon {
            background: var(--success-bg);
            color: var(--success);
        }

        .toast-msg.error .toast-icon {
            background: var(--error-bg);
            color: var(--error);
        }

        .toast-msg.warning .toast-icon {
            background: rgba(245, 158, 11, 0.12);
            color: var(--warning);
        }

        .toast-msg .toast-content {
            flex: 1;
        }

        .toast-msg .toast-title {
            font-size: 0.875rem;
            font-weight: 600;
            color: var(--text-primary);
            margin-bottom: 2px;
        }

        .toast-msg .toast-text {
            font-size: 0.8rem;
            color: var(--text-muted);
            line-height: 1.5;
        }

        .toast-msg .toast-close {
            background: none;
            border: none;
            color: var(--text-muted);
            cursor: pointer;
            font-size: 1rem;
            padding: 0;
            line-height: 1;
            transition: color 0.2s ease;
            flex-shrink: 0;
        }

        .toast-msg .toast-close:hover {
            color: var(--text-secondary);
        }

        .toast-msg .toast-progress {
            position: absolute;
            bottom: 0;
            left: 0;
            height: 2px;
            border-radius: 0 0 14px 14px;
            animation: toastProgress 4s linear forwards;
        }

        .toast-msg.success .toast-progress { background: var(--success); }
        .toast-msg.error .toast-progress { background: var(--error); }
        .toast-msg.warning .toast-progress { background: var(--warning); }

        @keyframes toastSlideIn {
            from { opacity: 0; transform: translateX(60px) scale(0.95); }
            to { opacity: 1; transform: translateX(0) scale(1); }
        }

        @keyframes toastSlideOut {
            from { opacity: 1; transform: translateX(0) scale(1); }
            to { opacity: 0; transform: translateX(60px) scale(0.95); }
        }

        @keyframes toastProgress {
            from { width: 100%; }
            to { width: 0%; }
        }

        /* ── Particles (OTP success) ── */
        .confetti-container {
            position: fixed;
            inset: 0;
            pointer-events: none;
            z-index: 9998;
        }

        .confetti {
            position: absolute;
            width: 8px;
            height: 8px;
            border-radius: 2px;
            animation: confettiFall 1.5s ease-out forwards;
        }

        @keyframes confettiFall {
            0% { opacity: 1; transform: translateY(0) rotate(0deg) scale(1); }
            100% { opacity: 0; transform: translateY(400px) rotate(720deg) scale(0.2); }
        }

        /* ── Divider ── */
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

            .conference-meta .meta-chip {
                font-size: 0.72rem;
                padding: 6px 12px;
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

            .toast-msg {
                min-width: 280px;
                max-width: calc(100vw - 48px);
            }

            .toast-container {
                right: 16px;
                bottom: 16px;
            }
        }

        /* ── Validation state ── */
        .form-control-custom.is-invalid {
            border-color: var(--error);
            box-shadow: 0 0 0 3px rgba(239, 68, 68, 0.15);
        }

        .invalid-feedback-custom {
            color: var(--error);
            font-size: 0.78rem;
            margin-top: 6px;
            display: none;
            align-items: center;
            gap: 4px;
        }

        .invalid-feedback-custom.show {
            display: flex;
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

    <!-- Confetti Container -->
    <div class="confetti-container" id="confettiContainer"></div>

    <!-- Navbar -->
    <nav class="navbar-custom">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <a href="#" class="brand-logo">
                    Confy<span class="brand-accent">nex</span>
                </a>
                <div class="d-flex align-items-center gap-2">
                    <a href="index.jsp#home" class="nav-btn">
                        <i class="bi bi-house-door"></i>
                        Home
                    </a>
                    <a href="signinModal" class="nav-btn nav-btn-primary">
                        <i class="bi bi-box-arrow-in-right"></i>
                        Host Signin
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
            <!--<div class="conference-meta">
                <span class="meta-chip"><i class="bi bi-geo-alt"></i> <strong>Bengaluru</strong>&nbsp;International Convention Centre</span>
                <span class="meta-chip"><i class="bi bi-calendar3"></i> <strong>Sep 14&ndash;16, 2026</strong></span>
                <span class="meta-chip"><i class="bi bi-people"></i> <strong>12,000+</strong>&nbsp;Delegates</span>
            </div> -->
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

                <form action="emailCheck" method="post" id="emailForm" novalidate>
                    <div class="input-group-custom">
                        <label class="form-label-custom">Email Address</label>
                        <div style="position: relative;">
                            <input
                                type="email"
                                name="email"
                                class="form-control-custom"
                                id="emailInput"
                                placeholder="you@example.com"
                                autocomplete="email"
                                required
                            >
                            <i class="bi bi-envelope input-icon" style="top: 50%;"></i>
                        </div>
                        <div class="invalid-feedback-custom" id="emailError">
                            <i class="bi bi-exclamation-circle"></i>
                            <span id="emailErrorText">Please enter a valid email address.</span>
                        </div>
                    </div>

                    <button type="submit" class="btn-primary-custom" id="sendOtpBtn">
                        <span id="sendOtpText">Send Verification Code</span>
                        <div class="spinner-custom" id="sendOtpSpinner" style="display: none;"></div>
                    </button>
                </form>

                <div class="text-center">
                    <a href="delegateLogin.jsp" class="back-link">
                        <i class="bi bi-arrow-left"></i>
                        Back to Signin
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
                    <span class="email-highlight" id="displayEmail">user@example.com</span>
                </p>

                <form id="otpForm" novalidate>
                    <label class="form-label-custom" style="text-align: center;">Verification Code</label>
                    <div class="otp-wrapper" id="otpWrapper">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" autocomplete="one-time-code" data-index="0">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="1">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="2">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="3">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="4">
                        <input type="text" class="otp-input" maxlength="1" inputmode="numeric" pattern="[0-9]" data-index="5">
                    </div>

                    <button type="submit" class="btn-primary-custom" id="verifyOtpBtn" disabled>
                        <span id="verifyOtpText">Verify Code</span>
                        <div class="spinner-custom" id="verifyOtpSpinner" style="display: none;"></div>
                    </button>
                </form>

                <div class="resend-section">
                    <span>Didn't receive the code?</span>
                    <button class="resend-link" id="resendBtn" disabled>
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

            <!-- STEP 3: Success -->
            <div class="step-section" id="stepSuccess">
                <div class="success-checkmark">
                    <i class="bi bi-check-lg"></i>
                </div>
                <h2 class="card-title">Verified Successfully</h2>
                <p class="card-subtitle">
                    Your identity has been confirmed. You can now reset your password securely.
                </p>

                <a href="#" class="btn-primary-custom" style="text-decoration: none;">
                    <i class="bi bi-key"></i>
                    Reset Password
                </a>

                <div class="text-center">
                    <a href="#" class="back-link">
                        <i class="bi bi-arrow-left"></i>
                        Back to Signin
                    </a>
                </div>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <div class="footer-text">
        &copy; 2025 Confynex. All rights reserved.
    </div>

    <!-- Toast Container (Bottom Right) -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // ── Elements ──
        const emailForm = document.getElementById('emailForm');
        const emailInput = document.getElementById('emailInput');
        const emailError = document.getElementById('emailError');
        const emailErrorText = document.getElementById('emailErrorText');
        const sendOtpBtn = document.getElementById('sendOtpBtn');
        const sendOtpText = document.getElementById('sendOtpText');
        const sendOtpSpinner = document.getElementById('sendOtpSpinner');

        const otpForm = document.getElementById('otpForm');
        const otpWrapper = document.getElementById('otpWrapper');
        const otpInputs = document.querySelectorAll('.otp-input');
        const verifyOtpBtn = document.getElementById('verifyOtpBtn');
        const verifyOtpText = document.getElementById('verifyOtpText');
        const verifyOtpSpinner = document.getElementById('verifyOtpSpinner');
        const displayEmail = document.getElementById('displayEmail');
        const resendBtn = document.getElementById('resendBtn');
        const timerBadge = document.getElementById('timerBadge');
        const timerText = document.getElementById('timerText');
        const changeEmailLink = document.getElementById('changeEmailLink');

        const stepEmail = document.getElementById('stepEmail');
        const stepOtp = document.getElementById('stepOtp');
        const stepSuccess = document.getElementById('stepSuccess');

        const dot1 = document.getElementById('dot1');
        const dot2 = document.getElementById('dot2');
        const dot3 = document.getElementById('dot3');
        const line1 = document.getElementById('line1');
        const line2 = document.getElementById('line2');

        const toastContainer = document.getElementById('toastContainer');
        const confettiContainer = document.getElementById('confettiContainer');

        // ── Simulated correct OTP for demo ──
        const CORRECT_OTP = '123456';

        let countdownInterval = null;
        let currentEmail = '';

        // ── Email Validation ──
        function isValidEmail(email) {
            return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
        }

        // ── Show/Hide Steps ──
        function showStep(step) {
            stepEmail.classList.remove('active');
            stepOtp.classList.remove('active');
            stepSuccess.classList.remove('active');

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
            } else if (step === 'success') {
                stepSuccess.classList.add('active');
                dot1.className = 'step-dot done';
                dot2.className = 'step-dot done';
                dot3.className = 'step-dot active';
                line1.className = 'step-line done';
                line2.className = 'step-line done';
            }
        }

        // ── Toast System ──
        function showToast(type, title, message) {
            const iconMap = {
                success: 'bi-check-lg',
                error: 'bi-x-lg',
                warning: 'bi-exclamation-triangle'
            };

            const toast = document.createElement('div');
            toast.className = `toast-msg ${type}`;
            toast.innerHTML = `
                <div class="toast-icon">
                    <i class="bi ${iconMap[type]}"></i>
                </div>
                <div class="toast-content">
                    <div class="toast-title">${title}</div>
                    <div class="toast-text">${message}</div>
                </div>
                <button class="toast-close" onclick="dismissToast(this.parentElement)">
                    <i class="bi bi-x"></i>
                </button>
                <div class="toast-progress"></div>
            `;

            toastContainer.appendChild(toast);

            // Auto dismiss
            setTimeout(() => {
                dismissToast(toast);
            }, 4000);
        }

        function dismissToast(toastEl) {
            if (!toastEl || toastEl.classList.contains('toast-exit')) return;
            toastEl.classList.add('toast-exit');
            setTimeout(() => {
                if (toastEl.parentElement) {
                    toastEl.parentElement.removeChild(toastEl);
                }
            }, 350);
        }

        // ── Confetti Effect ──
        function fireConfetti() {
            const colors = ['#d4af37', '#f0d888', '#10b981', '#f59e0b', '#ef4444', '#b8860b'];
            for (let i = 0; i < 50; i++) {
                const confetti = document.createElement('div');
                confetti.className = 'confetti';
                confetti.style.left = (30 + Math.random() * 40) + '%';
                confetti.style.top = (20 + Math.random() * 20) + '%';
                confetti.style.background = colors[Math.floor(Math.random() * colors.length)];
                confetti.style.animationDelay = (Math.random() * 0.3) + 's';
                confetti.style.animationDuration = (1 + Math.random() * 1) + 's';
                confetti.style.width = (5 + Math.random() * 6) + 'px';
                confetti.style.height = (5 + Math.random() * 6) + 'px';
                confettiContainer.appendChild(confetti);
            }
            setTimeout(() => {
                confettiContainer.innerHTML = '';
            }, 2500);
        }

        // ── Countdown Timer ──
        function startTimer(seconds) {
            let remaining = seconds;
            resendBtn.disabled = true;
            timerBadge.style.display = 'inline-flex';
            updateTimerDisplay(remaining);

            countdownInterval = setInterval(() => {
                remaining--;
                updateTimerDisplay(remaining);

                if (remaining <= 0) {
                    clearInterval(countdownInterval);
                    resendBtn.disabled = false;
                    timerBadge.style.display = 'none';
                }
            }, 1000);
        }

        function updateTimerDisplay(secs) {
            const m = String(Math.floor(secs / 60)).padStart(2, '0');
            const s = String(secs % 60).padStart(2, '0');
            timerText.textContent = `${m}:${s}`;
        }

        function stopTimer() {
            if (countdownInterval) {
                clearInterval(countdownInterval);
                countdownInterval = null;
            }
        }

        // ── Clear OTP Inputs ──
        function clearOtpInputs() {
            otpInputs.forEach(inp => {
                inp.value = '';
                inp.classList.remove('filled', 'error-shake', 'success-fill');
            });
            verifyOtpBtn.disabled = true;
        }

        // ── Email Form Submit ──
        emailForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const email = emailInput.value.trim();

            // Validate
            if (!email) {
                emailInput.classList.add('is-invalid');
                emailErrorText.textContent = 'Email address is required.';
                emailError.classList.add('show');
                showToast('error', 'Missing Email', 'Please enter your email address to continue.');
                return;
            }

            if (!isValidEmail(email)) {
                emailInput.classList.add('is-invalid');
                emailErrorText.textContent = 'Please enter a valid email address.';
                emailError.classList.add('show');
                showToast('error', 'Invalid Email', 'The email format you entered is not valid.');
                return;
            }

            // Clear errors
            emailInput.classList.remove('is-invalid');
            emailError.classList.remove('show');

            // Show loading
            sendOtpBtn.disabled = true;
            sendOtpText.textContent = 'Sending...';
            sendOtpSpinner.style.display = 'block';

            // Simulate API call
            setTimeout(() => {
                sendOtpBtn.disabled = false;
                sendOtpText.textContent = 'Send Verification Code';
                sendOtpSpinner.style.display = 'none';

                currentEmail = email;
                displayEmail.textContent = email;
                clearOtpInputs();

                showStep('otp');
                startTimer(60);

                showToast('success', 'Code Sent', `A 6-digit verification code has been sent to ${email}.`);

                // Auto-focus first OTP input
                setTimeout(() => {
                    otpInputs[0].focus();
                }, 100);
            }, 1800);
        });

        // Remove error on input
        emailInput.addEventListener('input', function() {
            this.classList.remove('is-invalid');
            emailError.classList.remove('show');
        });

        // ── OTP Input Logic ──
        otpInputs.forEach((input, index) => {
            input.addEventListener('input', function(e) {
                const val = this.value.replace(/[^0-9]/g, '');

                if (val) {
                    this.value = val.charAt(0);
                    this.classList.add('filled');
                    this.classList.remove('error-shake', 'success-fill');

                    // Move to next
                    if (index < otpInputs.length - 1) {
                        otpInputs[index + 1].focus();
                    }
                } else {
                    this.value = '';
                    this.classList.remove('filled');
                }

                checkOtpComplete();
            });

            input.addEventListener('keydown', function(e) {
                if (e.key === 'Backspace') {
                    if (!this.value && index > 0) {
                        otpInputs[index - 1].focus();
                        otpInputs[index - 1].value = '';
                        otpInputs[index - 1].classList.remove('filled');
                    }
                    this.classList.remove('error-shake', 'success-fill');
                }

                if (e.key === 'Enter') {
                    e.preventDefault();
                    if (checkOtpComplete()) {
                        otpForm.dispatchEvent(new Event('submit'));
                    }
                }
            });

            input.addEventListener('paste', function(e) {
                e.preventDefault();
                const pasted = (e.clipboardData || window.clipboardData).getData('text').replace(/[^0-9]/g, '');
                if (pasted.length >= 6) {
                    for (let i = 0; i < 6; i++) {
                        otpInputs[i].value = pasted.charAt(i);
                        otpInputs[i].classList.add('filled');
                        otpInputs[i].classList.remove('error-shake', 'success-fill');
                    }
                    otpInputs[5].focus();
                    checkOtpComplete();
                }
            });

            input.addEventListener('focus', function() {
                this.select();
            });
        });

        function checkOtpComplete() {
            let filled = 0;
            otpInputs.forEach(inp => {
                if (inp.value) filled++;
            });
            verifyOtpBtn.disabled = (filled < 6);
            return filled >= 6;
        }

        function getOtpValue() {
            return Array.from(otpInputs).map(i => i.value).join('');
        }

        // ── OTP Form Submit ──
        otpForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const otp = getOtpValue();

            if (otp.length < 6) return;

            // Show loading
            verifyOtpBtn.disabled = true;
            verifyOtpText.textContent = 'Verifying...';
            verifyOtpSpinner.style.display = 'block';

            // Simulate API call
            setTimeout(() => {
                verifyOtpSpinner.style.display = 'none';

                if (otp === CORRECT_OTP) {
                    // SUCCESS
                    verifyOtpText.textContent = 'Verified';
                    otpInputs.forEach(inp => {
                        inp.classList.remove('error-shake');
                        inp.classList.add('success-fill');
                    });

                    stopTimer();

                    setTimeout(() => {
                        showStep('success');
                        fireConfetti();
                        showToast('success', 'Verification Complete', 'Your email has been verified. You can now reset your password.');
                    }, 600);

                } else {
                    // ERROR
                    verifyOtpText.textContent = 'Verify Code';
                    verifyOtpBtn.disabled = false;

                    otpInputs.forEach(inp => {
                        inp.classList.add('error-shake');
                        inp.classList.remove('filled', 'success-fill');
                    });

                    showToast('error', 'Invalid Code', 'The verification code you entered is incorrect. Please try again.');

                    // Clear and refocus after shake
                    setTimeout(() => {
                        clearOtpInputs();
                        otpInputs[0].focus();
                    }, 700);
                }
            }, 2000);
        });

        // ── Resend OTP ──
        resendBtn.addEventListener('click', function() {
            if (this.disabled) return;

            clearOtpInputs();
            startTimer(60);

            showToast('success', 'Code Resent', `A new verification code has been sent to ${currentEmail}.`);

            setTimeout(() => {
                otpInputs[0].focus();
            }, 100);
        });

        // ── Change Email ──
        changeEmailLink.addEventListener('click', function(e) {
            e.preventDefault();
            stopTimer();
            clearOtpInputs();
            showStep('email');
            emailInput.focus();
        });
    </script>
</body>
</html>
