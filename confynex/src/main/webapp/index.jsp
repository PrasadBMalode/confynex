<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DelegatePro | Conference Management System</title>

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2563eb;       /* Professional Blue */
            --secondary-color: #1e293b;     /* Dark Slate */
            --accent-color: #0ea5e9;        /* Light Blue */
            --light-bg: #f8fafc;
            --text-dark: #334155;
            --text-light: #94a3b8;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            overflow-x: hidden;
        }

        /* --- Navbar Styles --- */
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 15px rgba(0,0,0,0.05);
            padding: 1rem 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary-color) !important;
            font-size: 1.5rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-link {
            color: var(--secondary-color) !important;
            font-weight: 500;
            margin: 0 10px;
            transition: color 0.3s;
        }

        .nav-link:hover {
            color: var(--primary-color) !important;
        }

        .btn-primary-custom {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            border: none;
            padding: 10px 25px;
            border-radius: 50px;
            color: white;
            font-weight: 600;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .btn-primary-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(37, 99, 235, 0.3);
            color: white;
        }

        .btn-outline-custom {
            border: 2px solid var(--primary-color);
            color: var(--primary-color);
            padding: 8px 23px;
            border-radius: 50px;
            font-weight: 600;
            margin-right: 10px;
            transition: all 0.3s;
        }

        .btn-outline-custom:hover {
            background-color: var(--primary-color);
            color: white;
        }

        /* --- Hero Section --- */
        .hero-section {
            padding: 100px 0 60px;
            background: linear-gradient(to bottom, #eff6ff, #ffffff);
            position: relative;
        }

        .hero-title {
            font-weight: 800;
            font-size: 3.5rem;
            line-height: 1.2;
            margin-bottom: 20px;
            background: -webkit-linear-gradient(45deg, var(--secondary-color), var(--primary-color));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .hero-subtitle {
            font-size: 1.25rem;
            color: var(--text-light);
            margin-bottom: 30px;
            line-height: 1.6;
        }

        .hero-img-container {
            position: relative;
        }

        .hero-img {
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
            border: 8px solid white;
        }

        /* --- Features Section --- */
        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            border: 1px solid #e2e8f0;
            transition: all 0.3s ease;
            height: 100%;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            border-color: var(--primary-color);
        }

        .icon-box {
            width: 60px;
            height: 60px;
            background-color: #eff6ff;
            color: var(--primary-color);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        /* --- Stats Section --- */
        .stats-section {
            background-color: var(--secondary-color);
            color: white;
            padding: 60px 0;
        }

        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--accent-color);
        }

        /* --- Process Section --- */
        .process-step {
            text-align: center;
            position: relative;
        }

        .step-number {
            font-size: 4rem;
            font-weight: 900;
            color: #f1f5f9;
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            z-index: -1;
        }

        /* --- Footer --- */
        footer {
            background-color: #0f172a;
            color: #cbd5e1;
            padding: 60px 0 20px;
        }

        footer h5 {
            color: white;
            font-weight: 600;
            margin-bottom: 20px;
        }

        footer a {
            color: #cbd5e1;
            text-decoration: none;
            transition: color 0.2s;
        }

        footer a:hover {
            color: var(--primary-color);
        }

        /* Responsive Tweaks */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5rem;
            }
            .hero-section {
                text-align: center;
                padding-top: 120px;
            }
            .hero-btn-group {
                justify-content: center;
            }
            .hero-img {
                margin-top: 40px;
            }
        }
    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <i class="fa-solid fa-id-card-clip"></i> Confynex
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link active" href="#home">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="features">Features</a></li>
                    <li class="nav-item"><a class="nav-link" href="#process">How It Works</a></li>
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
                </ul>
                <div class="d-flex">

                    <form action="login" method="POST" style="display:inline;">
                        <button type="submit" class="btn btn-outline-custom">Login</button>
                    </form>

                    <a href="#" class="btn btn-primary-custom">Get Started</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="home" class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <span class="badge bg-primary bg-opacity-10 text-primary mb-3 px-3 py-2 rounded-pill">
                        <i class="fas fa-rocket me-2"></i> v2.0 Now Available
                    </span>
                    <h1 class="hero-title">Effortless Conference Delegate Management</h1>
                    <p class="hero-subtitle">
                        A robust, Java-powered solution to streamline registrations, track attendees, and print badges in real-time. Focus on your event, we'll handle the data.
                    </p>
                    <div class="d-flex gap-3 hero-btn-group">
                        <a href="#" class="btn btn-primary-custom btn-lg">Start Free Trial</a>
                        <a href="#" class="btn btn-outline-light btn-lg" style="border: 1px solid #cbd5e1; color: var(--text-dark);">
                            <i class="fas fa-play-circle me-2"></i> Watch Demo
                        </a>
                    </div>
                    <div class="mt-4 text-muted small">
                        <i class="fas fa-check-circle text-success me-1"></i> No credit card required &nbsp;
                        <i class="fas fa-check-circle text-success me-1"></i> 14-day free trial
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-img-container">
                        <!-- Placeholder for Dashboard UI -->
                        <img src="https://picsum.photos/seed/conference/600/400" alt="Dashboard Interface" class="img-fluid hero-img">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="stat-number">500+</div>
                    <div class="text-white-50">Events Managed</div>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="stat-number">50k+</div>
                    <div class="text-white-50">Delegates Registered</div>
                </div>
                <div class="col-md-3 mb-4 mb-md-0">
                    <div class="stat-number">99.9%</div>
                    <div class="text-white-50">Uptime Guaranteed</div>
                </div>
                <div class="col-md-3">
                    <div class="stat-number">24/7</div>
                    <div class="text-white-50">Technical Support</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="py-5 bg-light">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h6 class="text-primary text-uppercase fw-bold ls-2">Features</h6>
                <h2 class="fw-bold display-6">Everything you need to run your event</h2>
                <p class="text-muted w-75 mx-auto">Built with Java Spring Boot for high performance and security.</p>
            </div>

            <div class="row g-4">
                <!-- Feature 1 -->
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <h4>Easy Registration</h4>
                        <p class="text-muted">Customizable registration forms that capture delegate details efficiently. Supports group registrations and discounts.</p>
                    </div>
                </div>
                <!-- Feature 2 -->
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-id-badge"></i>
                        </div>
                        <h4>Instant Badge Printing</h4>
                        <p class="text-muted">Generate and print professional badges on-demand with QR codes for instant check-in verification.</p>
                    </div>
                </div>
                <!-- Feature 3 -->
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-chart-pie"></i>
                        </div>
                        <h4>Real-time Analytics</h4>
                        <p class="text-muted">Visualize attendance data, session popularity, and demographic breakdowns with our interactive dashboard.</p>
                    </div>
                </div>
                <!-- Feature 4 -->
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-envelope-open-text"></i>
                        </div>
                        <h4>Automated Emails</h4>
                        <p class="text-muted">Send confirmation emails, reminders, and event updates automatically using our integrated notification service.</p>
                    </div>
                </div>
                <!-- Feature 5 -->
                <!-- <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-qrcode"></i>
                        </div>
                        <h4>QR Check-in</h4>
                        <p class="text-muted">Speed up entry lines with our mobile-friendly QR code scanning system. Compatible with any smartphone or tablet.</p>
                    </div>
                </div> -->
                <!-- Feature 6 -->
                <div class="col-md-4">
                    <div class="feature-card">
                        <div class="icon-box">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h4>Secure Data</h4>
                        <p class="text-muted">Enterprise-grade security standards to protect sensitive delegate information. Role-based access control for staff.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works / Process -->
    <section id="process" class="py-5">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h2 class="fw-bold">How It Works</h2>
                <p class="text-muted">Get your event up and running in minutes.</p>
            </div>
            <div class="row text-center">
                <div class="col-md-4 process-step mb-4">
                    <div class="step-number">01</div>
                    <div class="card border-0 shadow-sm p-4">
                        <div class="card-body">
                            <h5 class="fw-bold">Create Event</h5>
                            <p class="text-muted">Set up your conference details, sessions, and ticket types using our intuitive organizer dashboard.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 process-step mb-4">
                    <div class="step-number">02</div>
                    <div class="card border-0 shadow-sm p-4">
                        <div class="card-body">
                            <h5 class="fw-bold">Invite Delegates</h5>
                            <p class="text-muted">Share a custom registration link or import delegate lists. Delegates fill out their own data.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 process-step mb-4">
                    <div class="step-number">03</div>
                    <div class="card border-0 shadow-sm p-4">
                        <div class="card-body">
                            <h5 class="fw-bold">Manage & Check-in</h5>
                            <p class="text-muted">On the big day, use the app to scan badges, track attendance, and handle walk-ins seamlessly.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-5 bg-primary text-white">
        <div class="container py-4 text-center">
            <h2 class="fw-bold mb-3">Ready to simplify your next conference?</h2>
            <p class="lead mb-4 opacity-75">Join hundreds of organizers using Confynex today.</p>
            <a href="#" class="btn btn-light btn-lg rounded-pill px-5 fw-bold text-primary">Create Free Account</a>
        </div>
    </section>

    <!-- Footer -->
    <footer id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <a class="navbar-brand text-white mb-3 d-inline-block" href="#">
                        <i class="fa-solid fa-id-card-clip"></i> Confynex
                    </a>
                    <p class="small text-muted">
                        The ultimate delegate management solution built for efficiency and scale. Perfect for academic conferences, corporate summits, and workshops.
                    </p>
                    <div class="d-flex gap-3 mt-3">
                        <a href="#"><i class="fab fa-twitter fa-lg"></i></a>
                        <a href="#"><i class="fab fa-linkedin fa-lg"></i></a>
                        <a href="#"><i class="fab fa-github fa-lg"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-6 mb-4">
                    <h5>Product</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#">Features</a></li>
                        <li class="mb-2"><a href="#">Pricing</a></li>
                        <li class="mb-2"><a href="#">API Documentation</a></li>
                        <li class="mb-2"><a href="#">System Status</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-6 mb-4">
                    <h5>Support</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#">Help Center</a></li>
                        <li class="mb-2"><a href="#">Contact Us</a></li>
                        <li class="mb-2"><a href="#">Privacy Policy</a></li>
                        <li class="mb-2"><a href="#">Terms of Service</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 mb-4">
                    <h5>Newsletter</h5>
                    <p class="small text-muted">Stay updated with the latest features and event tips.</p>
                    <form class="d-flex gap-2">
                        <input type="email" class="form-control" placeholder="Enter email">
                        <button class="btn btn-primary-custom" type="button">Subscribe</button>
                    </form>
                </div>
            </div>
            <hr class="border-secondary my-4">
            <div class="row align-items-center">
                <div class="col-md-6 text-center text-md-start">
                    <p class="small mb-0 text-muted">&copy; 2023 DelegatePro Systems. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <p class="small mb-0 text-muted">Built with Java Spring Boot & Bootstrap</p>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5 Bundle JS (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Simple Script for smooth scroll offset adjustment -->
    <script>
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const targetId = this.getAttribute('href');
                if (targetId === '#') return;

                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    const navbarHeight = document.querySelector('.navbar').offsetHeight;
                    const elementPosition = targetElement.getBoundingClientRect().top;
                    const offsetPosition = elementPosition + window.pageYOffset - navbarHeight;

                    window.scrollTo({
                        top: offsetPosition,
                        behavior: "smooth"
                    });
                }
            });
        });
    </script>
</body>
</html>