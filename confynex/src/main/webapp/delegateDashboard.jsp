<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // Simulating session data - in real app this comes from authentication
    String delegateName = (String) session.getAttribute("delegateName");
    if (delegateName == null) delegateName = "Alex Carter";
    String delegateId = (String) session.getAttribute("delegateId");
    if (delegateId == null) delegateId = "DLG-2024-0157";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delegate Dashboard | Confynex</title>

    <!-- Bootstrap 5 CSS (only external framework) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        :root{
            --primary:#facc15;      /* Bright Yellow */
            --primary-dark:#eab308; /* Darker Yellow */
            --accent:#fbbf24;       /* Amber/Yellow Accent */
            --warning:#f59e0b;
            --danger:#ef476f;
            --dark:#0b1120;         /* Deep Dark Navy Background */
            --dark-card:#1e293b;    /* Dark Slate for Cards */
            --light:#f8fafc;        /* Off White Text */
            --card:#1e293b;
            --border:#334155;       /* Dark Border */
        }
        *{font-family:'Poppins',sans-serif;}
        body{
            background:#0b1120;
            color:var(--light);
            overflow-x:hidden;
            padding-bottom: 40px;
        }
        h1,h2,h3,h4,h5,.display-font{font-family:'Space Grotesk',sans-serif;}

        /* ===== Navbar ===== */
        .navbar{
            background:rgba(11, 17, 32, 0.85);
            backdrop-filter:blur(20px);
            border-bottom:1px solid var(--border);
            padding:14px 0;
            position:sticky;
            top:0;
            z-index:1000;
        }
        .brand-logo{
            width:42px;height:42px;
            background:linear-gradient(135deg,var(--primary),var(--accent));
            border-radius:12px;
            display:flex;align-items:center;justify-content:center;
            color:var(--dark);font-weight:800;font-size:20px;
            box-shadow:0 8px 20px rgba(250, 204, 21, .35);
        }
        .navbar-brand div:first-of-type { color: var(--light); }
        .nav-link{font-weight:500;color:#cbd5e1 !important;margin:0 6px;transition:.3s;}
        .nav-link:hover, .nav-link.active{color:var(--primary) !important;}

        .btn-conference{
            background:var(--primary);
            color:var(--dark);font-weight:700;padding:10px 22px;border-radius:50px;
            border:none;transition:.35s;
            box-shadow:0 8px 22px rgba(250, 204, 21, .4);
        }
        .btn-conference:hover{
            transform:translateY(-2px);
            background:var(--primary-dark);
            box-shadow:0 12px 30px rgba(250, 204, 21, .55);
            color:var(--dark);
        }
        .btn-conference i{margin-right:6px;}

        /* ===== Hero ===== */
        .hero{
            position:relative;
            padding:60px 0 40px;
            overflow:hidden;
        }
        .blob{
            position:absolute;border-radius:50%;filter:blur(80px);
            opacity:.15;z-index:0;animation:float 12s ease-in-out infinite;
        }
        .blob-1{width:380px;height:380px;background:var(--primary);top:-120px;right:-60px;}
        .blob-2{width:300px;height:300px;background:var(--accent);bottom:-100px;left:-80px;animation-delay:-4s;opacity:.1;}
        @keyframes float{
            0%,100%{transform:translate(0,0) scale(1);}
            33%{transform:translate(30px,-30px) scale(1.05);}
            66%{transform:translate(-20px,20px) scale(0.95);}
        }
        .hero-content{position:relative;z-index:2;}
        .badge-greeting{
            display:inline-flex;align-items:center;gap:8px;
            background:rgba(250, 204, 21, .1);color:var(--primary);
            padding:8px 18px;border-radius:50px;font-weight:500;font-size:14px;
            margin-bottom:18px;border:1px solid rgba(250, 204, 21, .2);
            animation:slideDown .8s ease;
        }
        .hero h1{
            font-size:clamp(2rem,4vw,3.2rem);font-weight:700;line-height:1.15;
            animation:slideUp .9s ease;
        }
        .hero h1 .gradient-text{
            background:linear-gradient(135deg,var(--primary),var(--accent));
            -webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent;
        }
        .hero p.lead{
            color:#94a3b8;font-weight:400;max-width:560px;
            animation:slideUp 1s ease;
        }
        .delegate-id-pill{
            display:inline-flex;align-items:center;gap:8px;
            background:var(--dark-card);padding:8px 16px;border-radius:50px;
            border:1px solid var(--border);font-size:13px;font-weight:500;
            box-shadow:0 4px 12px rgba(0,0,0,.2);
            animation:slideUp 1.1s ease;
        }
        .delegate-id-pill .dot{
            width:8px;height:8px;border-radius:50%;background:var(--accent);
            animation:pulse 2s infinite;
        }
        @keyframes slideUp{from{opacity:0;transform:translateY(30px);}to{opacity:1;transform:translateY(0);}}
        @keyframes slideDown{from{opacity:0;transform:translateY(-20px);}to{opacity:1;transform:translateY(0);}}
        @keyframes pulse{
            0%,100%{box-shadow:0 0 0 0 rgba(251, 191, 36, .6);}
            50%{box-shadow:0 0 0 8px rgba(251, 191, 36, 0);}
        }

        /* Hero illustration */
        .hero-illustration{
            position:relative;
            animation:fadeIn 1.2s ease;
        }
        @keyframes fadeIn{from{opacity:0;transform:scale(.95);}to{opacity:1;transform:scale(1);}}
        .hero-img-wrap{
            border-radius:24px;overflow:hidden;
            box-shadow:0 30px 60px rgba(0,0,0,.4);
            position:relative;
            border:1px solid var(--border);
        }
        .hero-img-wrap img{width:100%;height:380px;object-fit:cover;display:block;}
        .hero-img-wrap::after{
            content:'';position:absolute;inset:0;
            background:linear-gradient(135deg,rgba(250, 204, 21, .25),rgba(11, 17, 32, .6));
        }
        .floating-card{
            position:absolute;background:var(--dark-card);border:1px solid var(--border);
            border-radius:14px;padding:12px 16px;
            box-shadow:0 14px 30px rgba(0,0,0,.3);display:flex;align-items:center;gap:10px;
            animation:bob 3s ease-in-out infinite;
        }
        .floating-card .icon{
            width:38px;height:38px;border-radius:10px;display:flex;align-items:center;justify-content:center;
            color:var(--dark);font-size:18px;
        }
        .fc-1{top:30px;left:-30px;animation-delay:0s;}
        .fc-1 .icon{background:var(--accent);}
        .fc-2{bottom:60px;right:-25px;animation-delay:-1.5s;}
        .fc-2 .icon{background:var(--primary);}
        .fc-3{bottom:-15px;left:30px;animation-delay:-2.5s;}
        .fc-3 .icon{background:var(--warning);}
        .floating-card div div:first-child{color:#94a3b8;}
        .floating-card div div:last-child{color:var(--light);}
        @keyframes bob{
            0%,100%{transform:translateY(0);}
            50%{transform:translateY(-12px);}
        }

        /* ===== Stats Cards ===== */
        .stat-card{
            background:var(--dark-card);border:1px solid var(--border);border-radius:18px;
            padding:24px;transition:.4s;position:relative;overflow:hidden;
            animation:slideUp 1.2s ease both;
        }
        .stat-card:hover{transform:translateY(-6px);box-shadow:0 20px 40px rgba(0,0,0,.3);border-color:var(--primary);}
        .stat-card::before{
            content:'';position:absolute;top:0;left:0;width:100%;height:4px;
            background:var(--gradient);
        }
        .stat-card .icon-box{
            width:52px;height:52px;border-radius:14px;display:flex;align-items:center;justify-content:center;
            font-size:24px;color:var(--dark);margin-bottom:14px;
        }
        .stat-card .number{font-size:2rem;font-weight:700;line-height:1;color:var(--light);}
        .stat-card .label{color:#94a3b8;font-size:14px;margin-top:4px;}
        .stat-card .trend{font-size:12px;font-weight:600;margin-top:8px;}
        .trend-up{color:var(--accent);}
        .trend-down{color:var(--danger);}

        /* ===== Section ===== */
        .section-title{
            display:flex;align-items:center;gap:14px;margin-bottom:8px;
        }
        .section-title .bar{
            width:5px;height:38px;background:linear-gradient(180deg,var(--primary),var(--accent));border-radius:10px;
        }
        .section-title h2{font-size:1.8rem;font-weight:700;margin:0;color:var(--light);}
        .section-subtitle{color:#94a3b8;margin-left:19px;}

        /* ===== Workflow ===== */
        .workflow-section{padding:60px 0;position:relative;}
        .workflow-container{
            background:var(--dark-card);border:1px solid var(--border);border-radius:24px;padding:50px 30px;
            box-shadow:0 20px 60px rgba(0,0,0,.2);
            position:relative;overflow:hidden;
        }
        .workflow-grid{
            display:grid;grid-template-columns:repeat(8,1fr);gap:10px;
            position:relative;align-items:start;
        }
        .workflow-step{
            text-align:center;position:relative;z-index:2;
            animation:popIn .8s ease both;
        }
        .workflow-step:nth-child(1){animation-delay:.1s;}
        .workflow-step:nth-child(2){animation-delay:.2s;}
        .workflow-step:nth-child(3){animation-delay:.3s;}
        .workflow-step:nth-child(4){animation-delay:.4s;}
        .workflow-step:nth-child(5){animation-delay:.5s;}
        .workflow-step:nth-child(6){animation-delay:.6s;}
        .workflow-step:nth-child(7){animation-delay:.7s;}
        .workflow-step:nth-child(8){animation-delay:.8s;}
        @keyframes popIn{from{opacity:0;transform:scale(.5);}to{opacity:1;transform:scale(1);}}

        .step-circle{
            width:80px;height:80px;border-radius:50%;margin:0 auto 14px;
            display:flex;align-items:center;justify-content:center;
            font-size:30px;color:var(--dark);position:relative; /* Dark icons on yellow */
            background:linear-gradient(135deg,var(--primary),var(--primary-dark));
            box-shadow:0 12px 25px rgba(250, 204, 21, .3);
            transition:.4s;
        }
        .workflow-step:hover .step-circle{transform:scale(1.1) rotate(8deg);}
        .step-circle::after{
            content:'';position:absolute;inset:-6px;border-radius:50%;
            border:2px dashed var(--primary);opacity:.4;
            animation:spin 20s linear infinite;
        }
        @keyframes spin{to{transform:rotate(360deg);}}

        /* Mixing yellows and ambers for the dark theme */
        .step-circle.c1{background:linear-gradient(135deg,#facc15,#eab308);}
        .step-circle.c2{background:linear-gradient(135deg,#fbbf24,#d97706);}
        .step-circle.c3{background:linear-gradient(135deg,#fde047,#facc15);}
        .step-circle.c4{background:linear-gradient(135deg,#f59e0b,#b45309);}
        .step-circle.c5{background:linear-gradient(135deg,#fcd34d,#f59e0b);}
        .step-circle.c6{background:linear-gradient(135deg,#eab308,#ca8a04);}
        .step-circle.c7{background:linear-gradient(135deg,#fbbf24,#ea580c);}
        .step-circle.c8{background:linear-gradient(135deg,#facc15,#a16207);}

        .step-num{
            position:absolute;top:-6px;right:-6px;
            width:26px;height:26px;background:var(--dark);color:var(--primary);
            border-radius:50%;font-size:12px;font-weight:700;
            display:flex;align-items:center;justify-content:center;
            box-shadow:0 4px 10px rgba(0,0,0,.3);
            z-index:3;border: 1px solid var(--border);
        }
        .step-title{font-weight:600;font-size:14px;margin-bottom:4px;color:var(--light);}
        .step-desc{font-size:11px;color:#94a3b8;line-height:1.4;}

        .workflow-line{
            position:absolute;top:40px;left:5%;right:5%;height:3px;
            background:linear-gradient(90deg,var(--primary),var(--accent),var(--warning));
            opacity:.25;z-index:1;
        }

        /* ===== Conferences ===== */
        .conf-card{
            background:var(--dark-card);border:1px solid var(--border);border-radius:18px;
            overflow:hidden;transition:.4s;
            animation:slideUp 1.4s ease both;
        }
        .conf-card:hover{transform:translateY(-8px);box-shadow:0 25px 50px rgba(0,0,0,.4);border-color:var(--primary);}
        .conf-img{height:180px;overflow:hidden;position:relative;}
        .conf-img img{width:100%;height:100%;object-fit:cover;transition:.6s;}
        .conf-card:hover .conf-img img{transform:scale(1.08);}
        .conf-img::after{
            content:'';position:absolute;inset:0;
            background:linear-gradient(180deg,transparent 40%,rgba(11, 17, 32, .9) 100%);
        }
        .conf-tag{
            position:absolute;top:14px;left:14px;z-index:2;
            background:var(--primary);padding:6px 12px;border-radius:50px;
            font-size:11px;font-weight:700;color:var(--dark);
        }
        .conf-status{
            position:absolute;bottom:14px;left:14px;z-index:2;color:#fff;
            font-size:13px;font-weight:500;display:flex;align-items:center;gap:6px;
        }
        .conf-body{padding:20px;}
        .conf-date{color:var(--primary);font-size:13px;font-weight:600;}
        .conf-title{font-weight:600;font-size:1.05rem;margin:6px 0 10px;line-height:1.3;color:var(--light);}
        .conf-meta{font-size:13px;color:#94a3b8;display:flex;align-items:center;gap:14px;}
        .conf-meta i{color:var(--primary);margin-right:4px;}
        .btn-outline-primary {
            color: var(--primary);
            border-color: var(--primary);
        }
        .btn-outline-primary:hover {
            background-color: var(--primary);
            border-color: var(--primary);
            color: var(--dark);
        }

        /* ===== Quick Actions ===== */
        .quick-action{
            background:var(--dark-card);border:1px solid var(--border);border-radius:16px;padding:22px;
            display:flex;align-items:center;gap:16px;transition:.35s;cursor:pointer;
            text-decoration:none;color:inherit;
        }
        .quick-action:hover{transform:translateX(8px);box-shadow:0 14px 30px rgba(0,0,0,.2);border-color:var(--primary);}
        .qa-icon{
            width:50px;height:50px;border-radius:14px;display:flex;align-items:center;justify-content:center;
            font-size:22px;color:var(--dark);flex-shrink:0;
        }
        .qa-title{font-weight:600;font-size:.95rem;color:var(--light);}
        .qa-sub{font-size:13px;color:#94a3b8;}

        /* Responsive */
        @media(max-width:991px){
            .workflow-grid{grid-template-columns:repeat(4,1fr);gap:30px 20px;}
            .workflow-line{display:none;}
            .hero-illustration{margin-top:40px;}
        }
        @media(max-width:575px){
            .workflow-grid{grid-template-columns:repeat(2,1fr);}
            .step-circle{width:64px;height:64px;font-size:24px;}
        }

        /* Scroll reveal */
        .reveal{opacity:0;transform:translateY(40px);transition:.8s cubic-bezier(.2,.7,.2,1);}
        .reveal.visible{opacity:1;transform:translateY(0);}

        /* Progress bar in workflow detail */
        .progress-track{
            background:#0f172a;border-radius:50px;height:10px;overflow:hidden;margin-top:30px;position:relative;
            border:1px solid var(--border);
        }
        .progress-fill{
            height:100%;width:0;border-radius:50px;
            background:linear-gradient(90deg,var(--primary),var(--accent));
            transition:width 2s ease;
        }

        /* Dark mode dropdown and modal */
        .dropdown-menu {
            background-color: var(--dark-card);
            border: 1px solid var(--border);
        }
        .dropdown-item {
            color: #cbd5e1;
        }
        .dropdown-item:hover, .dropdown-item:focus {
            background-color: #334155;
            color: var(--primary);
        }
        .dropdown-divider {
            border-color: var(--border);
        }

        .modal-content {
            background-color: var(--dark-card);
            border: 1px solid var(--border);
            color: var(--light);
        }
        .modal-header {
            background: var(--primary) !important;
            color: var(--dark) !important;
            border-bottom: 1px solid var(--border);
        }
        .modal-header .btn-close {
            filter: invert(1) grayscale(1) brightness(0); /* Makes close button dark */
        }
        .form-control, .form-select {
            background-color: #0f172a;
            border: 1px solid var(--border);
            color: var(--light);
        }
        .form-control:focus, .form-select:focus {
            background-color: #0f172a;
            border-color: var(--primary);
            color: var(--light);
            box-shadow: 0 0 0 .25rem rgba(250, 204, 21, .25);
        }
        .form-label { color: #cbd5e1; }
        .alert-info {
            background-color: rgba(250, 204, 21, .1);
            border: 1px solid rgba(250, 204, 21, .2);
            color: var(--primary);
        }
        .btn-light {
            background-color: #334155;
            border-color: #334155;
            color: #fff;
        }
        .btn-light:hover {
            background-color: #475569;
            border-color: #475569;
            color: #fff;
        }
    </style>
</head>
<body>

    <!-- ===== NAVBAR ===== -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand d-flex align-items-center gap-2" href="#">
                <div class="brand-logo">C</div>
                <div>
                    <div style="font-weight:700;font-size:1.1rem;line-height:1;">Confynex</div>
                </div>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain" style="border-color:var(--border);">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navMain">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="#workflow">Workflow</a></li>
                    <li class="nav-item"><a class="nav-link" href="#conferences">Conferences</a></li>
                    <li class="nav-item"><a class="nav-link" href="#sessions">Sessions</a></li>
                    <li class="nav-item"><a class="nav-link" href="#certificate">Certificate</a></li>
                </ul>
                <div class="d-flex align-items-center gap-3">
                    <!-- <button class="btn btn-conference" data-bs-toggle="modal" data-bs-target="#confDetailModal">
                        <i class="bi bi-card-checklist"></i>Get Your Conference Detail
                    </button>-->

                    <form action="readConferenceDetails" method="POST">
                        <button type="submit" class="btn btn-conference">
                            <i class="bi bi-card-checklist"></i> Get Your Conference Detail
                        </button>
                    </form>

                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" style="color: var(--light);">
                            <div style="width:38px;height:38px;border-radius:50%;background:linear-gradient(135deg,var(--primary),var(--accent));color:var(--dark);display:flex;align-items:center;justify-content:center;font-weight:700;">
                                <%= delegateName.substring(0,1) %>
                            </div>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2"></i>My Profile</a></li>
                            <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="logout.jsp"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!-- ===== HERO ===== -->
    <section class="hero">
        <div class="blob blob-1"></div>
        <div class="blob blob-2"></div>
        <div class="container hero-content">
            <div class="row align-items-center g-4">
                <div class="col-lg-7">
                    <span class="badge-greeting">
                        <i class="bi bi-stars"></i> Welcome back to your delegate portal
                    </span>
                    <h1>Hello, Welcome to CONFYNEX <span class="gradient-text"><%= delegateName %></span><br>your next conference awaits.</h1>
                    <p class="lead mt-3">Manage your registrations, sessions, and certificates — all in one place. Track every step of your conference journey with the Confynex Management System.</p>
                    <div class="d-flex flex-wrap align-items-center gap-3 mt-4">
                        <div class="delegate-id-pill">
                            <span class="dot"></span> Delegate ID: <strong><%= delegateId %></strong>
                        </div>
                        <a href="#conferences" class="btn btn-conference"><i class="bi bi-calendar2-event"></i> View Upcoming Conferences</a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="hero-illustration">
                        <div class="hero-img-wrap">
                            <img src="https://images.unsplash.com/photo-1540575467063-178a50c2df87?auto=format&fit=crop&w=900&q=80" alt="Conference Hall">
                        </div>
                        <div class="floating-card fc-1">
                            <div class="icon"><i class="bi bi-check2-circle"></i></div>
                            <div>
                                <div style="font-size:11px;">Registration</div>
                                <div style="font-weight:600;font-size:13px;">Confirmed</div>
                            </div>
                        </div>
                        <div class="floating-card fc-2">
                            <div class="icon"><i class="bi bi-qr-code"></i></div>
                            <div>
                                <div style="font-size:11px;">Entry Pass</div>
                                <div style="font-weight:600;font-size:13px;">QR Ready</div>
                            </div>
                        </div>
                        <div class="floating-card fc-3">
                            <div class="icon"><i class="bi bi-award"></i></div>
                            <div>
                                <div style="font-size:11px;">Certificate</div>
                                <div style="font-weight:600;font-size:13px;">Pending</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== STATS ===== -->
    <section class="container">
        <div class="row g-4">
            <div class="col-lg-4 col-md-4">
                <div class="stat-card" style="--gradient:linear-gradient(90deg,#facc15,#eab308);">
                    <div class="icon-box" style="background:linear-gradient(135deg,#facc15,#eab308);"><i class="bi bi-calendar-check"></i></div>
                    <div class="number" data-count="7">0</div>
                    <div class="label">Registered Conferences</div>
                    <div class="trend trend-up"><i class="bi bi-arrow-up"></i> +2 this month</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="stat-card" style="--gradient:linear-gradient(90deg,#fbbf24,#d97706);">
                    <div class="icon-box" style="background:linear-gradient(135deg,#fbbf24,#d97706);"><i class="bi bi-mic"></i></div>
                    <div class="number" data-count="14">0</div>
                    <div class="label">Sessions Attended</div>
                    <div class="trend trend-up"><i class="bi bi-arrow-up"></i> +5 this week</div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4">
                <div class="stat-card" style="--gradient:linear-gradient(90deg,#fcd34d,#f59e0b);">
                    <div class="icon-box" style="background:linear-gradient(135deg,#fcd34d,#f59e0b);"><i class="bi bi-award"></i></div>
                    <div class="number" data-count="3">0</div>
                    <div class="label">Certificates Earned</div>
                    <div class="trend trend-down"><i class="bi bi-clock"></i> 2 pending</div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== WORKFLOW ===== -->
    <section class="workflow-section container" id="workflow">
        <div class="section-title reveal">
            <div class="bar"></div>
            <h2>Application Workflow</h2>
        </div>
        <p class="section-subtitle reveal">Complete journey of a delegate through the Conference Management System</p>

        <div class="workflow-container mt-4 reveal">
            <div class="workflow-line"></div>
            <div class="workflow-grid">
                <div class="workflow-step">
                    <div class="step-circle c1"><span class="step-num">1</span><i class="bi bi-person-plus"></i></div>
                    <div class="step-title">Registration</div>
                    <div class="step-desc">Delegate signs up with personal & professional details</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c2"><span class="step-num">2</span><i class="bi bi-box-arrow-in-right"></i></div>
                    <div class="step-title">Login</div>
                    <div class="step-desc">Secure authentication into delegate portal</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c3"><span class="step-num">3</span><i class="bi bi-search"></i></div>
                    <div class="step-title">Browse</div>
                    <div class="step-desc">Explore upcoming conferences & sessions</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c4"><span class="step-num">4</span><i class="bi bi-calendar2-plus"></i></div>
                    <div class="step-title">Register</div>
                    <div class="step-desc">Select conferences and confirm registration</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c5"><span class="step-num">5</span><i class="bi bi-qr-code"></i></div>
                    <div class="step-title">QR Pass</div>
                    <div class="step-desc">Generate unique QR entry badge</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c6"><span class="step-num">6</span><i class="bi bi-camera"></i></div>
                    <div class="step-title">Check-in</div>
                    <div class="step-desc">On-spot QR verification at venue</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c7"><span class="step-num">7</span><i class="bi bi-mic"></i></div>
                    <div class="step-title">Attend</div>
                    <div class="step-desc">Participate in sessions & events</div>
                </div>
                <div class="workflow-step">
                    <div class="step-circle c8"><span class="step-num">8</span><i class="bi bi-award"></i></div>
                    <div class="step-title">Certificate</div>
                    <div class="step-desc">Download participation certificate</div>
                </div>
            </div>
            <div class="progress-track"><div class="progress-fill" id="wfProgress"></div></div>
            <div class="d-flex justify-content-between mt-2">
                <small style="color:#94a3b8;">Start</small>
                <small style="color:var(--primary);">You are here: Step 5 — QR Pass</small>
                <small style="color:#94a3b8;">Complete</small>
            </div>
        </div>
    </section>

    <!-- ===== UPCOMING CONFERENCES ===== -->
    <section class="container mt-5" id="conferences">
        <div class="section-title reveal">
            <div class="bar"></div>
            <h2>Upcoming Conferences</h2>
        </div>
        <p class="section-subtitle reveal">Discover and register for events matching your interests</p>

        <div class="row g-4 mt-2">
            <div class="col-lg-4 col-md-6">
                <div class="conf-card reveal">
                    <div class="conf-img">
                        <span class="conf-tag">Technology</span>
                        <span class="conf-status"><span class="dot" style="width:8px;height:8px;background:var(--accent);border-radius:50%;display:inline-block;"></span> Open</span>
                        <img src="https://images.unsplash.com/photo-1505373877841-8d25f7d46678?auto=format&fit=crop&w=700&q=80" alt="Tech Conference">
                    </div>
                    <div class="conf-body">
                        <div class="conf-date"><i class="bi bi-calendar3"></i> Mar 15-17, 2025</div>
                        <h5 class="conf-title">Global AI & Machine Learning Summit 2025</h5>
                        <div class="conf-meta">
                            <span><i class="bi bi-geo-alt"></i>San Francisco</span>
                            <span><i class="bi bi-people"></i>1200+</span>
                        </div>
                        <a href="#" class="btn btn-outline-primary btn-sm mt-3 w-100">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="conf-card reveal">
                    <div class="conf-img">
                        <span class="conf-tag">Medical</span>
                        <span class="conf-status"><span class="dot" style="width:8px;height:8px;background:var(--warning);border-radius:50%;display:inline-block;"></span> Few Seats</span>
                        <img src="https://images.unsplash.com/photo-1576091160550-2173dba999ef?auto=format&fit=crop&w=700&q=80" alt="Medical Conference">
                    </div>
                    <div class="conf-body">
                        <div class="conf-date"><i class="bi bi-calendar3"></i> Apr 08-10, 2025</div>
                        <h5 class="conf-title">International Conference on Medical Research</h5>
                        <div class="conf-meta">
                            <span><i class="bi bi-geo-alt"></i>Boston, USA</span>
                            <span><i class="bi bi-people"></i>800+</span>
                        </div>
                        <a href="#" class="btn btn-outline-primary btn-sm mt-3 w-100">View Details</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="conf-card reveal">
                    <div class="conf-img">
                        <span class="conf-tag">Business</span>
                        <span class="conf-status"><span class="dot" style="width:8px;height:8px;background:var(--accent);border-radius:50%;display:inline-block;"></span> Open</span>
                        <img src="https://images.unsplash.com/photo-1556761175-5973dc0f32e7?auto=format&fit=crop&w=700&q=80" alt="Business Conference">
                    </div>
                    <div class="conf-body">
                        <div class="conf-date"><i class="bi bi-calendar3"></i> May 22-24, 2025</div>
                        <h5 class="conf-title">World Business & Entrepreneurship Forum</h5>
                        <div class="conf-meta">
                            <span><i class="bi bi-geo-alt"></i>London, UK</span>
                            <span><i class="bi bi-people"></i>2000+</span>
                        </div>
                        <a href="#" class="btn btn-outline-primary btn-sm mt-3 w-100">View Details</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== QUICK ACTIONS ===== -->
    <section class="container mt-5" id="sessions">
        <div class="section-title reveal">
            <div class="bar"></div>
            <h2>Quick Actions</h2>
        </div>
        <p class="section-subtitle reveal">Shortcuts to your most-used features</p>

        <div class="row g-3 mt-2">
            <div class="col-lg-4 col-md-4 reveal">
                <a href="#" class="quick-action">
                    <div class="qa-icon" style="background:linear-gradient(135deg,#facc15,#eab308);"><i class="bi bi-qr-code"></i></div>
                    <div>
                        <div class="qa-title">Download Entry Pass</div>
                        <div class="qa-sub">Get your QR badge</div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 reveal">
                <a href="#" class="quick-action">
                    <div class="qa-icon" style="background:linear-gradient(135deg,#fbbf24,#d97706);"><i class="bi bi-mic"></i></div>
                    <div>
                        <div class="qa-title">My Sessions</div>
                        <div class="qa-sub">View session schedule</div>
                    </div>
                </a>
            </div>
            <div class="col-lg-4 col-md-4 reveal" id="certificate">
                <a href="#" class="quick-action">
                    <div class="qa-icon" style="background:linear-gradient(135deg,#fcd34d,#f59e0b);"><i class="bi bi-award"></i></div>
                    <div>
                        <div class="qa-title">Certificates</div>
                        <div class="qa-sub">Download earned certs</div>
                    </div>
                </a>
            </div>
        </div>
    </section>

    <!-- ===== MODAL: Get Conference Detail ===== -->
    <div class="modal fade" id="confDetailModal" tabindex="-1">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content" style="border-radius:20px;border:none;">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="bi bi-card-checklist me-2"></i>Get Your Conference Detail</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <p style="color:#94a3b8;">Enter your Delegate ID to fetch your conference information instantly.</p>
                    <form id="confDetailForm">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Delegate ID</label>
                                <input type="text" class="form-control" value="<%= delegateId %>" readonly>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Email Address</label>
                                <input type="email" class="form-control" placeholder="you@example.com" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Select Conference</label>
                                <select class="form-select">
                                    <option>AI & ML Summit 2025</option>
                                    <option>Medical Research Conference</option>
                                    <option>Business Forum 2025</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Pass Type</label>
                                <select class="form-select">
                                    <option>Standard Delegate</option>
                                    <option>Student Delegate</option>
                                    <option>VIP Delegate</option>
                                </select>
                            </div>
                        </div>
                        <div class="alert alert-info mt-3 mb-0" style="border-radius:12px;">
                            <i class="bi bi-info-circle me-2"></i>Your conference pass, schedule, and venue map will be sent to your registered email.
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="border-top: 1px solid var(--border);">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-conference" onclick="alert('Conference details sent to your email!')">
                        <i class="bi bi-send me-1"></i>Get Details
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // ===== Number counter animation =====
        function animateCounter(el){
            const target = +el.dataset.count;
            let current = 0;
            const step = Math.ceil(target / 40);
            const timer = setInterval(()=>{
                current += step;
                if(current >= target){current = target;clearInterval(timer);}
                el.textContent = current;
            },30);
        }

        // ===== Reveal on scroll =====
        const observer = new IntersectionObserver((entries)=>{
            entries.forEach(entry=>{
                if(entry.isIntersecting){
                    entry.target.classList.add('visible');
                    if(entry.target.classList.contains('stat-card')){
                        const num = entry.target.querySelector('.number');
                        if(num && !num.dataset.done){animateCounter(num);num.dataset.done='true';}
                    }
                    if(entry.target.id === 'workflow' || entry.target.classList.contains('workflow-container')){
                        document.getElementById('wfProgress').style.width = '50%';
                    }
                }
            });
        },{threshold:0.15});

        document.querySelectorAll('.reveal,.stat-card,.workflow-container').forEach(el=>observer.observe(el));

        // ===== Trigger initial stats animation =====
        setTimeout(()=>{
            document.querySelectorAll('.stat-card').forEach(card=>{
                const num = card.querySelector('.number');
                if(num && !num.dataset.done){animateCounter(num);num.dataset.done='true';}
            });
        },800);

        // ===== Workflow progress on load =====
        setTimeout(()=>{document.getElementById('wfProgress').style.width='50%';},1500);

        // ===== Smooth scroll for nav links =====
        document.querySelectorAll('a[href^="#"]').forEach(a=>{
            a.addEventListener('click',function(e){
                const target = document.querySelector(this.getAttribute('href'));
                if(target){e.preventDefault();target.scrollIntoView({behavior:'smooth',block:'start'});}
            });
        });
    </script>
</body>
</html>