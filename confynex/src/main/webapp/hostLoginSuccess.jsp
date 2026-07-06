<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Delegate Management System – Welcome</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet"/>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700;900&family=DM+Sans:wght@300;400;500;600&display=swap" rel="stylesheet"/>

  <style>
    :root {
      --navy:   #0B1D3A;
      --gold:   #C9A84C;
      --gold-lt:#F0D58C;
      --cream:  #F9F6EF;
      --slate:  #4A5568;
      --card-bg:#FFFFFF;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    body {
      font-family: 'DM Sans', sans-serif;
      background: var(--cream);
      color: var(--navy);
      min-height: 100vh;
    }

    /* ─── NAVBAR (standard Bootstrap navbar + navy/gold theme) ─── */
    .navbar-dms {
      background-color: #0B0F1F;
      padding-top: .9rem;
      padding-bottom: .9rem;
    }
    .navbar-dms .navbar-brand {
      font-family: 'Playfair Display', serif;
      font-weight: 700;
      font-size: 1.5rem;
      color: var(--gold);
      letter-spacing: .5px;
    }
    .navbar-dms .navbar-brand span { color: #fff; }
    .navbar-dms .nav-link {
      color: rgba(255,255,255,.85);
      font-weight: 600;
      font-size: .78rem;
      letter-spacing: 1px;
      text-transform: uppercase;
      padding: .5rem 1rem !important;
    }
    .navbar-dms .nav-link:hover,
    .navbar-dms .nav-link:focus,
    .navbar-dms .nav-link.active { color: var(--gold); }
    .navbar-dms .dropdown-menu {
      border-top: 3px solid var(--gold);
    }
    .navbar-dms .dropdown-item.active,
    .navbar-dms .dropdown-item:active { background-color: var(--gold); color: var(--navy); }
    .badge-nav { background-color: var(--gold); color: var(--navy); }
    .nav-pill-btn {
      background: var(--gold);
      color: var(--navy) !important;
      font-weight: 700;
      font-size: .78rem;
      letter-spacing: 1px;
      text-transform: uppercase;
      border-radius: 50px;
      padding: .55rem 1.4rem !important;
      display: inline-flex;
      align-items: center;
      gap: .4rem;
      border: none;
    }
    .nav-pill-btn:hover { background: var(--gold-lt); color: var(--navy) !important; }

    /* ─── HERO BANNER ─── */
    .hero {
      position: relative;
      min-height: 420px;
      display: flex;
      align-items: center;
      overflow: hidden;
      background: var(--navy);
    }
    .hero-img {
      position: absolute; inset: 0;
      width: 100%; height: 100%;
      object-fit: cover;
      opacity: .22;
    }
    .hero-overlay {
      position: absolute; inset: 0;
      background: linear-gradient(135deg, rgba(11,29,58,.92) 40%, rgba(11,29,58,.55));
    }
    .hero-content { position: relative; z-index: 2; padding: 3rem 2rem; }

    .success-badge {
      display: inline-flex; align-items: center; gap: .5rem;
      background: rgba(201,168,76,.18);
      border: 1px solid var(--gold);
      color: var(--gold);
      border-radius: 50px;
      padding: .35rem 1rem;
      font-size: .82rem;
      font-weight: 600;
      letter-spacing: .5px;
      margin-bottom: 1.2rem;
      animation: fadeDown .6s ease both;
    }
    .hero h1 {
      font-family: 'Playfair Display', serif;
      font-size: clamp(2rem, 4vw, 3.2rem);
      color: #fff;
      line-height: 1.2;
      animation: fadeDown .7s .1s ease both;
    }
    .hero h1 span { color: var(--gold); }
    .hero p {
      color: rgba(255,255,255,.72);
      font-size: 1.05rem;
      max-width: 540px;
      margin-top: .8rem;
      line-height: 1.7;
      animation: fadeDown .7s .2s ease both;
    }
    .hero-stats {
      display: flex; gap: 2.5rem;
      margin-top: 2rem;
      animation: fadeDown .7s .3s ease both;
    }
    .stat-item { text-align: center; }
    .stat-num {
      font-family: 'Playfair Display', serif;
      font-size: 2rem;
      color: var(--gold);
      font-weight: 900;
      line-height: 1;
    }
    .stat-lbl {
      font-size: .78rem;
      color: rgba(255,255,255,.6);
      text-transform: uppercase;
      letter-spacing: .8px;
    }

    /* ─── QUICK-ACTION CARDS ─── */
    .section-title {
      font-family: 'Playfair Display', serif;
      font-size: 1.6rem;
      color: var(--navy);
      border-left: 4px solid var(--gold);
      padding-left: .85rem;
    }
    .section-subtitle { color: var(--slate); font-size: .9rem; margin-top: .25rem; }

    .action-card {
      background: #fff;
      border: 1px solid #e8e2d6;
      border-radius: 14px;
      padding: 1.8rem 1.5rem;
      height: 100%;
      transition: transform .25s, box-shadow .25s, border-color .25s;
      position: relative;
      overflow: hidden;
    }
    .action-card::before {
      content: '';
      position: absolute;
      top: 0; left: 0; right: 0;
      height: 4px;
      background: var(--gold);
      transform: scaleX(0);
      transition: transform .3s;
      transform-origin: left;
    }
    .action-card:hover { transform: translateY(-5px); box-shadow: 0 16px 40px rgba(11,29,58,.12); border-color: var(--gold); }
    .action-card:hover::before { transform: scaleX(1); }

    .card-icon {
      width: 54px; height: 54px;
      border-radius: 14px;
      background: linear-gradient(135deg, var(--navy), #1a3566);
      display: flex; align-items: center; justify-content: center;
      font-size: 1.4rem;
      color: var(--gold);
      margin-bottom: 1rem;
      box-shadow: 0 4px 12px rgba(11,29,58,.2);
    }
    .action-card h5 {
      font-weight: 700;
      font-size: 1rem;
      color: var(--navy);
      margin-bottom: .4rem;
    }
    .action-card p { color: var(--slate); font-size: .85rem; line-height: 1.55; margin-bottom: 1.2rem; }
    .card-link {
      color: var(--gold);
      font-weight: 600;
      font-size: .84rem;
      text-decoration: none;
      display: flex; align-items: center; gap: .3rem;
    }
    .card-link:hover { color: var(--navy); }

    /* ─── EVENT TABLE ─── */
    .data-panel {
      background: #fff;
      border: 1px solid #e8e2d6;
      border-radius: 14px;
      overflow: hidden;
    }
    .data-panel-header {
      background: var(--navy);
      color: #fff;
      padding: 1rem 1.5rem;
      display: flex; align-items: center; justify-content: space-between;
    }
    .data-panel-header h6 {
      font-family: 'Playfair Display', serif;
      font-size: 1rem;
      margin: 0;
    }
    .table { margin: 0; }
    .table thead th {
      background: #f5f2ea;
      color: var(--navy);
      font-weight: 600;
      font-size: .8rem;
      text-transform: uppercase;
      letter-spacing: .5px;
      border-bottom: 2px solid #e0d9c8;
      padding: .75rem 1rem;
    }
    .table td {
      font-size: .87rem;
      color: var(--slate);
      padding: .8rem 1rem;
      vertical-align: middle;
      border-color: #f0ebe0;
    }
    .table tbody tr:hover { background: #fdf9f2; }

    .status-pill {
      border-radius: 50px;
      padding: 3px 12px;
      font-size: .76rem;
      font-weight: 600;
    }
    .pill-active   { background: #d4edda; color: #155724; }
    .pill-pending  { background: #fff3cd; color: #856404; }
    .pill-closed   { background: #f8d7da; color: #721c24; }

    /* ─── ALERT ─── */
    .alert-dms {
      background: linear-gradient(135deg, #fffbef, #fff8e1);
      border: 1px solid var(--gold);
      border-left: 5px solid var(--gold);
      border-radius: 10px;
      padding: 1rem 1.4rem;
    }

    /* ─── FOOTER ─── */
    footer {
      background: var(--navy);
      border-top: 3px solid var(--gold);
      color: rgba(255,255,255,.55);
      font-size: .82rem;
      padding: 1.2rem 2rem;
    }
    footer a { color: var(--gold); text-decoration: none; }

    @keyframes fadeDown {
      from { opacity: 0; transform: translateY(-18px); }
      to   { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>

<!-- ═══════════════════════════════ NAVBAR (plain Bootstrap navbar) ═══════════════════════════════ -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-dms sticky-top">
  <div class="container-fluid">

    <a class="navbar-brand" href="#">
      <i class="bi bi-diagram-3-fill me-1"></i>
      DMS <span>Pro</span>
    </a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navMain">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navMain">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">

        <li class="nav-item">
          <a class="nav-link active" href="#"><i class="bi bi-house-door me-1"></i>Home</a>
        </li>

        <!-- HOST DASHBOARD DROPDOWN -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-building me-1"></i>Host Dashboard
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-speedometer2 me-2"></i>Overview</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-calendar-event me-2"></i>My Events</a></li>
            <li><a class="dropdown-item d-flex align-items-center" href="#"><i class="bi bi-people-fill me-2"></i>Manage Delegates <span class="badge badge-nav rounded-pill ms-auto">24</span></a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-send-check me-2"></i>Send Invitations</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-clipboard2-check me-2"></i>Attendance Tracker</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-bar-chart-line me-2"></i>Event Reports</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-chat-square-dots me-2"></i>Feedback & Reviews</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2"></i>Host Settings</a></li>
          </ul>
        </li>

        <!-- ADMIN DASHBOARD DROPDOWN -->
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-shield-lock me-1"></i>Admin Dashboard
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-grid-3x3-gap me-2"></i>Control Panel</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-person-lines-fill me-2"></i>All Users</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-diagram-3 me-2"></i>All Delegates</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-calendar2-range me-2"></i>All Events</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item d-flex align-items-center" href="#"><i class="bi bi-shield-check me-2"></i>Approvals <span class="badge badge-nav rounded-pill ms-auto">7</span></a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-lock-fill me-2"></i>Roles & Permissions</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-bell-fill me-2"></i>Notifications</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-file-earmark-bar-graph me-2"></i>System Reports</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-activity me-2"></i>Audit Logs</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-sliders me-2"></i>System Settings</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            <i class="bi bi-calendar3 me-1"></i>Events
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-plus-circle me-2"></i>Create Event</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-search me-2"></i>Browse Events</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-bookmark-star me-2"></i>My Registrations</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
            <i class="bi bi-person-badge me-1"></i>Delegates
          </a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#"><i class="bi bi-person-plus me-2"></i>Register Delegate</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-card-list me-2"></i>Delegate Directory</a></li>
            <li><a class="dropdown-item" href="#"><i class="bi bi-award me-2"></i>Accreditation</a></li>
          </ul>
        </li>

      </ul>

      <!-- RIGHT SIDE (no account button) -->
      <ul class="navbar-nav align-items-center">
        <li class="nav-item">
          <a class="nav-pill-btn position-relative" href="#">
            <i class="bi bi-bell-fill"></i> Notifications
            <span class="badge rounded-pill bg-danger ms-1" style="font-size:.62rem">3</span>
          </a>
        </li>
      </ul>
    </div>
  </div>
</nav>

<!-- ═══════════════════════════════ HERO ═══════════════════════════════ -->
<section class="hero">
  <img class="hero-img"
    src="https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=1400&q=80"
    alt="Conference hall">
  <div class="hero-overlay"></div>
  <div class="hero-content container">
    <div class="row align-items-center">
      <div class="col-lg-7">
        <div class="success-badge">
          <i class="bi bi-check-circle-fill"></i> Login Successful
        </div>
        <h1>Welcome Back,<br><span>John Doe</span></h1>
        <p>You are now securely logged in to the <strong style="color:#fff">Delegate Management System</strong>. Manage events, track delegates, send invitations, and generate reports — all from one place.</p>
        <div class="hero-stats">
          <div class="stat-item">
            <div class="stat-num">142</div>
            <div class="stat-lbl">Delegates</div>
          </div>
          <div class="stat-item">
            <div class="stat-num">18</div>
            <div class="stat-lbl">Active Events</div>
          </div>
          <div class="stat-item">
            <div class="stat-num">7</div>
            <div class="stat-lbl">Pending Approvals</div>
          </div>
          <div class="stat-item">
            <div class="stat-num">94%</div>
            <div class="stat-lbl">Attendance Rate</div>
          </div>
        </div>
      </div>
      <div class="col-lg-5 d-none d-lg-block text-center">
        <img src="https://images.unsplash.com/photo-1551818255-e6e10975bc17?w=600&q=80"
          alt="Delegates networking"
          style="width:100%;max-width:400px;border-radius:16px;border:3px solid rgba(201,168,76,.4);box-shadow:0 20px 60px rgba(0,0,0,.5);">
      </div>
    </div>
  </div>
</section>

<!-- ═══════════════════════════════ MAIN CONTENT ═══════════════════════════════ -->
<main class="container py-5">

  <!-- Alert -->
  <div class="alert-dms mb-4 d-flex align-items-center gap-3">
    <i class="bi bi-info-circle-fill fs-4" style="color:var(--gold)"></i>
    <div>
      <strong>Upcoming:</strong> "International Trade Summit 2026" is scheduled for <strong>May 20, 2026</strong>.
      <a href="#" style="color:var(--gold);font-weight:600;text-decoration:none">View Details →</a>
    </div>
  </div>

  <!-- Quick Actions -->
  <div class="mb-2">
    <div class="section-title">Quick Actions</div>
    <div class="section-subtitle">Frequently used features for efficient delegation management</div>
  </div>

  <div class="row g-4 mt-1 mb-5">
    <div class="col-md-6 col-lg-3">
      <div class="action-card">
        <div class="card-icon"><i class="bi bi-person-plus-fill"></i></div>
        <h5>Register Delegate</h5>
        <p>Add new delegates to the system and assign them to specific events or sessions.</p>
        <a href="#" class="card-link">Get Started <i class="bi bi-arrow-right"></i></a>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="action-card">
        <div class="card-icon"><i class="bi bi-calendar-plus-fill"></i></div>
        <h5>Create Event</h5>
        <p>Plan and launch a new conference, workshop, or summit with full delegate control.</p>
        <a href="#" class="card-link">Create Now <i class="bi bi-arrow-right"></i></a>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="action-card">
        <div class="card-icon"><i class="bi bi-envelope-paper-fill"></i></div>
        <h5>Send Invitations</h5>
        <p>Bulk-send personalized invitations via email to registered delegates or external guests.</p>
        <a href="#" class="card-link">Send Now <i class="bi bi-arrow-right"></i></a>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="action-card">
        <div class="card-icon"><i class="bi bi-file-earmark-bar-graph-fill"></i></div>
        <h5>Generate Report</h5>
        <p>Export attendance, accreditation, and participation reports in PDF or Excel format.</p>
        <a href="#" class="card-link">Generate <i class="bi bi-arrow-right"></i></a>
      </div>
    </div>
  </div>

  <!-- Tables + Image Row -->
  <div class="row g-4 mb-5">
    <!-- Event Table -->
    <div class="col-lg-8">
      <div class="data-panel">
        <div class="data-panel-header">
          <h6><i class="bi bi-calendar-event me-2" style="color:var(--gold)"></i>Upcoming Events</h6>
          <a href="#" class="btn btn-sm" style="background:var(--gold);color:var(--navy);font-weight:600;font-size:.78rem;border-radius:50px">View All</a>
        </div>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>#</th>
              <th>Event Name</th>
              <th>Date</th>
              <th>Delegates</th>
              <th>Status</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>01</td>
              <td><strong style="color:var(--navy)">International Trade Summit</strong></td>
              <td>20 May 2026</td>
              <td><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>48</td>
              <td><span class="status-pill pill-active">Active</span></td>
            </tr>
            <tr>
              <td>02</td>
              <td><strong style="color:var(--navy)">Climate Policy Forum</strong></td>
              <td>02 Jun 2026</td>
              <td><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>31</td>
              <td><span class="status-pill pill-pending">Pending</span></td>
            </tr>
            <tr>
              <td>03</td>
              <td><strong style="color:var(--navy)">Tech Diplomacy Conference</strong></td>
              <td>15 Jun 2026</td>
              <td><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>62</td>
              <td><span class="status-pill pill-active">Active</span></td>
            </tr>
            <tr>
              <td>04</td>
              <td><strong style="color:var(--navy)">South Asia Leadership Meet</strong></td>
              <td>28 Apr 2026</td>
              <td><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>19</td>
              <td><span class="status-pill pill-closed">Closed</span></td>
            </tr>
            <tr>
              <td>05</td>
              <td><strong style="color:var(--navy)">Digital Governance Workshop</strong></td>
              <td>10 Jul 2026</td>
              <td><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>27</td>
              <td><span class="status-pill pill-pending">Pending</span></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Side Panel -->
    <div class="col-lg-4">
      <div class="data-panel h-100">
        <div class="data-panel-header">
          <h6><i class="bi bi-clock-history me-2" style="color:var(--gold)"></i>Recent Activity</h6>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item d-flex gap-3 py-3" style="border-color:#f0ebe0">
            <div style="width:36px;height:36px;border-radius:50%;background:#e8f4fd;display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#0b69b0"><i class="bi bi-person-check-fill"></i></div>
            <div><div style="font-size:.85rem;color:var(--navy);font-weight:600">Delegate Approved</div><div style="font-size:.78rem;color:var(--slate)">Anita Sharma – Trade Summit</div><div style="font-size:.73rem;color:#aaa">2 min ago</div></div>
          </li>
          <li class="list-group-item d-flex gap-3 py-3" style="border-color:#f0ebe0">
            <div style="width:36px;height:36px;border-radius:50%;background:#fff3cd;display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#856404"><i class="bi bi-envelope-open-fill"></i></div>
            <div><div style="font-size:.85rem;color:var(--navy);font-weight:600">Invitation Sent</div><div style="font-size:.78rem;color:var(--slate)">48 invites – Climate Forum</div><div style="font-size:.73rem;color:#aaa">18 min ago</div></div>
          </li>
          <li class="list-group-item d-flex gap-3 py-3" style="border-color:#f0ebe0">
            <div style="width:36px;height:36px;border-radius:50%;background:#d4edda;display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#155724"><i class="bi bi-calendar-check-fill"></i></div>
            <div><div style="font-size:.85rem;color:var(--navy);font-weight:600">Event Created</div><div style="font-size:.78rem;color:var(--slate)">Digital Governance Workshop</div><div style="font-size:.73rem;color:#aaa">1 hr ago</div></div>
          </li>
          <li class="list-group-item d-flex gap-3 py-3" style="border-color:#f0ebe0">
            <div style="width:36px;height:36px;border-radius:50%;background:#f8d7da;display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#721c24"><i class="bi bi-x-circle-fill"></i></div>
            <div><div style="font-size:.85rem;color:var(--navy);font-weight:600">Accreditation Rejected</div><div style="font-size:.78rem;color:var(--slate)">Rahul Mehta – Tech Conf.</div><div style="font-size:.73rem;color:#aaa">3 hr ago</div></div>
          </li>
          <li class="list-group-item d-flex gap-3 py-3" style="border-color:#f0ebe0">
            <div style="width:36px;height:36px;border-radius:50%;background:#e2d9f3;display:flex;align-items:center;justify-content:center;flex-shrink:0;color:#5a2d9c"><i class="bi bi-file-earmark-pdf-fill"></i></div>
            <div><div style="font-size:.85rem;color:var(--navy);font-weight:600">Report Exported</div><div style="font-size:.78rem;color:var(--slate)">South Asia Meet – PDF</div><div style="font-size:.73rem;color:#aaa">Yesterday</div></div>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <!-- Image Banner Row -->
  <div class="row g-4 mb-5">
    <div class="col-md-4">
      <div style="position:relative;border-radius:14px;overflow:hidden;height:200px;">
        <img src="https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?w=600&q=80"
          alt="Delegates at conference" style="width:100%;height:100%;object-fit:cover;">
        <div style="position:absolute;inset:0;background:linear-gradient(to top,rgba(11,29,58,.75),transparent);display:flex;align-items:flex-end;padding:1rem 1.2rem;">
          <div style="color:#fff;font-weight:600;font-size:.95rem"><i class="bi bi-people-fill me-1" style="color:var(--gold)"></i>Global Delegates Network</div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div style="position:relative;border-radius:14px;overflow:hidden;height:200px;">
        <img src="https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=600&q=80"
          alt="Conference panel" style="width:100%;height:100%;object-fit:cover;">
        <div style="position:absolute;inset:0;background:linear-gradient(to top,rgba(11,29,58,.75),transparent);display:flex;align-items:flex-end;padding:1rem 1.2rem;">
          <div style="color:#fff;font-weight:600;font-size:.95rem"><i class="bi bi-mic-fill me-1" style="color:var(--gold)"></i>Panel Discussions & Forums</div>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div style="position:relative;border-radius:14px;overflow:hidden;height:200px;">
        <img src="https://images.unsplash.com/photo-1461896836934-ffe607ba8211?w=600&q=80"
          alt="Accreditation" style="width:100%;height:100%;object-fit:cover;">
        <div style="position:absolute;inset:0;background:linear-gradient(to top,rgba(11,29,58,.75),transparent);display:flex;align-items:flex-end;padding:1rem 1.2rem;">
          <div style="color:#fff;font-weight:600;font-size:.95rem"><i class="bi bi-award-fill me-1" style="color:var(--gold)"></i>Accreditation & Badges</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Delegate Table -->
  <div class="mb-2">
    <div class="section-title">Recent Delegates</div>
    <div class="section-subtitle">Latest registrations awaiting review or confirmation</div>
  </div>
  <div class="data-panel mt-3">
    <table class="table table-hover">
      <thead>
        <tr>
          <th>Delegate Name</th>
          <th>Organization</th>
          <th>Country</th>
          <th>Event</th>
          <th>Accreditation</th>
          <th>Action</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><i class="bi bi-person-circle me-1 text-muted"></i><strong>Anita Sharma</strong></td>
          <td>Ministry of Trade</td>
          <td>India</td>
          <td>Trade Summit</td>
          <td><span class="status-pill pill-active">Approved</span></td>
          <td><a href="#" class="btn btn-sm" style="font-size:.75rem;color:var(--gold);border:1px solid var(--gold);border-radius:50px;padding:2px 10px">View</a></td>
        </tr>
        <tr>
          <td><i class="bi bi-person-circle me-1 text-muted"></i><strong>David Lee</strong></td>
          <td>UN Environment Program</td>
          <td>USA</td>
          <td>Climate Forum</td>
          <td><span class="status-pill pill-pending">Pending</span></td>
          <td><a href="#" class="btn btn-sm" style="font-size:.75rem;color:var(--gold);border:1px solid var(--gold);border-radius:50px;padding:2px 10px">View</a></td>
        </tr>
        <tr>
          <td><i class="bi bi-person-circle me-1 text-muted"></i><strong>Marie Dupont</strong></td>
          <td>EU Digital Agency</td>
          <td>France</td>
          <td>Tech Diplomacy Conf.</td>
          <td><span class="status-pill pill-active">Approved</span></td>
          <td><a href="#" class="btn btn-sm" style="font-size:.75rem;color:var(--gold);border:1px solid var(--gold);border-radius:50px;padding:2px 10px">View</a></td>
        </tr>
        <tr>
          <td><i class="bi bi-person-circle me-1 text-muted"></i><strong>Rahul Mehta</strong></td>
          <td>TechGov Pvt. Ltd.</td>
          <td>India</td>
          <td>Tech Diplomacy Conf.</td>
          <td><span class="status-pill pill-closed">Rejected</span></td>
          <td><a href="#" class="btn btn-sm" style="font-size:.75rem;color:var(--gold);border:1px solid var(--gold);border-radius:50px;padding:2px 10px">View</a></td>
        </tr>
        <tr>
          <td><i class="bi bi-person-circle me-1 text-muted"></i><strong>Aiko Tanaka</strong></td>
          <td>Japan Trade Org.</td>
          <td>Japan</td>
          <td>Trade Summit</td>
          <td><span class="status-pill pill-pending">Pending</span></td>
          <td><a href="#" class="btn btn-sm" style="font-size:.75rem;color:var(--gold);border:1px solid var(--gold);border-radius:50px;padding:2px 10px">View</a></td>
        </tr>
      </tbody>
    </table>
  </div>

</main>

<!-- ═══════════════════════════════ FOOTER ═══════════════════════════════ -->
<footer class="d-flex flex-wrap justify-content-between align-items-center">
  <span>© 2026 <strong style="color:var(--gold)">DMS Pro</strong> – Delegate Management System. All rights reserved.</span>
  <span class="d-flex gap-3">
    <a href="#">Privacy Policy</a>
    <a href="#">Support</a>
    <a href="#">Contact Admin</a>
  </span>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>