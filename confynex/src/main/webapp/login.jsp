<%@ page isELIgnored="false" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Host Access | Confynex</title>

            <!-- Bootstrap 5 -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Font Awesome -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap"
                rel="stylesheet">

            <style>
                body {
                    font-family: 'Inter', sans-serif;
                    background: #f1f5f9;
                    min-height: 100vh;
                }

                .left-panel {
                    background: linear-gradient(160deg, #0f172a 0%, #1e293b 100%);
                    color: white;
                    min-height: 100vh;
                    position: relative;
                    overflow: hidden;
                }

                .circle {
                    position: absolute;
                    border-radius: 50%;
                    background: rgba(255, 255, 255, 0.04);
                }

                .circle-1 {
                    width: 280px;
                    height: 280px;
                    top: -80px;
                    left: -80px;
                }

                .circle-2 {
                    width: 350px;
                    height: 350px;
                    bottom: -120px;
                    right: -120px;
                }

                .form-card {
                    border: none;
                    border-radius: 18px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                }

                .form-control {
                    padding: 12px;
                    border-radius: 10px;
                }

                .form-control:focus {
                    box-shadow: none;
                    border-color: #2563eb;
                }

                .btn-primary {
                    background: #2563eb;
                    border: none;
                    border-radius: 10px;
                    padding: 12px;
                    font-weight: 600;
                }

                .btn-primary:hover {
                    background: #1d4ed8;
                }

                .toggle-btns {
                    background: #e2e8f0;
                    border-radius: 50px;
                    padding: 4px;
                }

                .toggle-btns button {
                    border: none;
                    background: transparent;
                    padding: 10px 20px;
                    border-radius: 50px;
                    font-weight: 600;
                    width: 50%;
                }

                .toggle-btns .active {
                    background: white;
                    color: #2563eb;
                }

                .password-btn {
                    position: absolute;
                    top: 50%;
                    right: 15px;
                    transform: translateY(-50%);
                    border: none;
                    background: none;
                    color: #64748b;
                }

                @media(max-width:768px) {
                    .left-panel {
                        display: none;
                    }
                }
            </style>
        </head>

        <body>

            <div class="container-fluid">
                <div class="row">

                    <!-- LEFT SIDE -->
                    <div class="col-lg-6 d-none d-lg-flex align-items-center p-5 left-panel">

                        <div class="circle circle-1"></div>
                        <div class="circle circle-2"></div>

                        <div class="position-relative z-1">

                            <h2 class="fw-bold mb-4">
                                <i class="fas fa-shield-alt me-2"></i> Confynex
                            </h2>

                            <h1 class="display-5 fw-bold mb-3">
                                Secure Conference Management
                            </h1>

                            <p class="text-light opacity-75 fs-5">
                                Manage delegates, events, attendance and conference operations securely.
                            </p>

                            <div class="row mt-5">

                                <div class="col-6">
                                    <h5>
                                        <i class="fas fa-lock text-primary me-2"></i>
                                        Encrypted
                                    </h5>
                                    <p class="text-light opacity-75 small">
                                        256-bit SSL Security
                                    </p>
                                </div>

                                <div class="col-6">
                                    <h5>
                                        <i class="fas fa-history text-primary me-2"></i>
                                        Audited
                                    </h5>
                                    <p class="text-light opacity-75 small">
                                        Complete Activity Logs
                                    </p>
                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- RIGHT SIDE -->
                    <div class="col-lg-6 d-flex align-items-center justify-content-center p-4">

                        <div class="w-100" style="max-width:500px;">

                            <!-- Messages -->
                            <h6 class="text-success text-center">${registerSuccess}</h6>
                            <h6 class="text-danger text-center">${registerFailed}</h6>
                            <h6 class="text-danger text-center">${existData}</h6>

                            <!-- Toggle -->
                            <div class="toggle-btns d-flex mb-4">
                                <button class="active" id="loginTab" onclick="switchForm('login')">
                                    Sign In
                                </button>

                                <button id="registerTab" onclick="switchForm('register')">
                                    Create Account
                                </button>
                            </div>

                            <!-- LOGIN -->
                            <div id="loginForm" class="card form-card p-4">

                                <h3 class="fw-bold mb-1">Welcome Back</h3>

                                <p class="text-muted mb-4">
                                    Login to access your host dashboard
                                </p>

                                <form>

                                    <div class="mb-3">
                                        <label class="form-label fw-semibold">
                                            Email Address
                                        </label>

                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="fas fa-envelope"></i>
                                            </span>

                                            <input type="email" class="form-control" placeholder="Enter email" required>
                                        </div>
                                    </div>

                                    <div class="mb-3">

                                        <label class="form-label fw-semibold">
                                            Password
                                        </label>

                                        <div class="position-relative">

                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <i class="fas fa-lock"></i>
                                                </span>

                                                <input type="password" id="loginPass" class="form-control"
                                                    placeholder="Enter password" required>
                                            </div>

                                            <button type="button" class="password-btn"
                                                onclick="togglePassword('loginPass', this)">
                                                <i class="fas fa-eye"></i>
                                            </button>

                                        </div>

                                    </div>

                                    <button class="btn btn-primary w-100">
                                        Sign In
                                    </button>

                                </form>

                            </div>

                            <!-- REGISTER -->
                            <div id="registerForm" class="card form-card p-4 d-none">

                                <h3 class="fw-bold mb-1">
                                    Create Host Account
                                </h3>

                                <p class="text-muted mb-4">
                                    Fill your conference host details
                                </p>

                                <form action="registerHost" method="post" enctype="multipart/form-data">

                                    <input type="hidden" name="role" value="host">

                                    <div class="mb-3">
                                        <label class="form-label fw-semibold">
                                            Host Name
                                        </label>

                                        <input type="text" class="form-control" name="hostName"
                                            value="${hostDTO.hostName}" placeholder="Enter full name">

                                        <small class="text-danger">
                                            ${hostNameError}
                                        </small>
                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label fw-semibold">
                                            Company Name
                                        </label>

                                        <input type="text" class="form-control" name="companyName"
                                            value="${hostDTO.companyName}" placeholder="Company name">

                                        <small class="text-danger">
                                            ${companyNameError}
                                        </small>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-semibold">
                                                Email
                                            </label>

                                            <input type="email" class="form-control" name="email"
                                                value="${hostDTO.email}" placeholder="you@company.com">

                                            <small class="text-danger">
                                                ${emailError}
                                            </small>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-semibold">
                                                Phone Number
                                            </label>

                                            <input type="tel" class="form-control" name="phNumber"
                                                value="${hostDTO.phNumber}" placeholder="+91 XXXXX">

                                            <small class="text-danger">
                                                ${phNumberError}
                                            </small>
                                        </div>

                                    </div>

                                    <div class="mb-3">
                                        <label class="form-label fw-semibold">
                                            Title / Designation
                                        </label>

                                        <input type="text" class="form-control" name="title" value="${hostDTO.title}"
                                            placeholder="Chief Organizer">

                                        <small class="text-danger">
                                            ${titleError}
                                        </small>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-semibold">
                                                Conference Date
                                            </label>

                                            <input type="date" class="form-control" name="conferenceDate"
                                                value="${hostDTO.conferenceDate}">

                                            <small class="text-danger">
                                                ${conferenceDateError}
                                            </small>
                                        </div>

                                        <div class="col-md-6 mb-3">
                                            <label class="form-label fw-semibold">
                                                Venue
                                            </label>

                                            <input type="text" class="form-control" name="venue"
                                                value="${hostDTO.venue}" placeholder="Venue">
                                            <small class="text-danger"> ${venueError} </small>
                                        </div>

                                    </div>


                                    <div class="mb-3">
                                        <label class="form-label fw-semibold">
                                            Upload Excel Sheet
                                        </label>

                                        <div class="input-group">
                                            <span class="input-group-text">
                                                <i class="fas fa-file-excel text-success"></i>
                                            </span>

                                            <input type="file" class="form-control" name="excelFile" accept=".xls,.xlsx"
                                                required>
                                        </div>

                                        <small class="text-muted">
                                            Upload .xls or .xlsx files only
                                        </small>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-6 mb-3">

                                            <label class="form-label fw-semibold">
                                                Password
                                            </label>

                                            <div class="position-relative">

                                                <input type="password" id="hostPass" class="form-control"
                                                    name="password" placeholder="Password">

                                                <button type="button" class="password-btn"
                                                    onclick="togglePassword('hostPass', this)">
                                                    <i class="fas fa-eye"></i>
                                                </button>

                                            </div>

                                            <small class="text-danger">
                                                ${passwordError}
                                            </small>

                                        </div>

                                        <div class="col-md-6 mb-3">

                                            <label class="form-label fw-semibold">
                                                Confirm Password
                                            </label>

                                            <div class="position-relative">

                                                <input type="password" id="hostConfPass" class="form-control"
                                                    name="confirmPassword" placeholder="Confirm Password">

                                                <button type="button" class="password-btn"
                                                    onclick="togglePassword('hostConfPass', this)">
                                                    <i class="fas fa-eye"></i>
                                                </button>

                                            </div>

                                            <small class="text-danger">
                                                ${confirmPasswordError}
                                            </small>

                                        </div>

                                    </div>

                                    <button type="submit" class="btn btn-primary w-100">
                                        <i class="fas fa-user-plus me-2"></i>
                                        Register as Host
                                    </button>

                                </form>

                            </div>

                        </div>

                    </div>

                </div>
            </div>

            <!-- Bootstrap JS -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

            <script>

                function switchForm(type) {

                    const loginForm = document.getElementById("loginForm");
                    const registerForm = document.getElementById("registerForm");

                    const loginTab = document.getElementById("loginTab");
                    const registerTab = document.getElementById("registerTab");

                    if (type === 'login') {

                        loginForm.classList.remove("d-none");
                        registerForm.classList.add("d-none");

                        loginTab.classList.add("active");
                        registerTab.classList.remove("active");

                    } else {

                        registerForm.classList.remove("d-none");
                        loginForm.classList.add("d-none");

                        registerTab.classList.add("active");
                        loginTab.classList.remove("active");
                    }
                }

                function togglePassword(id, btn) {

                    const input = document.getElementById(id);
                    const icon = btn.querySelector("i");

                    if (input.type === "password") {

                        input.type = "text";
                        icon.classList.remove("fa-eye");
                        icon.classList.add("fa-eye-slash");

                    } else {

                        input.type = "password";
                        icon.classList.remove("fa-eye-slash");
                        icon.classList.add("fa-eye");
                    }
                }

            </script>

        </body>

        </html>