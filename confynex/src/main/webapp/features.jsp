<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features | DelegatePro</title>

    <!-- Bootstrap 5 CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <style>
        :root {
            --primary-color: #2563eb;
            --primary-light: #eff6ff;
            --secondary-color: #1e293b;
            --text-dark: #334155;
            --text-light: #64748b;
            --border-color: #e2e8f0;
        }

        body {
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            background-color: #ffffff;
            overflow-x: hidden;
        }

        /* --- Navbar --- */
        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--border-color);
        }

        .nav-link {
            font-weight: 500;
            color: var(--secondary-color);
        }
        .nav-link.active {
            color: var(--primary-color);
        }

        /* --- Hero Section --- */
        .features-hero {
            padding: 100px 0 60px;
            text-align: center;
            background: radial-gradient(circle at top center, #f8fafc 0%, #ffffff 70%);
        }

        .features-hero h1 {
            font-weight: 800;
            font-size: 3rem;
            letter-spacing: -0.02em;
            margin-bottom: 1.5rem;
        }

        .gradient-text {
            background: linear-gradient(135deg, var(--primary-color), #9333ea);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* --- Feature Cards Grid --- */
        .feature-card {
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 2rem;
            height: 100%;
            transition: all 0.3s ease;
            background: white;
            position: relative;
            overflow: hidden;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            border-color: var(--primary-color);
        }

        .icon-circle {
            width: 60px;
            height: 60px;
            background-color: var(--primary-light);
            color: var(--primary-color);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 1.5rem;
        }

        /* --- Zig Zag Sections --- */
        .zig-zag-section {
            padding: 80px 0;
        }

        .zz-img {
            border-radius: 20px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.15);
            width: 100%;
            height: 400px;
            object-fit: cover;
        }

        .feature-list-item {
            display: flex;
            align-items: flex-start;
            margin-bottom: 1.5rem;
        }

        .check-icon {
            color: #10b981;
            margin-top: 4px;
            margin-right: 12px;
        }

        /* --- Tech Stack Section --- */
        .tech-section {
            background-color: var(--secondary-color);
            color: white;
            padding: 80px 0;
        }

        .tech-badge {
            background: rgba(255,255,255,0.1);
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin: 5px;
            border: 1px solid rgba(255,255,255,0.1);
        }

        /* --- Scroll Animation Classes --- */
        .reveal {
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease-out;
        }

        .reveal.active {
            opacity: 1;
            transform: translateY(0);
        }

    </style>
</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="index.html">
                <i class="fa-solid fa-id-card-clip me-2"></i>Confynex
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link" href="index">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="#">Features</a></li>
                    <li class="nav-item"><a class="nav-link" href="#pricing">Pricing</a></li>
                </ul>
                <div>
                    <a href="admin-login.html" class="btn btn-outline-primary btn-sm me-2">Admin Login</a>
                    <a href="host-registration.html" class="btn btn-primary btn-sm rounded-pill px-4">Get Started</a>
                </div>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="features-hero">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 reveal">
                    <span class="badge bg-primary bg-opacity-10 text-primary mb-3 px-3 py-2 rounded-pill">Why Choose Us</span>
                    <h1 class="mb-4">Complete Control Over <br><span class="gradient-text">Your Conference Data</span></h1>
                    <p class="lead text-muted mb-5">
                        From the first registration to the final badge print, Confynex provides the tools you need to manage attendees efficiently and securely.
                    </p>
                </div>
            </div>
        </div>
    </section>

    <!-- Core Features Grid -->
    <section class="py-5 bg-light">
        <div class="container py-4">
            <div class="row g-4">
                <!-- Feature 1 -->
                <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-laptop-code"></i>
                        </div>
                        <h4>Custom Registration Forms</h4>
                        <p class="text-muted">Build dynamic forms with our drag-and-drop builder. Collect dietary requirements, shirt sizes, and session preferences effortlessly.</p>
                    </div>
                </div>

                <!-- Feature 2 -->
                <!-- <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-id-badge"></i>
                        </div>
                        <h4>Instant Badge Printing</h4>
                        <p class="text-muted">Connect any thermal printer to generate professional name badges on-demand. Includes QR codes for quick scanning.</p>
                    </div>
                </div> -->

                <!-- Feature 3 -->
                <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-mobile-alt"></i>
                        </div>
                        <h4>Mobile Check-in Kiosk</h4>
                        <p class="text-muted">Turn an iPad or tablet into a self-service kiosk. Delegates can check themselves in, reducing queue times significantly.</p>
                    </div>
                </div>

                <!-- Feature 4 -->
                <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h4>Real-time Analytics</h4>
                        <p class="text-muted">Track attendance rates, session popularity, and revenue generation live on your admin dashboard.</p>
                    </div>
                </div>

                <!-- Feature 5 -->
                <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-envelope-open-text"></i>
                        </div>
                        <h4>Automated Communication</h4>
                        <p class="text-muted">Send confirmation emails, reminder notifications, and post-event surveys automatically based on triggers.</p>
                    </div>
                </div>

                <!-- Feature 6 -->
                <div class="col-lg-4 col-md-6 reveal">
                    <div class="feature-card">
                        <div class="icon-circle">
                            <i class="fas fa-users-cog"></i>
                        </div>
                        <h4>Role-Based Access</h4>
                        <p class="text-muted">Grant specific permissions to your team. Volunteers can scan badges, while admins manage finances.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Detailed Feature 1: Analytics (Zig Zag) -->
    <section class="zig-zag-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0 reveal">
                    <img src="https://picsum.photos/seed/analytics/600/400" alt="Analytics Dashboard" class="zz-img">
                </div>
                <div class="col-lg-6 ps-lg-5 reveal">
                    <h2 class="fw-bold mb-3">Data-Driven Decisions</h2>
                    <p class="text-muted mb-4">
                        Stop guessing. Understand your audience with granular data reporting. Our system captures every interaction to help you improve future events.
                    </p>

                    <div class="feature-list-item">
                        <i class="fas fa-check-circle check-icon fa-lg"></i>
                        <div>
                            <h6 class="fw-bold">Session Heatmaps</h6>
                            <p class="small text-muted m-0">See which talks are packed and which need better marketing next year.</p>
                        </div>
                    </div>
                    <div class="feature-list-item">
                        <i class="fas fa-check-circle check-icon fa-lg"></i>
                        <div>
                            <h6 class="fw-bold">Demographic Breakdown</h6>
                            <p class="small text-muted m-0">Analyze attendee geography, job titles, and industries.</p>
                        </div>
                    </div>
                    <div class="feature-list-item">
                        <i class="fas fa-check-circle check-icon fa-lg"></i>
                        <div>
                            <h6 class="fw-bold">Exportable Reports</h6>
                            <p class="small text-muted m-0">Download data as CSV, PDF, or Excel for your stakeholders.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Detailed Feature 2: Communication (Zig Zag Reverse) -->
    <section class="zig-zag-section bg-light">
        <div class="container">
            <div class="row align-items-center">
                <!-- Order swapped for desktop: Image Right -->
                <div class="col-lg-6 order-lg-2 mb-4 mb-lg-0 reveal">
                    <img src="https://picsum.photos/seed/email/600/400" alt="Email Communication" class="zz-img">
                </div>
                <div class="col-lg-6 order-lg-1 pe-lg-5 reveal">
                    <h2 class="fw-bold mb-3">Keep Everyone Informed</h2>
                    <p class="text-muted mb-4">
                        Communication is key to a successful event. Automate your outreach to ensure no delegate misses important updates.
                    </p>

                    <ul class="list-unstyled">
                        <li class="mb-3 d-flex">
                            <i class="fas fa-paper-plane text-primary mt-1 me-3"></i>
                            <div>
                                <strong>Event Reminders:</strong> Automated emails 24 hours and 1 hour before the event starts.
                            </div>
                        </li>
                        <li class="mb-3 d-flex">
                            <i class="fas fa-exclamation-circle text-warning mt-1 me-3"></i>
                            <div>
                                <strong>Instant Alerts:</strong> Notify attendees immediately if a session location changes or is cancelled.
                            </div>
                        </li>
                        <li class="mb-3 d-flex">
                            <i class="fas fa-file-invoice text-success mt-1 me-3"></i>
                            <div>
                                <strong>Digital Receipts & Invoices:</strong> Automatically generated and sent upon successful payment.
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- Technical Stack Section -->
    <section class="tech-section text-center">
        <div class="container reveal">
            <h2 class="fw-bold mb-3">Built on Robust Technology</h2>
            <p class="text-white-50 mb-5">Powered by Java for maximum security and scalability.</p>

            <div class="d-flex flex-wrap justify-content-center">
                <div class="tech-badge">
                    <i class="fab fa-java"></i> Java Spring Boot
                </div>
                <div class="tech-badge">
                    <i class="fas fa-database"></i> MySQL / PostgreSQL
                </div>
                <div class="tech-badge">
                    <i class="fab fa-bootstrap"></i> Bootstrap 5
                </div>
                <div class="tech-badge">
                    <i class="fas fa-shield-alt"></i> Spring Security
                </div>
                <div class="tech-badge">
                    <i class="fas fa-cloud"></i> RESTful API
                </div>
                <div class="tech-badge">
                    <i class="fas fa-server"></i> Tomcat Server
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action -->
    <section class="py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center reveal">
                    <div class="p-5 rounded-4 border bg-white shadow-sm">
                        <h2 class="fw-bold mb-3">Ready to streamline your next event?</h2>
                        <p class="text-muted mb-4">Join hundreds of event organizers using Confynex today.</p>
                        <div class="d-flex justify-content-center gap-3">
                            <a href="host-registration.html" class="btn btn-primary btn-lg rounded-pill px-5">Start Free Trial</a>
                            <a href="#" class="btn btn-outline-secondary btn-lg rounded-pill px-4">Schedule Demo</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-white border-top py-5">
        <div class="container text-center">
            <p class="text-muted small mb-0">&copy; 2026 Confynex Systems. Built with Java & Bootstrap.</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Scroll Reveal Script -->
    <script>
        // Simple Intersection Observer to animate elements when they scroll into view
        document.addEventListener('DOMContentLoaded', () => {
            const reveals = document.querySelectorAll('.reveal');

            const revealOnScroll = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('active');
                        observer.unobserve(entry.target); // Only animate once
                    }
                });
            }, {
                threshold: 0.15 // Trigger when 15% of the element is visible
            });

            reveals.forEach(reveal => {
                revealOnScroll.observe(reveal);
            });
        });
    </script>
</body>
</html>