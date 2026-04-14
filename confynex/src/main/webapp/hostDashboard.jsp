
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
  body { background: #f4f6fb; font-family: var(--font-sans, sans-serif); }
  .sidebar { min-height: 100vh; background: #fff; border-right: 0.5px solid #e3e6ef; width: 220px; position: fixed; top: 0; left: 0; z-index: 100; }
  .main-content { margin-left: 220px; }
  .nav-link-s { color: #666; border-radius: 8px; margin-bottom: 2px; font-size: 14px; padding: 8px 10px; display: flex; align-items: center; gap: 8px; text-decoration: none; transition: background 0.15s; }
  .nav-link-s.active { background: #e8f0fe; color: #1a56db; font-weight: 500; }
  .nav-link-s:hover:not(.active) { background: #f4f6fb; color: #111; }
  .badge-registered { background: #eaf3de; color: #3b6d11; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-pending { background: #faeeda; color: #854f0b; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-cancelled { background: #fcebeb; color: #a32d2d; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-vip { background: #eeedfe; color: #534ab7; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .avatar { width: 34px; height: 34px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: 500; flex-shrink: 0; }
  .av-blue { background: #dbeafe; color: #1e40af; }
  .av-teal { background: #ccfbf1; color: #0f6e56; }
  .av-coral { background: #ffe4e6; color: #9f1239; }
  .av-pink { background: #fce7f3; color: #9d174d; }
  .av-amber { background: #fef3c7; color: #92400e; }
  .av-purple { background: #ede9fe; color: #5b21b6; }
  .av-green { background: #dcfce7; color: #166534; }
  .av-indigo { background: #e0e7ff; color: #3730a3; }
  .stat-card { background: #fff; border-radius: 12px; padding: 1.1rem 1.2rem; border: 0.5px solid #e3e6ef; }
  .stat-label { font-size: 12px; color: #888; margin-bottom: 4px; }
  .stat-value { font-size: 26px; font-weight: 500; }
  .topbar { background: #fff; border-bottom: 0.5px solid #e3e6ef; padding: 14px 28px; display: flex; align-items: center; justify-content: space-between; }
  .table thead th { font-size: 11px; font-weight: 500; color: #888; text-transform: uppercase; letter-spacing: 0.06em; border-bottom: 0.5px solid #e3e6ef; background: #f9fafb; padding: 10px 14px; }
  .table tbody td { font-size: 14px; color: #222; vertical-align: middle; border-bottom: 0.5px solid #f0f0f0; padding: 11px 14px; }
  .table tbody tr:last-child td { border-bottom: none; }
  .table tbody tr:hover { background: #f4f6fb; }
  .card-table { background: #fff; border-radius: 14px; border: 0.5px solid #e3e6ef; overflow: hidden; }
  .search-input { border: 0.5px solid #d1d5db; border-radius: 8px; font-size: 13px; background: #f9fafb; color: #222; padding: 7px 12px; outline: none; }
  .search-input:focus { border-color: #3b82f6; background: #fff; box-shadow: 0 0 0 3px #dbeafe; }
  .filter-select { border: 0.5px solid #d1d5db; border-radius: 8px; font-size: 13px; background: #f9fafb; color: #222; padding: 7px 28px 7px 10px; outline: none; }
  .btn-add { background: #1a56db; color: #fff; border: none; border-radius: 8px; font-size: 13px; padding: 7px 16px; cursor: pointer; font-weight: 500; }
  .btn-add:hover { background: #1648c0; }
  .btn-export { background: #fff; border: 0.5px solid #d1d5db; border-radius: 8px; font-size: 13px; padding: 7px 14px; cursor: pointer; color: #444; }
  .btn-export:hover { background: #f4f6fb; }
  .btn-icon { background: none; border: 0.5px solid #e3e6ef; border-radius: 7px; padding: 4px 8px; cursor: pointer; font-size: 12px; color: #666; }
  .btn-icon:hover { background: #f4f6fb; }
  .logo-mark { width: 32px; height: 32px; border-radius: 9px; background: linear-gradient(135deg,#1a56db,#7c3aed); display: flex; align-items: center; justify-content: center; }
  .domain-badge { font-size: 10px; padding: 2px 7px; border-radius: 20px; font-weight: 500; }
  .domain-tech { background: #dbeafe; color: #1e40af; }
  .domain-biz { background: #fef3c7; color: #92400e; }
  .domain-health { background: #dcfce7; color: #166534; }
  .domain-edu { background: #ede9fe; color: #5b21b6; }
  .section-label { font-size: 11px; color: #aaa; padding: 0 8px; margin: 14px 0 4px; letter-spacing: 0.07em; text-transform: uppercase; }
</style>

<div style="display:flex; min-height:100vh;">

  <!-- Sidebar -->
  <div class="sidebar p-3 d-flex flex-column">
    <div class="d-flex align-items-center gap-2 mb-4 px-1 pt-1">
      <div class="logo-mark">
        <svg width="17" height="17" fill="white" viewBox="0 0 24 24"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-6h2v6zm0-8h-2V7h2v2z"/></svg>
      </div>
      <div>
        <div style="font-size:15px;font-weight:600;color:#111;line-height:1.2;">Confynex</div>
        <div style="font-size:11px;color:#888;">Host Portal</div>
      </div>
    </div>

    <div class="section-label">Main</div>
    <a href="#" class="nav-link-s active">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/></svg> Dashboard
    </a>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/></svg> Delegates
    </a>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"/></svg> Sessions
    </a>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg> Invitations
    </a>

    <div class="section-label">Manage</div>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M9 11H7v2h2v-2zm4 0h-2v2h2v-2zm4 0h-2v2h2v-2zm2-7h-1V2h-2v2H8V2H6v2H5c-1.11 0-1.99.9-1.99 2L3 20c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 16H5V9h14v11z"/></svg> Schedule
    </a>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M11.5 2C6.81 2 3 5.81 3 10.5S6.81 19 11.5 19h.5v3c4.86-2.34 8-7 8-11.5C20 5.81 16.19 2 11.5 2zm1 14.5h-2v-2h2v2zm0-4h-2c0-3.25 3-3 3-5 0-1.1-.9-2-2-2s-2 .9-2 2h-2c0-2.21 1.79-4 4-4s4 1.79 4 4c0 2.5-3 2.75-3 5z"/></svg> Reports
    </a>
    <a href="#" class="nav-link-s">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.09.63-.09.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg> Settings
    </a>

    <div style="margin-top:auto; border-top: 0.5px solid #e3e6ef; padding-top:12px;">
      <div class="d-flex align-items-center gap-2 px-1">
        <div class="avatar av-blue">HD</div>
        <div>
          <div style="font-size:13px;font-weight:500;color:#111;">Host Demo</div>
          <div style="font-size:11px;color:#888;">host@confynex.com</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Main -->
  <div class="main-content" style="flex:1; padding: 0;">

    <!-- Topbar -->
    <div class="topbar">
      <div>
        <div style="font-size:18px;font-weight:600;color:#111;">Delegate Management</div>
        <div style="font-size:13px;color:#888;">Confynex 2026 · All Domains · Host View</div>
      </div>
      <div class="d-flex gap-2 align-items-center">
        <button class="btn-export">
          <svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24" style="margin-right:5px;"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/></svg>Export
        </button>
        <button class="btn-add">+ Add Delegate</button>
      </div>
    </div>

    <div class="p-4">

      <!-- Stats -->
      <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="stat-label">Total Delegates</div>
            <div class="stat-value" style="color:#111;">248</div>
            <div style="font-size:11px;color:#3b6d11;margin-top:4px;">All domains combined</div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="stat-label">Registered</div>
            <div class="stat-value" style="color:#3b6d11;">196</div>
            <div style="font-size:11px;color:#888;margin-top:4px;">79% of total</div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="stat-label">Pending</div>
            <div class="stat-value" style="color:#854f0b;">36</div>
            <div style="font-size:11px;color:#888;margin-top:4px;">Awaiting confirmation</div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card">
            <div class="stat-label">VIP Delegates</div>
            <div class="stat-value" style="color:#534ab7;">16</div>
            <div style="font-size:11px;color:#888;margin-top:4px;">Special access granted</div>
          </div>
        </div>
      </div>

      <!-- Domain Summary -->
      <div class="row g-3 mb-4">
        <div class="col-6 col-md-3">
          <div class="stat-card d-flex align-items-center gap-3">
            <div style="background:#dbeafe;border-radius:10px;width:38px;height:38px;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
              <svg width="18" height="18" fill="#1e40af" viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm-2 5l-6 4-6-4V7l6 4 6-4v2z"/></svg>
            </div>
            <div>
              <div style="font-size:12px;color:#888;">Technology & IT</div>
              <div style="font-size:17px;font-weight:500;color:#1e40af;">82</div>
            </div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card d-flex align-items-center gap-3">
            <div style="background:#fef3c7;border-radius:10px;width:38px;height:38px;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
              <svg width="18" height="18" fill="#92400e" viewBox="0 0 24 24"><path d="M11.8 10.9c-2.27-.59-3-1.2-3-2.15 0-1.09 1.01-1.85 2.7-1.85 1.78 0 2.44.85 2.5 2.1h2.21c-.07-1.72-1.12-3.3-3.21-3.81V3h-3v2.16c-1.94.42-3.5 1.68-3.5 3.61 0 2.31 1.91 3.46 4.7 4.13 2.5.6 3 1.48 3 2.41 0 .69-.49 1.79-2.7 1.79-2.06 0-2.87-.92-2.98-2.1h-2.2c.12 2.19 1.76 3.42 3.68 3.83V21h3v-2.15c1.95-.37 3.5-1.5 3.5-3.55 0-2.84-2.43-3.81-4.7-4.4z"/></svg>
            </div>
            <div>
              <div style="font-size:12px;color:#888;">Business & Finance</div>
              <div style="font-size:17px;font-weight:500;color:#92400e;">74</div>
            </div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card d-flex align-items-center gap-3">
            <div style="background:#dcfce7;border-radius:10px;width:38px;height:38px;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
              <svg width="18" height="18" fill="#166534" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
            </div>
            <div>
              <div style="font-size:12px;color:#888;">Healthcare</div>
              <div style="font-size:17px;font-weight:500;color:#166534;">54</div>
            </div>
          </div>
        </div>
        <div class="col-6 col-md-3">
          <div class="stat-card d-flex align-items-center gap-3">
            <div style="background:#ede9fe;border-radius:10px;width:38px;height:38px;display:flex;align-items:center;justify-content:center;flex-shrink:0;">
              <svg width="18" height="18" fill="#5b21b6" viewBox="0 0 24 24"><path d="M5 13.18v4L12 21l7-3.82v-4L12 17l-7-3.82zM12 3L1 9l11 6 9-4.91V17h2V9L12 3z"/></svg>
            </div>
            <div>
              <div style="font-size:12px;color:#888;">Education</div>
              <div style="font-size:17px;font-weight:500;color:#5b21b6;">38</div>
            </div>
          </div>
        </div>
      </div>

      <!-- Table Card -->
      <div class="card-table">
        <!-- Filters -->
        <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 px-4 py-3" style="border-bottom: 0.5px solid #e3e6ef;">
          <input type="text" class="search-input" placeholder="Search by name, email, phone or organization..." style="width:300px;" id="searchInput" oninput="filterTable()">
          <div class="d-flex gap-2 flex-wrap">
            <select class="filter-select" id="domainFilter" onchange="filterTable()">
              <option value="">All Domains</option>
              <option value="Technology">Technology & IT</option>
              <option value="Business">Business & Finance</option>
              <option value="Healthcare">Healthcare</option>
              <option value="Education">Education</option>
            </select>
            <select class="filter-select" id="statusFilter" onchange="filterTable()">
              <option value="">All Status</option>
              <option value="Registered">Registered</option>
              <option value="Pending">Pending</option>
              <option value="VIP">VIP</option>
              <option value="Cancelled">Cancelled</option>
            </select>
          </div>
        </div>

        <!-- Table -->
        <div class="table-responsive">
          <table class="table mb-0" id="delegateTable">
            <thead>
              <tr>
                <th class="ps-4">#</th>
                <th>Delegate Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Organization</th>
                <th>Domain</th>
                <th>Status</th>
                <th class="pe-4">Actions</th>
              </tr>
            </thead>
            <tbody id="tableBody">
            </tbody>
          </table>
        </div>

        <!-- Footer -->
        <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-top: 0.5px solid #e3e6ef;">
          <div style="font-size:13px;color:#888;" id="countLabel">Showing 8 delegates</div>
          <nav>
            <ul class="pagination pagination-sm mb-0 gap-1">
              <li class="page-item disabled"><a class="page-link" style="border-radius:6px;border:0.5px solid #e3e6ef;font-size:13px;color:#888;">Prev</a></li>
              <li class="page-item active"><a class="page-link" style="border-radius:6px;background:#1a56db;border-color:#1a56db;font-size:13px;">1</a></li>
              <li class="page-item"><a class="page-link" style="border-radius:6px;border:0.5px solid #e3e6ef;font-size:13px;color:#888;">2</a></li>
              <li class="page-item"><a class="page-link" style="border-radius:6px;border:0.5px solid #e3e6ef;font-size:13px;color:#888;">3</a></li>
              <li class="page-item"><a class="page-link" style="border-radius:6px;border:0.5px solid #e3e6ef;font-size:13px;color:#888;">Next</a></li>
            </ul>
          </nav>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
const delegates = [
  { id:"CNX-001", name:"Arjun Sharma", email:"arjun.s@infosys.com", phone:"+91 98001 11001", org:"Infosys Ltd.", domain:"Technology", status:"Registered", av:"av-blue", initials:"AS" },
  { id:"CNX-002", name:"Priya Mehta", email:"priya.m@hdfc.com", phone:"+91 97801 22002", org:"HDFC Bank", domain:"Business", status:"VIP", av:"av-amber", initials:"PM" },
  { id:"CNX-003", name:"Dr. Ramesh Nair", email:"r.nair@aiims.edu", phone:"+91 96401 33003", org:"AIIMS Delhi", domain:"Healthcare", status:"Registered", av:"av-teal", initials:"RN" },
  { id:"CNX-004", name:"Sunita Rao", email:"sunita.rao@iimb.edu", phone:"+91 95001 44004", org:"IIM Bangalore", domain:"Education", status:"Pending", av:"av-purple", initials:"SR" },
  { id:"CNX-005", name:"Kiran Patel", email:"kiran.p@wipro.com", phone:"+91 94201 55005", org:"Wipro Technologies", domain:"Technology", status:"Registered", av:"av-indigo", initials:"KP" },
  { id:"CNX-006", name:"Meena Iyer", email:"meena.i@apollohosp.com", phone:"+91 93001 66006", org:"Apollo Hospitals", domain:"Healthcare", status:"VIP", av:"av-green", initials:"MI" },
  { id:"CNX-007", name:"Rajiv Kulkarni", email:"rajiv.k@tatacap.com", phone:"+91 92001 77007", org:"Tata Capital", domain:"Business", status:"Pending", av:"av-coral", initials:"RK" },
  { id:"CNX-008", name:"Anjali Singh", email:"anjali.s@dlf.in", phone:"+91 91001 88008", org:"DLF Group", domain:"Business", status:"Registered", av:"av-pink", initials:"AS" },
  { id:"CNX-009", name:"Vishal Gupta", email:"vishal.g@tcs.com", phone:"+91 90001 99009", org:"TCS", domain:"Technology", status:"Registered", av:"av-blue", initials:"VG" },
  { id:"CNX-010", name:"Dr. Lakshmi Devi", email:"l.devi@manipalhospital.com", phone:"+91 89001 10010", org:"Manipal Hospitals", domain:"Healthcare", status:"Cancelled", av:"av-teal", initials:"LD" },
  { id:"CNX-011", name:"Arun Bose", email:"arun.b@iit.ac.in", phone:"+91 88001 11011", org:"IIT Bombay", domain:"Education", status:"Registered", av:"av-purple", initials:"AB" },
  { id:"CNX-012", name:"Neetha Kumar", email:"neetha.k@hcl.com", phone:"+91 87001 22012", org:"HCL Technologies", domain:"Technology", status:"VIP", av:"av-indigo", initials:"NK" },
];

const statusBadge = { Registered:"badge-registered", Pending:"badge-pending", VIP:"badge-vip", Cancelled:"badge-cancelled" };
const domainBadge = { Technology:"domain-tech", Business:"domain-biz", Healthcare:"domain-health", Education:"domain-edu" };

function renderTable(data) {
  const tbody = document.getElementById("tableBody");
  tbody.innerHTML = data.map((d,i) => `
    <tr>
      <td class="ps-4" style="font-size:11px;color:#aaa;font-family:monospace;">${d.id}</td>
      <td>
        <div class="d-flex align-items-center gap-2">
          <div class="avatar ${d.av}">${d.initials}</div>
          <div style="font-weight:500;">${d.name}</div>
        </div>
      </td>
      <td style="color:#1a56db;">${d.email}</td>
      <td>${d.phone}</td>
      <td>${d.org}</td>
      <td><span class="domain-badge ${domainBadge[d.domain]}">${d.domain}</span></td>
      <td><span class="${statusBadge[d.status]}">${d.status}</span></td>
      <td class="pe-4">
        <div class="d-flex gap-1">
          <button class="btn-icon" title="View">
            <svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg>
          </button>
          <button class="btn-icon" title="Edit">
            <svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg>
          </button>
          <button class="btn-icon" title="Delete" style="color:#c0392b;">
            <svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg>
          </button>
        </div>
      </td>
    </tr>
  `).join("");
  document.getElementById("countLabel").textContent = `Showing ${data.length} of ${delegates.length} delegates`;
}

function filterTable() {
  const search = document.getElementById("searchInput").value.toLowerCase();
  const domain = document.getElementById("domainFilter").value;
  const status = document.getElementById("statusFilter").value;
  const filtered = delegates.filter(d =>
    (!search || d.name.toLowerCase().includes(search) || d.email.toLowerCase().includes(search) || d.phone.includes(search) || d.org.toLowerCase().includes(search)) &&
    (!domain || d.domain === domain) &&
    (!status || d.status === status)
  );
  renderTable(filtered);
}

renderTable(delegates);
</script>
