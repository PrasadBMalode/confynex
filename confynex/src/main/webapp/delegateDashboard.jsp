<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Delegate Portal</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet" />
  <style>
    :root {
      --brand-primary: #1a3a5c;
      --brand-accent: #2e7dbe;
      --brand-light: #e8f1f8;
      --sidebar-width: 240px;
    }

    body {
      background-color: #f0f4f8;
      font-family: 'Segoe UI', sans-serif;
    }

    /* ── NAVBAR ── */
    .top-navbar {
      background-color: var(--brand-primary);
      height: 60px;
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 1030;
    }
    .top-navbar .navbar-brand {
      color: #ffffff;
      font-weight: 700;
      font-size: 1.1rem;
      letter-spacing: .03em;
    }
    .top-navbar .navbar-brand span {
      color: #5bb3f0;
    }
    .top-navbar .nav-link {
      color: rgba(255,255,255,.75);
      font-size: .875rem;
      padding: .4rem .8rem;
      transition: color .15s;
    }
    .top-navbar .nav-link:hover,
    .top-navbar .nav-link.active {
      color: #ffffff;
    }
    .top-navbar .badge-notif {
      font-size: .65rem;
      vertical-align: top;
      margin-top: -2px;
    }

    /* ── SIDEBAR ── */
    .sidebar {
      position: fixed;
      top: 60px;
      left: 0;
      bottom: 0;
      width: var(--sidebar-width);
      background: #ffffff;
      border-right: 1px solid #dde3ea;
      overflow-y: auto;
      z-index: 1020;
      padding-top: 1rem;
    }
    .sidebar .nav-link {
      color: #4a5568;
      padding: .55rem 1.25rem;
      font-size: .875rem;
      border-left: 3px solid transparent;
      display: flex;
      align-items: center;
      gap: .65rem;
      transition: all .15s;
    }
    .sidebar .nav-link:hover {
      background: var(--brand-light);
      color: var(--brand-accent);
      border-left-color: var(--brand-accent);
    }
    .sidebar .nav-link.active {
      background: var(--brand-light);
      color: var(--brand-accent);
      border-left-color: var(--brand-accent);
      font-weight: 600;
    }
    .sidebar .section-label {
      text-transform: uppercase;
      font-size: .7rem;
      letter-spacing: .08em;
      color: #9aa5b4;
      padding: 1.2rem 1.25rem .4rem;
      font-weight: 600;
    }

    /* ── MAIN CONTENT ── */
    .main-content {
      margin-left: var(--sidebar-width);
      margin-top: 60px;
      padding: 1.75rem;
      min-height: calc(100vh - 60px);
    }

    /* ── STAT CARDS ── */
    .stat-card {
      background: #ffffff;
      border: 1px solid #dde3ea;
      border-radius: 10px;
      padding: 1.25rem 1.5rem;
      display: flex;
      align-items: center;
      gap: 1rem;
    }
    .stat-icon {
      width: 48px;
      height: 48px;
      border-radius: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.4rem;
      flex-shrink: 0;
    }
    .stat-card h6 {
      font-size: .75rem;
      text-transform: uppercase;
      letter-spacing: .06em;
      color: #718096;
      margin-bottom: .2rem;
    }
    .stat-card .stat-value {
      font-size: 1.6rem;
      font-weight: 700;
      color: var(--brand-primary);
      line-height: 1;
    }

    /* ── CARDS ── */
    .section-card {
      background: #ffffff;
      border: 1px solid #dde3ea;
      border-radius: 10px;
      overflow: hidden;
    }
    .section-card .card-header-custom {
      padding: .9rem 1.25rem;
      border-bottom: 1px solid #dde3ea;
      font-weight: 600;
      font-size: .9rem;
      color: var(--brand-primary);
      background: #fff;
      display: flex;
      align-items: center;
      justify-content: space-between;
    }

    /* ── STATUS BADGES ── */
    .badge-approved  { background: #d1fae5; color: #065f46; }
    .badge-pending   { background: #fef3c7; color: #92400e; }
    .badge-rejected  { background: #fee2e2; color: #991b1b; }
    .badge-status {
      font-size: .72rem;
      font-weight: 600;
      padding: .3em .7em;
      border-radius: 20px;
    }

    /* ── TABLE ── */
    .table thead th {
      font-size: .75rem;
      text-transform: uppercase;
      letter-spacing: .05em;
      color: #718096;
      background: #f7f9fb;
      border-bottom: 1px solid #dde3ea;
      font-weight: 600;
    }
    .table tbody tr:hover { background: #f7f9fb; }
    .table td { font-size: .875rem; vertical-align: middle; }

    /* ── PROFILE AVATAR ── */
    .avatar-sm {
      width: 32px;
      height: 32px;
      border-radius: 50%;
      background: var(--brand-accent);
      color: #fff;
      font-size: .8rem;
      font-weight: 700;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      flex-shrink: 0;
    }

    /* ── TIMELINE ── */
    .timeline-item {
      display: flex;
      gap: .9rem;
      padding-bottom: 1rem;
    }
    .timeline-dot {
      width: 10px;
      height: 10px;
      border-radius: 50%;
      margin-top: 5px;
      flex-shrink: 0;
    }
    .timeline-text { font-size: .85rem; color: #4a5568; }
    .timeline-time { font-size: .75rem; color: #9aa5b4; }
  </style>
</head>
<body>

<!-- ───────────────── TOP NAVBAR ───────────────── -->
<nav class="navbar top-navbar px-3">
  <a class="navbar-brand d-flex align-items-center gap-2" href="#">
    <i class="bi bi-shield-check fs-5"></i>
    Delegate<span>Portal</span>
  </a>

  <ul class="navbar-nav flex-row d-none d-md-flex align-items-center gap-1 me-auto ms-4">
    <li class="nav-item"><a class="nav-link active" href="#">Dashboard</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Sessions</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Documents</a></li>
    <li class="nav-item"><a class="nav-link" href="#">Reports</a></li>
  </ul>

  <div class="d-flex align-items-center gap-3 ms-auto">
    <a href="#" class="text-white-50 position-relative" title="Notifications">
      <i class="bi bi-bell fs-5"></i>
      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger badge-notif">3</span>
    </a>
    <div class="dropdown">
      <button class="btn btn-sm btn-outline-light d-flex align-items-center gap-2" data-bs-toggle="dropdown">
        <div class="avatar-sm" style="width:28px;height:28px;font-size:.7rem;">AK</div>
        <span class="d-none d-md-inline" style="font-size:.85rem;">Anil Kumar</span>
        <i class="bi bi-chevron-down" style="font-size:.7rem;"></i>
      </button>
      <ul class="dropdown-menu dropdown-menu-end shadow-sm border-0" style="font-size:.875rem;">
        <li><a class="dropdown-item" href="#"><i class="bi bi-person me-2 text-muted"></i>My Profile</a></li>
        <li><a class="dropdown-item" href="#"><i class="bi bi-gear me-2 text-muted"></i>Settings</a></li>
        <li><hr class="dropdown-divider"></li>
        <li><a class="dropdown-item text-danger" href="#"><i class="bi bi-box-arrow-right me-2"></i>Sign Out</a></li>
      </ul>
    </div>
  </div>
</nav>

<!-- ───────────────── SIDEBAR ───────────────── -->
<aside class="sidebar">
  <p class="section-label">Main</p>
  <nav class="nav flex-column">
    <a href="#" class="nav-link active"><i class="bi bi-speedometer2"></i>Dashboard</a>
    <a href="#" class="nav-link"><i class="bi bi-calendar3"></i>Sessions</a>
    <a href="#" class="nav-link"><i class="bi bi-file-earmark-text"></i>Proposals</a>
    <a href="#" class="nav-link"><i class="bi bi-chat-square-dots"></i>Messages <span class="badge bg-primary ms-auto rounded-pill" style="font-size:.65rem;">5</span></a>
  </nav>
  <p class="section-label">Management</p>
  <nav class="nav flex-column">
    <a href="#" class="nav-link"><i class="bi bi-people"></i>Delegates</a>
    <a href="#" class="nav-link"><i class="bi bi-clipboard-data"></i>Reports</a>
    <a href="#" class="nav-link"><i class="bi bi-folder2-open"></i>Documents</a>
  </nav>
  <p class="section-label">Account</p>
  <nav class="nav flex-column">
    <a href="#" class="nav-link"><i class="bi bi-person-circle"></i>Profile</a>
    <a href="#" class="nav-link"><i class="bi bi-gear"></i>Settings</a>
    <a href="#" class="nav-link text-danger"><i class="bi bi-box-arrow-right"></i>Sign Out</a>
  </nav>
</aside>

<!-- ───────────────── MAIN CONTENT ───────────────── -->
<main class="main-content">

  <!-- Page Header -->
  <div class="d-flex align-items-center justify-content-between mb-4">
    <div>
      <h5 class="mb-0 fw-bold" style="color:var(--brand-primary);">Dashboard Overview</h5>
      <small class="text-muted">Welcome back, Anil Kumar — Wednesday, 18 June 2026</small>
    </div>
    <button class="btn btn-sm btn-primary d-flex align-items-center gap-2" style="background:var(--brand-accent);border:none;">
      <i class="bi bi-plus-lg"></i> New Proposal
    </button>
  </div>

  <!-- Stat Cards -->
  <div class="row g-3 mb-4">
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card">
        <div class="stat-icon" style="background:#dbeafe;color:#1d4ed8;"><i class="bi bi-calendar-check"></i></div>
        <div>
          <h6>Sessions</h6>
          <div class="stat-value">12</div>
          <small class="text-muted" style="font-size:.75rem;">3 upcoming</small>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card">
        <div class="stat-icon" style="background:#d1fae5;color:#065f46;"><i class="bi bi-file-earmark-check"></i></div>
        <div>
          <h6>Proposals</h6>
          <div class="stat-value">7</div>
          <small class="text-muted" style="font-size:.75rem;">2 pending review</small>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card">
        <div class="stat-icon" style="background:#fef3c7;color:#92400e;"><i class="bi bi-chat-dots"></i></div>
        <div>
          <h6>Messages</h6>
          <div class="stat-value">5</div>
          <small class="text-muted" style="font-size:.75rem;">Unread</small>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-xl-3">
      <div class="stat-card">
        <div class="stat-icon" style="background:#ede9fe;color:#5b21b6;"><i class="bi bi-people"></i></div>
        <div>
          <h6>Delegates</h6>
          <div class="stat-value">34</div>
          <small class="text-muted" style="font-size:.75rem;">Active members</small>
        </div>
      </div>
    </div>
  </div>

  <!-- Proposals Table + Activity -->
  <div class="row g-3">

    <!-- Proposals Table -->
    <div class="col-lg-8">
      <div class="section-card">
        <div class="card-header-custom">
          Recent Proposals
          <a href="#" class="btn btn-sm btn-outline-secondary" style="font-size:.75rem;">View All</a>
        </div>
        <div class="table-responsive">
          <table class="table mb-0">
          <h3>Coordinator Details</h3>

          <p>Name : ${coordinator.fullName}</p>
          <p>Email : ${coordinator.email}</p>
          <p>Phone : ${coordinator.phoneNumber}</p>
          <p>Designation : ${coordinator.designation}</p>

          <h3>Conference Host Details</h3>

          <p>Host Name : ${host.full_name}</p>
          <p>Company : ${host.company_name}</p>
          <p>Email : ${host.email}</p>

          <p>Conference : ${host.conference_title}</p>
          <p>Date : ${host.conference_date}</p>
          <p>Venue : ${host.venue}</p>
            <thead>
              <tr>
                <th>#</th>
                <th>Title</th>
                <th>Submitted By</th>
                <th>Date</th>
                <th>Status</th>
                <th></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="text-muted">P-041</td>
                <td>Budget Allocation — Q3</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="avatar-sm">SR</div> Sunita Rao
                  </div>
                </td>
                <td>14 Jun 2026</td>
                <td><span class="badge-status badge-approved">Approved</span></td>
                <td><a href="#" class="btn btn-sm btn-outline-primary" style="font-size:.75rem;">View</a></td>
              </tr>
              <tr>
                <td class="text-muted">P-042</td>
                <td>Infrastructure Upgrade Plan</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="avatar-sm" style="background:#7c3aed;">MK</div> Manoj Khanna
                  </div>
                </td>
                <td>15 Jun 2026</td>
                <td><span class="badge-status badge-pending">Pending</span></td>
                <td><a href="#" class="btn btn-sm btn-outline-primary" style="font-size:.75rem;">View</a></td>
              </tr>
              <tr>
                <td class="text-muted">P-043</td>
                <td>Training Programme Renewal</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="avatar-sm" style="background:#0891b2;">PN</div> Priya Nair
                  </div>
                </td>
                <td>16 Jun 2026</td>
                <td><span class="badge-status badge-approved">Approved</span></td>
                <td><a href="#" class="btn btn-sm btn-outline-primary" style="font-size:.75rem;">View</a></td>
              </tr>
              <tr>
                <td class="text-muted">P-044</td>
                <td>Outreach Initiative — South Zone</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="avatar-sm" style="background:#dc2626;">RV</div> Ravi Verma
                  </div>
                </td>
                <td>17 Jun 2026</td>
                <td><span class="badge-status badge-rejected">Rejected</span></td>
                <td><a href="#" class="btn btn-sm btn-outline-primary" style="font-size:.75rem;">View</a></td>
              </tr>
              <tr>
                <td class="text-muted">P-045</td>
                <td>Annual Review Proceedings</td>
                <td>
                  <div class="d-flex align-items-center gap-2">
                    <div class="avatar-sm">AK</div> Anil Kumar
                  </div>
                </td>
                <td>18 Jun 2026</td>
                <td><span class="badge-status badge-pending">Pending</span></td>
                <td><a href="#" class="btn btn-sm btn-outline-primary" style="font-size:.75rem;">View</a></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>

    <!-- Activity Feed -->
    <div class="col-lg-4">
      <div class="section-card h-100">
        <div class="card-header-custom">Recent Activity</div>
        <div class="p-3">
          <div class="timeline-item">
            <div class="timeline-dot" style="background:#2e7dbe;"></div>
            <div>
              <div class="timeline-text">Proposal <strong>P-043</strong> approved by admin.</div>
              <div class="timeline-time">Today, 10:32 AM</div>
            </div>
          </div>
          <div class="timeline-item">
            <div class="timeline-dot" style="background:#dc2626;"></div>
            <div>
              <div class="timeline-text">Proposal <strong>P-044</strong> was rejected.</div>
              <div class="timeline-time">Today, 9:15 AM</div>
            </div>
          </div>
          <div class="timeline-item">
            <div class="timeline-dot" style="background:#d97706;"></div>
            <div>
              <div class="timeline-text">Session <strong>S-12</strong> rescheduled to 20 Jun.</div>
              <div class="timeline-time">Yesterday, 4:50 PM</div>
            </div>
          </div>
          <div class="timeline-item">
            <div class="timeline-dot" style="background:#059669;"></div>
            <div>
              <div class="timeline-text">New delegate <strong>Priya Nair</strong> onboarded.</div>
              <div class="timeline-time">Yesterday, 2:10 PM</div>
            </div>
          </div>
          <div class="timeline-item">
            <div class="timeline-dot" style="background:#7c3aed;"></div>
            <div>
              <div class="timeline-text">Document <strong>MoM-June.pdf</strong> uploaded.</div>
              <div class="timeline-time">16 Jun, 11:00 AM</div>
            </div>
          </div>
          <div class="timeline-item pb-0">
            <div class="timeline-dot" style="background:#2e7dbe;"></div>
            <div>
              <div class="timeline-text">You submitted proposal <strong>P-042</strong>.</div>
              <div class="timeline-time">15 Jun, 3:45 PM</div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div><!-- /row -->

  <!-- Upcoming Sessions -->
  <div class="row g-3 mt-1">
    <div class="col-12">
      <div class="section-card">
        <div class="card-header-custom">
          Upcoming Sessions
          <a href="#" class="btn btn-sm btn-outline-secondary" style="font-size:.75rem;">Full Calendar</a>
        </div>
        <div class="table-responsive">
          <table class="table mb-0">
            <thead>
              <tr>
                <th>Session</th>
                <th>Topic</th>
                <th>Date & Time</th>
                <th>Venue</th>
                <th>Chair</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td class="fw-semibold" style="color:var(--brand-primary);">S-13</td>
                <td>Annual Budget Review</td>
                <td>20 Jun 2026 &nbsp;·&nbsp; 10:00 AM</td>
                <td>Conference Hall A</td>
                <td>Dr. Meera Iyer</td>
                <td><span class="badge-status badge-approved">Confirmed</span></td>
              </tr>
              <tr>
                <td class="fw-semibold" style="color:var(--brand-primary);">S-14</td>
                <td>Infrastructure Policy Discussion</td>
                <td>24 Jun 2026 &nbsp;·&nbsp; 2:00 PM</td>
                <td>Board Room 2</td>
                <td>Rajan Pillai</td>
                <td><span class="badge-status badge-pending">Tentative</span></td>
              </tr>
              <tr>
                <td class="fw-semibold" style="color:var(--brand-primary);">S-15</td>
                <td>Delegate Onboarding — Batch 4</td>
                <td>28 Jun 2026 &nbsp;·&nbsp; 9:30 AM</td>
                <td>Training Room 1</td>
                <td>Anil Kumar</td>
                <td><span class="badge-status badge-approved">Confirmed</span></td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>