<%@ page isELIgnored="false" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Access | DelegatePro</title>

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2563eb;
            --primary-hover: #1d4ed8;
            --secondary-color: #1e293b;
            --text-muted: #64748b;
            --border-color: #e2e8f0;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: #f1f5f9;
            height: 100vh;
            overflow: hidden;
        }

        /* --- Split Layout --- */
        .auth-wrapper {
            display: flex;
            height: 100vh;
            width: 100%;
        }

        /* Left Side: Branding */
        .auth-sidebar {
            flex: 1;
            background: linear-gradient(160deg, #0f172a 0%, #1e293b 100%);
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 4rem;
            position: relative;
            overflow: hidden;
        }

        /* Decorative Circles */
        .circle-bg {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.03);
        }
        .c1 { width: 300px; height: 300px; top: -50px; left: -50px; }
        .c2 { width: 400px; height: 400px; bottom: -100px; right: -100px; }

        /* Right Side: Forms */
        .auth-main {
            flex: 1;
            background-color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            position: relative;
            overflow-y: auto;
        }

        .form-box {
            width: 100%;
            max-width: 450px;
            animation: fadeIn 0.4s ease-in-out;
            padding: 1rem 0;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* --- Toggle Switch (Sign In / Create Account) --- */
        .auth-toggle {
            display: flex;
            background: #f1f5f9;
            padding: 5px;
            border-radius: 50px;
            margin-bottom: 2rem;
        }

        .auth-toggle button {
            flex: 1;
            border: none;
            background: transparent;
            padding: 10px;
            border-radius: 40px;
            font-weight: 600;
            color: var(--text-muted);
            transition: all 0.3s ease;
        }

        .auth-toggle button.active {
            background-color: white;
            color: var(--primary-color);
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        }

        /* --- Form Elements --- */
        .form-control {
            padding: 0.65rem 0.9rem;
            border: 1px solid var(--border-color);
            border-radius: 8px;
            background-color: #f8fafc;
            font-size: 0.875rem;
        }

        .form-control:focus {
            background-color: white;
            border-color: var(--primary-color);
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border: none;
            padding: 0.75rem;
            border-radius: 8px;
            font-weight: 600;
        }

        .btn-primary:hover {
            background-color: var(--primary-hover);
        }

        .input-group-text {
            background-color: #f8fafc;
            border: 1px solid var(--border-color);
            border-right: none;
            font-size: 0.8rem;
        }
        .input-group .form-control {
            border-left: none;
        }
        .input-group:focus-within .input-group-text {
            border-color: var(--primary-color);
            background-color: white;
        }

        /* Password Toggle */
        .password-toggle-btn {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            border: none;
            background: none;
            color: var(--text-muted);
            cursor: pointer;
            z-index: 10;
            font-size: 0.85rem;
        }

        /* --- Role Selector Buttons --- */
        .role-selector {
            display: flex;
            gap: 8px;
            margin-bottom: 1.25rem;
        }

        .role-btn {
            flex: 1;
            padding: 8px 4px;
            border: 1.5px solid var(--border-color);
            border-radius: 8px;
            background: #f8fafc;
            color: var(--text-muted);
            font-size: 0.78rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            text-align: center;
        }

        .role-btn:hover {
            border-color: var(--primary-color);
            color: var(--primary-color);
            background: #eff6ff;
        }

        .role-btn.active {
            border-color: var(--primary-color);
            background-color: var(--primary-color);
            color: white;
        }

        /* Role fields show/hide with animation */
        .role-fields {
            display: none;
            animation: fadeIn 0.3s ease;
        }
        .role-fields.active {
            display: block;
        }

        /* Mobile Responsive */
        @media (max-width: 768px) {
            .auth-sidebar { display: none; }
            body { overflow: auto; }
            .auth-main {
                height: auto;
                min-height: 100vh;
                align-items: flex-start;
                padding-top: 3rem;
            }
        }
    </style>
</head>
<body>

<div class="auth-wrapper">

    <!-- ===== Left Side: Branding ===== -->
    <div class="auth-sidebar">
        <div class="circle-bg c1"></div>
        <div class="circle-bg c2"></div>

        <a href="#" class="text-white text-decoration-none mb-5 d-flex align-items-center gap-2" style="z-index:1;">
            <i class="fa-solid fa-shield-alt fa-lg"></i>
            <span class="fs-4 fw-bold">Confynex </span>
        </a>

        <div style="z-index:1;">
            <h1 class="display-5 fw-bold mb-3">Secure Control Center.</h1>
            <p class="lead text-white-50 mb-4" style="max-width:400px;">
                Manage delegates, monitor attendance, and configure conference settings in a secure environment.
            </p>
            <div class="d-flex gap-4 mt-5">
                <div>
                    <div class="text-white fw-bold fs-4"><i class="fas fa-lock text-primary me-2"></i>Encrypted</div>
                    <div class="text-white-50 small">256-bit SSL</div>
                </div>
                <div>
                    <div class="text-white fw-bold fs-4"><i class="fas fa-history text-primary me-2"></i>Audited</div>
                    <div class="text-white-50 small">Activity Logs</div>
                </div>
            </div>
        </div>
    </div>

    <!-- ===== Right Side: Forms ===== -->
    <div class="auth-main">
        <div class="form-box">

            <!-- Sign In / Create Account Toggle -->

                      <h5 style="color:green" class="text-center">${registerSuccess}</h5>
                      <h5 style="color:red" class="text-center">${registerFailed}</h5>
                      <h5 style="color:red" class="text-center">${existData}</h5>

            <div class="auth-toggle">
                <button class="active" id="tab-login" onclick="switchForm('login')">Sign In</button>
                <button id="tab-register" onclick="switchForm('register')">Create Account</button>
            </div>

            <!-- ==================== LOGIN FORM ==================== -->
            <div id="login-form">
                <h3 class="fw-bold mb-1">Welcome back</h3>
                <p class="text-muted small mb-4">Enter your credentials to access the admin panel.</p>

                <form onsubmit="handleLogin(event)">
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-secondary">Email Address</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-envelope text-muted"></i></span>
                            <input type="email" class="form-control" placeholder="admin@conference.com" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-bold text-secondary">Password</label>
                        <div class="position-relative">
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                <input type="password" class="form-control" id="loginPass" placeholder="••••••••" required>
                            </div>
                            <button type="button" class="password-toggle-btn" onclick="togglePassword('loginPass', this)">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <div class="form-check small">
                                <input class="form-check-input" type="checkbox" id="rememberMe">
                                <label class="form-check-label text-muted" for="rememberMe">Remember me</label>
                            </div>
                            <a href="#" class="text-decoration-none small">Forgot password?</a>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mt-2">
                        Sign In
                    </button>
                </form>
            </div>

            <!-- ==================== REGISTER FORM ==================== -->
            <div id="register-form" class="d-none">





                <h3 class="fw-bold mb-1">Create Account</h3>
                <p class="text-muted small mb-3">Select your role and complete your profile.</p>

                <!-- Role Selector -->
                <div class="role-selector">
                    <button class="role-btn active" onclick="switchRole('host', this)">
                        <i class="fas fa-user-tie me-1"></i> Host
                    </button>
                    <button class="role-btn" onclick="switchRole('delegate', this)">
                        <i class="fas fa-id-badge me-1"></i> Delegate
                    </button>
                    <button class="role-btn" onclick="switchRole('admin', this)">
                        <i class="fas fa-shield-alt me-1"></i> Admin
                    </button>
                </div>

                <!-- -------- HOST FORM -------- -->
                <div id="host-fields" class="role-fields active">
                    <form action="registerHost" method="post">
                        <input type="hidden" name="role" value="host">

                        <div class="row g-2 mb-2">
                            <!-- <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Host ID</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-hashtag text-muted"></i></span>
                                    <input type="number" class="form-control" name="hostId" placeholder="e.g. 1001" required>
                                </div>
                            </div> -->

                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Host Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user text-muted"></i></span>
                                    <input type="text" class="form-control" name="hostName" placeholder="Full name" required value="${hostDTO.hostName}">
                                    <small class="text-danger" id="hostNameError">${hostNameError}</small>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-bold text-secondary">Company Name</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-building text-muted"></i></span>
                                <input type="text" class="form-control" name="companyName" placeholder="Your company or organization" required value="${hostDTO.companyName}">
                                <small class="text-danger" id="companyNameError">${companyNameError}</small>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope text-muted"></i></span>
                                    <input type="email" class="form-control" name="email" placeholder="you@company.com" required  value="${hostDTO.email}">
                                    <small class="text-danger" id="emailError">${emailError}</small>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone text-muted"></i></span>
                                    <input type="tel" class="form-control" name="phNumber" placeholder="+91 XXXXX" required  value="${hostDTO.phNumber}">
                                    <small class="text-danger" id="phNumberError">${phNumberError}</small>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-bold text-secondary">Title / Designation</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-briefcase text-muted"></i></span>
                                <input type="text" class="form-control" name="title" placeholder="e.g. Chief Organizer" required  value="${hostDTO.title}">
                                <small class="text-danger" id="titleError">${titleError}</small>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Conference Date</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-calendar text-muted"></i></span>
                                    <input type="date" class="form-control" name="conferenceDate" required  value="${hostDTO.conferenceDate}">
                                    <small class="text-danger" id="conferenceDateError">${conferenceDateError}</small>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Venue</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-map-marker-alt text-muted"></i></span>
                                    <input type="text" class="form-control" name="venue" placeholder="City, Hall" required  value="${hostDTO.venue}">
                                    <small class="text-danger" id="venueError">${venueError}</small>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="hostPass" name="password" placeholder="Create password" required value="${hostDTO.password}">
                                        <small class="text-danger" id="passwordError">${passwordError}</small>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('hostPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Confirm Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="hostConfPass" name="confirmPassword" placeholder="Re-enter" required  value="${hostDTO.confirmPassword}">
                                        <small class="text-danger" id="confirmPasswordError">${confirmPasswordError}</small>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('hostConfPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-user-plus me-2"></i>Register as Host
                        </button>
                    </form>
                </div>

                <!-- -------- DELEGATE FORM -------- -->
                <div id="delegate-fields" class="role-fields">
                    <form action="registerDelegate" method="post" onsubmit="handleRegister(event)">
                        <input type="hidden" name="role" value="delegate">

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Delegate ID</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-hashtag text-muted"></i></span>
                                    <input type="number" class="form-control" name="delegateId" placeholder="e.g. 2001" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Delegate Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user text-muted"></i></span>
                                    <input type="text" class="form-control" name="delegateName" placeholder="Full name" required>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope text-muted"></i></span>
                                    <input type="email" class="form-control" name="email" placeholder="you@email.com" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone text-muted"></i></span>
                                    <input type="tel" class="form-control" name="phNumber" placeholder="+91 XXXXX" required>
                                </div>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-bold text-secondary">Organization</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-building text-muted"></i></span>
                                <input type="text" class="form-control" name="organization" placeholder="Your organization" required>
                            </div>
                        </div>

                        <div class="mb-2">
                            <label class="form-label small fw-bold text-secondary">Conference ID to Join</label>
                            <div class="input-group">
                                <span class="input-group-text"><i class="fas fa-key text-muted"></i></span>
                                <input type="number" class="form-control" name="conferenceId" placeholder="ID provided by the host" required>
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="delPass" name="password" placeholder="Create password" required>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('delPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Confirm Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="delConfPass" name="confirmPassword" placeholder="Re-enter" required>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('delConfPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-id-badge me-2"></i>Register as Delegate
                        </button>
                    </form>
                </div>

                <!-- -------- ADMIN FORM -------- -->
                <div id="admin-fields" class="role-fields">
                    <form action="registerAdmin" method="post" onsubmit="handleRegister(event)">
                        <input type="hidden" name="role" value="admin">

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Admin ID</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-hashtag text-muted"></i></span>
                                    <input type="number" class="form-control" name="adminId" placeholder="e.g. 3001" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Admin Name</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-user text-muted"></i></span>
                                    <input type="text" class="form-control" name="adminName" placeholder="Full name" required>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-2">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Email</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-envelope text-muted"></i></span>
                                    <input type="email" class="form-control" name="email" placeholder="admin@conf.com" required>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Phone Number</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="fas fa-phone text-muted"></i></span>
                                    <input type="tel" class="form-control" name="phNumber" placeholder="+91 XXXXX" required>
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mb-3">
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="adminPass" name="password" placeholder="Create password" required>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('adminPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="col-6">
                                <label class="form-label small fw-bold text-secondary">Confirm Password</label>
                                <div class="position-relative">
                                    <div class="input-group">
                                        <span class="input-group-text"><i class="fas fa-lock text-muted"></i></span>
                                        <input type="password" class="form-control" id="adminConfPass" name="confirmPassword" placeholder="Re-enter" required>
                                    </div>
                                    <button type="button" class="password-toggle-btn" onclick="togglePassword('adminConfPass', this)">
                                        <i class="fas fa-eye"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">
                            <i class="fas fa-shield-alt me-2"></i>Register as Admin
                        </button>
                    </form>
                </div>

            </div><!-- /register-form -->

        </div><!-- /form-box -->
    </div><!-- /auth-main -->

</div><!-- /auth-wrapper -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Switch between Sign In and Create Account panels
    function switchForm(formType) {
        const loginForm    = document.getElementById('login-form');
        const registerForm = document.getElementById('register-form');
        const loginTab     = document.getElementById('tab-login');
        const registerTab  = document.getElementById('tab-register');

        if (formType === 'login') {
            loginForm.classList.remove('d-none');
            registerForm.classList.add('d-none');
            loginTab.classList.add('active');
            registerTab.classList.remove('active');
        } else {
            loginForm.classList.add('d-none');
            registerForm.classList.remove('d-none');
            loginTab.classList.remove('active');
            registerTab.classList.add('active');
        }
    }

    // Switch between Host / Delegate / Admin role fields
    function switchRole(role, clickedBtn) {
        document.querySelectorAll('.role-fields').forEach(function(el) {
            el.classList.remove('active');
        });
        document.querySelectorAll('.role-btn').forEach(function(btn) {
            btn.classList.remove('active');
        });
        document.getElementById(role + '-fields').classList.add('active');
        clickedBtn.classList.add('active');
    }

    // Toggle password visibility by input ID
    function togglePassword(inputId, btn) {
        const input = document.getElementById(inputId);
        const icon  = btn.querySelector('i');

        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    }

    // Mock Login Handler
    function handleLogin(e) {
        e.preventDefault();
        const btn = e.target.querySelector('button[type="submit"]');
        const originalText = btn.innerHTML;

        btn.innerHTML = '<span class="spinner-border spinner-border-sm"></span> Authenticating...';
        btn.disabled = true;

        setTimeout(() => {
            alert("Login Successful! Redirecting to Dashboard...");
            btn.innerHTML = originalText;
            btn.disabled = false;
        }, 1500);
    }

    // Mock Register Handler
    function handleRegister(e) {
        e.preventDefault();
        const btn = e.target.querySelector('button[type="submit"]');
        const originalText = btn.innerHTML;

        btn.innerHTML = '<span class="spinner-border spinner-border-sm"></span> Creating Account...';
        btn.disabled = true;

        setTimeout(() => {
            alert("Account Created! Please log in.");
            switchForm('login');
            btn.innerHTML = originalText;
            btn.disabled = false;
            e.target.reset();
        }, 1500);
    }
</script>
</body>
</html>
