
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<style>
  body { background: #f0f2f8; font-family: var(--font-sans, sans-serif); margin: 0; }
  .sidebar { width: 230px; min-height: 100vh; background: #1e1e2e; position: fixed; top: 0; left: 0; z-index: 200; display: flex; flex-direction: column; }
  .main-content { margin-left: 230px; min-height: 100vh; }
  .nav-link-a { color: #aaa; border-radius: 8px; margin-bottom: 2px; font-size: 13px; padding: 8px 12px; display: flex; align-items: center; gap: 9px; text-decoration: none; transition: background 0.15s; }
  .nav-link-a.active { background: #2d2d44; color: #fff; font-weight: 500; }
  .nav-link-a:hover:not(.active) { background: #2a2a3d; color: #ddd; }
  .section-label { font-size: 10px; color: #555; padding: 0 12px; margin: 14px 0 4px; letter-spacing: 0.1em; text-transform: uppercase; }
  .topbar { background: #fff; border-bottom: 0.5px solid #e3e6ef; padding: 14px 28px; display: flex; align-items: center; justify-content: space-between; }
  .card-white { background: #fff; border-radius: 14px; border: 0.5px solid #e3e6ef; overflow: hidden; }
  .stat-card { background: #fff; border-radius: 12px; padding: 1rem 1.2rem; border: 0.5px solid #e3e6ef; }
  .stat-label { font-size: 12px; color: #888; margin-bottom: 4px; }
  .stat-value { font-size: 26px; font-weight: 600; }
  .avatar { width: 34px; height: 34px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: 500; flex-shrink: 0; }
  .av-blue { background: #dbeafe; color: #1e40af; }
  .av-teal { background: #ccfbf1; color: #0f6e56; }
  .av-coral { background: #ffe4e6; color: #9f1239; }
  .av-pink { background: #fce7f3; color: #9d174d; }
  .av-amber { background: #fef3c7; color: #92400e; }
  .av-purple { background: #ede9fe; color: #5b21b6; }
  .av-green { background: #dcfce7; color: #166534; }
  .av-indigo { background: #e0e7ff; color: #3730a3; }
  .av-admin { background: #fef2f2; color: #991b1b; }
  .badge-active { background: #dcfce7; color: #166534; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-inactive { background: #f3f4f6; color: #6b7280; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-registered { background: #eaf3de; color: #3b6d11; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-pending { background: #faeeda; color: #854f0b; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-cancelled { background: #fcebeb; color: #a32d2d; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .badge-vip { background: #eeedfe; color: #534ab7; font-size: 11px; padding: 3px 10px; border-radius: 20px; font-weight: 500; }
  .domain-tech { background: #dbeafe; color: #1e40af; font-size: 10px; padding: 2px 8px; border-radius: 20px; font-weight: 500; }
  .domain-biz { background: #fef3c7; color: #92400e; font-size: 10px; padding: 2px 8px; border-radius: 20px; font-weight: 500; }
  .domain-health { background: #dcfce7; color: #166534; font-size: 10px; padding: 2px 8px; border-radius: 20px; font-weight: 500; }
  .domain-edu { background: #ede9fe; color: #5b21b6; font-size: 10px; padding: 2px 8px; border-radius: 20px; font-weight: 500; }
  .table thead th { font-size: 11px; font-weight: 500; color: #888; text-transform: uppercase; letter-spacing: 0.06em; border-bottom: 0.5px solid #e3e6ef; background: #f9fafb; padding: 10px 14px; }
  .table tbody td { font-size: 13px; color: #222; vertical-align: middle; border-bottom: 0.5px solid #f0f0f0; padding: 10px 14px; }
  .table tbody tr:last-child td { border-bottom: none; }
  .table tbody tr:hover { background: #f8f9fc; }
  .btn-icon { background: none; border: 0.5px solid #e3e6ef; border-radius: 7px; padding: 4px 8px; cursor: pointer; font-size: 12px; color: #666; }
  .btn-icon:hover { background: #f4f6fb; }
  .search-input { border: 0.5px solid #d1d5db; border-radius: 8px; font-size: 13px; background: #f9fafb; color: #222; padding: 7px 12px; outline: none; }
  .search-input:focus { border-color: #3b82f6; background: #fff; box-shadow: 0 0 0 3px #dbeafe; }
  .filter-select { border: 0.5px solid #d1d5db; border-radius: 8px; font-size: 13px; background: #f9fafb; color: #222; padding: 6px 26px 6px 10px; outline: none; }
  .tab-btn { background: none; border: none; font-size: 14px; color: #888; padding: 10px 20px; cursor: pointer; border-bottom: 2px solid transparent; font-weight: 400; }
  .tab-btn.active { color: #1a56db; border-bottom: 2px solid #1a56db; font-weight: 500; }
  .tab-btn:hover:not(.active) { color: #444; }
  .role-pill { font-size: 11px; padding: 2px 10px; border-radius: 20px; font-weight: 500; }
  .role-admin { background: #fef2f2; color: #991b1b; }
  .role-host { background: #e0e7ff; color: #3730a3; }
  .role-delegate { background: #d1fae5; color: #065f46; }
  .quick-stat { background: #fff; border-radius: 10px; border: 0.5px solid #e3e6ef; padding: 14px 16px; }
</style>

<div style="display:flex; min-height:100vh;">

  <!-- Sidebar -->
  <div class="sidebar p-3">
    <div class="d-flex align-items-center gap-2 mb-4 px-1 pt-1">
      <div style="width:32px;height:32px;border-radius:9px;background:linear-gradient(135deg,#e74c3c,#8e44ad);display:flex;align-items:center;justify-content:center;">
        <svg width="17" height="17" fill="white" viewBox="0 0 24 24"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4z"/></svg>
      </div>
      <div>
        <div style="font-size:15px;font-weight:600;color:#fff;line-height:1.2;">Confynex</div>
        <div style="font-size:11px;color:#666;">Admin Control Panel</div>
      </div>
    </div>

    <div class="section-label">Overview</div>
    <a href="#" class="nav-link-a active" onclick="showTab('dashboard',this)">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/></svg> Dashboard
    </a>
    <a href="#" class="nav-link-a" onclick="showTab('hosts',this)">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M12 12c2.7 0 4.8-2.1 4.8-4.8S14.7 2.4 12 2.4 7.2 4.5 7.2 7.2 9.3 12 12 12zm0 2.4c-3.2 0-9.6 1.6-9.6 4.8v2.4h19.2v-2.4c0-3.2-6.4-4.8-9.6-4.8z"/></svg> Manage Hosts
    </a>
    <a href="#" class="nav-link-a" onclick="showTab('delegates',this)">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M16 11c1.66 0 2.99-1.34 2.99-3S17.66 5 16 5c-1.66 0-3 1.34-3 3s1.34 3 3 3zm-8 0c1.66 0 2.99-1.34 2.99-3S9.66 5 8 5C6.34 5 5 6.34 5 8s1.34 3 3 3zm0 2c-2.33 0-7 1.17-7 3.5V19h14v-2.5c0-2.33-4.67-3.5-7-3.5zm8 0c-.29 0-.62.02-.97.05 1.16.84 1.97 1.97 1.97 3.45V19h6v-2.5c0-2.33-4.67-3.5-7-3.5z"/></svg> Manage Delegates
    </a>

    <div class="section-label">Conference</div>
    <a href="#" class="nav-link-a">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19c0 1.1.89 2 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"/></svg> Sessions
    </a>
    <a href="#" class="nav-link-a">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4l-8 5-8-5V6l8 5 8-5v2z"/></svg> Announcements
    </a>
    <a href="#" class="nav-link-a">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M11.5 2C6.81 2 3 5.81 3 10.5S6.81 19 11.5 19h.5v3c4.86-2.34 8-7 8-11.5C20 5.81 16.19 2 11.5 2zm1 14.5h-2v-2h2v2zm0-4h-2c0-3.25 3-3 3-5 0-1.1-.9-2-2-2s-2 .9-2 2h-2c0-2.21 1.79-4 4-4s4 1.79 4 4c0 2.5-3 2.75-3 5z"/></svg> Reports
    </a>

    <div class="section-label">System</div>
    <a href="#" class="nav-link-a">
      <svg width="15" height="15" fill="currentColor" viewBox="0 0 24 24"><path d="M19.14 12.94c.04-.3.06-.61.06-.94 0-.32-.02-.64-.07-.94l2.03-1.58c.18-.14.23-.41.12-.61l-1.92-3.32c-.12-.22-.37-.29-.59-.22l-2.39.96c-.5-.38-1.03-.7-1.62-.94l-.36-2.54c-.04-.24-.24-.41-.48-.41h-3.84c-.24 0-.43.17-.47.41l-.36 2.54c-.59.24-1.13.57-1.62.94l-2.39-.96c-.22-.08-.47 0-.59.22L2.74 8.87c-.12.21-.08.47.12.61l2.03 1.58c-.05.3-.09.63-.09.94s.02.64.07.94l-2.03 1.58c-.18.14-.23.41-.12.61l1.92 3.32c.12.22.37.29.59.22l2.39-.96c.5.38 1.03.7 1.62.94l.36 2.54c.05.24.24.41.48.41h3.84c.24 0 .44-.17.47-.41l.36-2.54c.59-.24 1.13-.56 1.62-.94l2.39.96c.22.08.47 0 .59-.22l1.92-3.32c.12-.22.07-.47-.12-.61l-2.01-1.58zM12 15.6c-1.98 0-3.6-1.62-3.6-3.6s1.62-3.6 3.6-3.6 3.6 1.62 3.6 3.6-1.62 3.6-3.6 3.6z"/></svg> Settings
    </a>

    <div style="margin-top:auto;border-top:0.5px solid #333;padding-top:12px;margin-top:20px;">
      <div class="d-flex align-items-center gap-2 px-1">
        <div class="avatar av-admin">AD</div>
        <div>
          <div style="font-size:13px;font-weight:500;color:#fff;">Admin</div>
          <div style="font-size:11px;color:#666;">admin@confynex.com</div>
        </div>
      </div>
    </div>
  </div>

  <!-- Main -->
  <div class="main-content">
    <!-- Topbar -->
    <div class="topbar">
      <div id="topbarTitle">
        <div style="font-size:18px;font-weight:600;color:#111;">Admin Dashboard</div>
        <div style="font-size:13px;color:#888;">Confynex 2026 · Full System Control</div>
      </div>
      <div class="d-flex gap-2 align-items-center">
        <div style="background:#fef2f2;color:#991b1b;font-size:12px;font-weight:500;padding:4px 12px;border-radius:20px;">
          <svg width="11" height="11" fill="#991b1b" viewBox="0 0 24 24" style="margin-right:4px;"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4z"/></svg>Super Admin
        </div>
        <button style="background:#1a56db;color:#fff;border:none;border-radius:8px;font-size:13px;padding:7px 16px;cursor:pointer;font-weight:500;" id="addBtn" onclick="handleAdd()">+ Add Host</button>
      </div>
    </div>

    <div class="p-4" id="mainContent">

      <!-- DASHBOARD TAB -->
      <div id="tab-dashboard">
        <!-- Overall Stats -->
        <div class="row g-3 mb-4">
          <div class="col-6 col-md-3">
            <div class="stat-card">
              <div class="stat-label">Total Users</div>
              <div class="stat-value" style="color:#111;">265</div>
              <div style="font-size:11px;color:#888;margin-top:3px;">Hosts + Delegates</div>
            </div>
          </div>
          <div class="col-6 col-md-3">
            <div class="stat-card">
              <div class="stat-label">Total Hosts</div>
              <div class="stat-value" style="color:#3730a3;">5</div>
              <div style="font-size:11px;color:#3b6d11;margin-top:3px;">4 active · 1 inactive</div>
            </div>
          </div>
          <div class="col-6 col-md-3">
            <div class="stat-card">
              <div class="stat-label">Total Delegates</div>
              <div class="stat-value" style="color:#166534;">248</div>
              <div style="font-size:11px;color:#888;margin-top:3px;">Across all domains</div>
            </div>
          </div>
          <div class="col-6 col-md-3">
            <div class="stat-card">
              <div class="stat-label">Active Sessions</div>
              <div class="stat-value" style="color:#854f0b;">12</div>
              <div style="font-size:11px;color:#888;margin-top:3px;">Confynex 2026</div>
            </div>
          </div>
        </div>

        <!-- Domain + Role breakdown -->
        <div class="row g-3 mb-4">
          <div class="col-md-6">
            <div class="card-white p-3">
              <div style="font-size:14px;font-weight:500;color:#111;margin-bottom:14px;">Delegates by Domain</div>
              <div class="d-flex flex-column gap-2">
                <div class="d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center gap-2"><span class="domain-tech">Technology & IT</span></div>
                  <div class="d-flex align-items-center gap-2">
                    <div style="width:140px;background:#f0f2f8;border-radius:20px;height:7px;overflow:hidden;"><div style="width:66%;background:#3b82f6;height:100%;border-radius:20px;"></div></div>
                    <span style="font-size:13px;font-weight:500;color:#111;min-width:28px;">82</span>
                  </div>
                </div>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center gap-2"><span class="domain-biz">Business & Finance</span></div>
                  <div class="d-flex align-items-center gap-2">
                    <div style="width:140px;background:#f0f2f8;border-radius:20px;height:7px;overflow:hidden;"><div style="width:60%;background:#f59e0b;height:100%;border-radius:20px;"></div></div>
                    <span style="font-size:13px;font-weight:500;color:#111;min-width:28px;">74</span>
                  </div>
                </div>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center gap-2"><span class="domain-health">Healthcare</span></div>
                  <div class="d-flex align-items-center gap-2">
                    <div style="width:140px;background:#f0f2f8;border-radius:20px;height:7px;overflow:hidden;"><div style="width:44%;background:#22c55e;height:100%;border-radius:20px;"></div></div>
                    <span style="font-size:13px;font-weight:500;color:#111;min-width:28px;">54</span>
                  </div>
                </div>
                <div class="d-flex align-items-center justify-content-between">
                  <div class="d-flex align-items-center gap-2"><span class="domain-edu">Education</span></div>
                  <div class="d-flex align-items-center gap-2">
                    <div style="width:140px;background:#f0f2f8;border-radius:20px;height:7px;overflow:hidden;"><div style="width:31%;background:#8b5cf6;height:100%;border-radius:20px;"></div></div>
                    <span style="font-size:13px;font-weight:500;color:#111;min-width:28px;">38</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="card-white p-3">
              <div style="font-size:14px;font-weight:500;color:#111;margin-bottom:14px;">Registration Status Overview</div>
              <div class="row g-2">
                <div class="col-6"><div class="quick-stat"><div style="font-size:11px;color:#888;margin-bottom:4px;">Registered</div><div style="font-size:20px;font-weight:600;color:#166534;">196</div></div></div>
                <div class="col-6"><div class="quick-stat"><div style="font-size:11px;color:#888;margin-bottom:4px;">Pending</div><div style="font-size:20px;font-weight:600;color:#854f0b;">36</div></div></div>
                <div class="col-6"><div class="quick-stat"><div style="font-size:11px;color:#888;margin-bottom:4px;">VIP</div><div style="font-size:20px;font-weight:600;color:#534ab7;">16</div></div></div>
                <div class="col-6"><div class="quick-stat"><div style="font-size:11px;color:#888;margin-bottom:4px;">Cancelled</div><div style="font-size:20px;font-weight:600;color:#a32d2d;">12</div></div></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Activity -->
        <div class="card-white">
          <div class="px-4 py-3" style="border-bottom:0.5px solid #e3e6ef;">
            <div style="font-size:14px;font-weight:500;color:#111;">Recent Activity</div>
          </div>
          <div class="px-4 py-3 d-flex flex-column gap-3">
            <div class="d-flex align-items-center gap-3">
              <div class="avatar av-green" style="width:30px;height:30px;font-size:11px;">NR</div>
              <div style="flex:1;"><span style="font-size:13px;color:#111;">New delegate <strong>Neetha Kumar</strong> registered under <strong>Arjun Mehta</strong> (Host)</span></div>
              <span style="font-size:11px;color:#aaa;">2 min ago</span>
            </div>
            <div class="d-flex align-items-center gap-3">
              <div class="avatar av-indigo" style="width:30px;height:30px;font-size:11px;">AM</div>
              <div style="flex:1;"><span style="font-size:13px;color:#111;">Host <strong>Arjun Mehta</strong> updated session details for Workshop B</span></div>
              <span style="font-size:11px;color:#aaa;">18 min ago</span>
            </div>
            <div class="d-flex align-items-center gap-3">
              <div class="avatar av-amber" style="width:30px;height:30px;font-size:11px;">PM</div>
              <div style="flex:1;"><span style="font-size:13px;color:#111;">Delegate <strong>Priya Mehta</strong> status changed to <span class="badge-vip">VIP</span></span></div>
              <span style="font-size:11px;color:#aaa;">1 hr ago</span>
            </div>
            <div class="d-flex align-items-center gap-3">
              <div class="avatar av-coral" style="width:30px;height:30px;font-size:11px;">SH</div>
              <div style="flex:1;"><span style="font-size:13px;color:#111;">New host <strong>Sneha Hegde</strong> account created by Admin</span></div>
              <span style="font-size:11px;color:#aaa;">3 hr ago</span>
            </div>
            <div class="d-flex align-items-center gap-3">
              <div class="avatar av-teal" style="width:30px;height:30px;font-size:11px;">RN</div>
              <div style="flex:1;"><span style="font-size:13px;color:#111;">Delegate <strong>Dr. Ramesh Nair</strong> cancelled registration</span></div>
              <span style="font-size:11px;color:#aaa;">5 hr ago</span>
            </div>
          </div>
        </div>
      </div>

      <!-- HOSTS TAB -->
      <div id="tab-hosts" style="display:none;">
        <div class="row g-3 mb-4">
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Total Hosts</div><div class="stat-value" style="color:#3730a3;">5</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Active Hosts</div><div class="stat-value" style="color:#166534;">4</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Inactive</div><div class="stat-value" style="color:#854f0b;">1</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Delegates Managed</div><div class="stat-value" style="color:#111;">248</div></div></div>
        </div>
        <div class="card-white">
          <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-bottom:0.5px solid #e3e6ef;">
            <input type="text" class="search-input" placeholder="Search hosts by name, email or organization..." style="width:300px;" oninput="filterHosts(this.value)">
            <select class="filter-select" onchange="filterHostStatus(this.value)">
              <option value="">All Status</option>
              <option value="Active">Active</option>
              <option value="Inactive">Inactive</option>
            </select>
          </div>
          <div class="table-responsive">
            <table class="table mb-0">
              <thead>
                <tr>
                  <th class="ps-4">Host ID</th>
                  <th>Host Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Organization</th>
                  <th>Domain</th>
                  <th>Delegates</th>
                  <th>Status</th>
                  <th class="pe-4">Actions</th>
                </tr>
              </thead>
              <tbody id="hostTableBody"></tbody>
            </table>
          </div>
          <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-top:0.5px solid #e3e6ef;">
            <div style="font-size:13px;color:#888;" id="hostCount">Showing 5 hosts</div>
          </div>
        </div>
      </div>

      <!-- DELEGATES TAB -->
      <div id="tab-delegates" style="display:none;">
        <div class="row g-3 mb-4">
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Total Delegates</div><div class="stat-value" style="color:#111;">248</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Registered</div><div class="stat-value" style="color:#166534;">196</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">Pending</div><div class="stat-value" style="color:#854f0b;">36</div></div></div>
          <div class="col-6 col-md-3"><div class="stat-card"><div class="stat-label">VIP</div><div class="stat-value" style="color:#534ab7;">16</div></div></div>
        </div>
        <div class="card-white">
          <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 px-4 py-3" style="border-bottom:0.5px solid #e3e6ef;">
            <input type="text" class="search-input" placeholder="Search delegates by name, email, phone, org..." style="width:290px;" oninput="filterDelegates(this.value)">
            <div class="d-flex gap-2 flex-wrap">
              <select class="filter-select" onchange="filterDelegateStatus(this.value)">
                <option value="">All Status</option>
                <option value="Registered">Registered</option>
                <option value="Pending">Pending</option>
                <option value="VIP">VIP</option>
                <option value="Cancelled">Cancelled</option>
              </select>
              <select class="filter-select" onchange="filterDelegateDomain(this.value)">
                <option value="">All Domains</option>
                <option value="Technology">Technology</option>
                <option value="Business">Business</option>
                <option value="Healthcare">Healthcare</option>
                <option value="Education">Education</option>
              </select>
              <select class="filter-select" onchange="filterDelegateHost(this.value)">
                <option value="">All Hosts</option>
                <option value="Arjun Mehta">Arjun Mehta</option>
                <option value="Sneha Hegde">Sneha Hegde</option>
                <option value="Vikram Nair">Vikram Nair</option>
                <option value="Divya Sharma">Divya Sharma</option>
              </select>
            </div>
          </div>
          <div class="table-responsive">
            <table class="table mb-0">
              <thead>
                <tr>
                  <th class="ps-4">ID</th>
                  <th>Delegate Name</th>
                  <th>Email</th>
                  <th>Phone</th>
                  <th>Organization</th>
                  <th>Domain</th>
                  <th>Assigned Host</th>
                  <th>Status</th>
                  <th class="pe-4">Actions</th>
                </tr>
              </thead>
              <tbody id="delegateTableBody"></tbody>
            </table>
          </div>
          <div class="d-flex align-items-center justify-content-between px-4 py-3" style="border-top:0.5px solid #e3e6ef;">
            <div style="font-size:13px;color:#888;" id="delegateCount">Showing 12 delegates</div>
          </div>
        </div>
      </div>

    </div>
  </div>
</div>

<script>
const hosts = [
  { id:"HST-001", name:"Arjun Mehta", email:"arjun.m@confynex.com", phone:"+91 98001 10001", org:"Infosys Ltd.", domain:"Technology", delegates:82, status:"Active", av:"av-indigo", initials:"AM" },
  { id:"HST-002", name:"Sneha Hegde", email:"sneha.h@confynex.com", phone:"+91 97001 20002", org:"HDFC Bank", domain:"Business", delegates:74, status:"Active", av:"av-coral", initials:"SH" },
  { id:"HST-003", name:"Vikram Nair", email:"vikram.n@confynex.com", phone:"+91 96001 30003", org:"Apollo Hospitals", domain:"Healthcare", delegates:54, status:"Active", av:"av-teal", initials:"VN" },
  { id:"HST-004", name:"Divya Sharma", email:"divya.s@confynex.com", phone:"+91 95001 40004", org:"IIM Bangalore", domain:"Education", delegates:38, status:"Active", av:"av-purple", initials:"DS" },
  { id:"HST-005", name:"Rohit Joshi", email:"rohit.j@confynex.com", phone:"+91 94001 50005", org:"TCS", domain:"Technology", delegates:0, status:"Inactive", av:"av-amber", initials:"RJ" },
];

const delegates = [
  { id:"CNX-001", name:"Arjun Sharma", email:"arjun.s@infosys.com", phone:"+91 98001 11001", org:"Infosys Ltd.", domain:"Technology", host:"Arjun Mehta", status:"Registered", av:"av-blue", initials:"AS" },
  { id:"CNX-002", name:"Priya Mehta", email:"priya.m@hdfc.com", phone:"+91 97801 22002", org:"HDFC Bank", domain:"Business", host:"Sneha Hegde", status:"VIP", av:"av-amber", initials:"PM" },
  { id:"CNX-003", name:"Dr. Ramesh Nair", email:"r.nair@aiims.edu", phone:"+91 96401 33003", org:"AIIMS Delhi", domain:"Healthcare", host:"Vikram Nair", status:"Cancelled", av:"av-teal", initials:"RN" },
  { id:"CNX-004", name:"Sunita Rao", email:"sunita.rao@iimb.edu", phone:"+91 95001 44004", org:"IIM Bangalore", domain:"Education", host:"Divya Sharma", status:"Pending", av:"av-purple", initials:"SR" },
  { id:"CNX-005", name:"Kiran Patel", email:"kiran.p@wipro.com", phone:"+91 94201 55005", org:"Wipro Technologies", domain:"Technology", host:"Arjun Mehta", status:"Registered", av:"av-indigo", initials:"KP" },
  { id:"CNX-006", name:"Meena Iyer", email:"meena.i@apollohosp.com", phone:"+91 93001 66006", org:"Apollo Hospitals", domain:"Healthcare", host:"Vikram Nair", status:"VIP", av:"av-green", initials:"MI" },
  { id:"CNX-007", name:"Rajiv Kulkarni", email:"rajiv.k@tatacap.com", phone:"+91 92001 77007", org:"Tata Capital", domain:"Business", host:"Sneha Hegde", status:"Pending", av:"av-coral", initials:"RK" },
  { id:"CNX-008", name:"Anjali Singh", email:"anjali.s@dlf.in", phone:"+91 91001 88008", org:"DLF Group", domain:"Business", host:"Sneha Hegde", status:"Registered", av:"av-pink", initials:"AS" },
  { id:"CNX-009", name:"Vishal Gupta", email:"vishal.g@tcs.com", phone:"+91 90001 99009", org:"TCS", domain:"Technology", host:"Arjun Mehta", status:"Registered", av:"av-blue", initials:"VG" },
  { id:"CNX-010", name:"Dr. Lakshmi Devi", email:"l.devi@manipal.com", phone:"+91 89001 10010", org:"Manipal Hospitals", domain:"Healthcare", host:"Vikram Nair", status:"Cancelled", av:"av-teal", initials:"LD" },
  { id:"CNX-011", name:"Arun Bose", email:"arun.b@iit.ac.in", phone:"+91 88001 11011", org:"IIT Bombay", domain:"Education", host:"Divya Sharma", status:"Registered", av:"av-purple", initials:"AB" },
  { id:"CNX-012", name:"Neetha Kumar", email:"neetha.k@hcl.com", phone:"+91 87001 22012", org:"HCL Technologies", domain:"Technology", host:"Arjun Mehta", status:"VIP", av:"av-indigo", initials:"NK" },
];

const domainClass = { Technology:"domain-tech", Business:"domain-biz", Healthcare:"domain-health", Education:"domain-edu" };
const statusBadge = { Registered:"badge-registered", Pending:"badge-pending", VIP:"badge-vip", Cancelled:"badge-cancelled", Active:"badge-active", Inactive:"badge-inactive" };

let currentTab = 'dashboard';
let delegateSearch='', delegateStatus='', delegateDomain='', delegateHost='';
let hostSearch='', hostStatusFilter='';

function renderHosts(data) {
  document.getElementById("hostTableBody").innerHTML = data.map(h => `
    <tr>
      <td class="ps-4" style="font-size:11px;color:#aaa;font-family:monospace;">${h.id}</td>
      <td><div class="d-flex align-items-center gap-2"><div class="avatar ${h.av}">${h.initials}</div><div style="font-weight:500;">${h.name}</div></div></td>
      <td style="color:#1a56db;">${h.email}</td>
      <td>${h.phone}</td>
      <td>${h.org}</td>
      <td><span class="${domainClass[h.domain]}">${h.domain}</span></td>
      <td><span style="font-weight:500;">${h.delegates}</span> <span style="color:#aaa;font-size:11px;">delegates</span></td>
      <td><span class="${statusBadge[h.status]}">${h.status}</span></td>
      <td class="pe-4"><div class="d-flex gap-1">
        <button class="btn-icon" title="View"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg></button>
        <button class="btn-icon" title="Edit"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg></button>
        <button class="btn-icon" title="Delete" style="color:#c0392b;"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg></button>
      </div></td>
    </tr>`).join("");
  document.getElementById("hostCount").textContent = `Showing ${data.length} of ${hosts.length} hosts`;
}

function renderDelegates(data) {
  document.getElementById("delegateTableBody").innerHTML = data.map(d => `
    <tr>
      <td class="ps-4" style="font-size:11px;color:#aaa;font-family:monospace;">${d.id}</td>
      <td><div class="d-flex align-items-center gap-2"><div class="avatar ${d.av}">${d.initials}</div><div style="font-weight:500;">${d.name}</div></div></td>
      <td style="color:#1a56db;">${d.email}</td>
      <td>${d.phone}</td>
      <td>${d.org}</td>
      <td><span class="${domainClass[d.domain]}">${d.domain}</span></td>
      <td style="font-size:12px;color:#555;">${d.host}</td>
      <td><span class="${statusBadge[d.status]}">${d.status}</span></td>
      <td class="pe-4"><div class="d-flex gap-1">
        <button class="btn-icon" title="View"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/></svg></button>
        <button class="btn-icon" title="Edit"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04c.39-.39.39-1.02 0-1.41l-2.34-2.34c-.39-.39-1.02-.39-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z"/></svg></button>
        <button class="btn-icon" title="Delete" style="color:#c0392b;"><svg width="13" height="13" fill="currentColor" viewBox="0 0 24 24"><path d="M6 19c0 1.1.9 2 2 2h8c1.1 0 2-.9 2-2V7H6v12zM19 4h-3.5l-1-1h-5l-1 1H5v2h14V4z"/></svg></button>
      </div></td>
    </tr>`).join("");
  document.getElementById("delegateCount").textContent = `Showing ${data.length} of ${delegates.length} delegates`;
}

function applyDelegateFilters() {
  const f = delegates.filter(d =>
    (!delegateSearch || d.name.toLowerCase().includes(delegateSearch) || d.email.toLowerCase().includes(delegateSearch) || d.phone.includes(delegateSearch) || d.org.toLowerCase().includes(delegateSearch)) &&
    (!delegateStatus || d.status === delegateStatus) &&
    (!delegateDomain || d.domain === delegateDomain) &&
    (!delegateHost || d.host === delegateHost)
  );
  renderDelegates(f);
}
function applyHostFilters() {
  const f = hosts.filter(h =>
    (!hostSearch || h.name.toLowerCase().includes(hostSearch) || h.email.toLowerCase().includes(hostSearch) || h.org.toLowerCase().includes(hostSearch)) &&
    (!hostStatusFilter || h.status === hostStatusFilter)
  );
  renderHosts(f);
}
function filterDelegates(v) { delegateSearch = v.toLowerCase(); applyDelegateFilters(); }
function filterDelegateStatus(v) { delegateStatus = v; applyDelegateFilters(); }
function filterDelegateDomain(v) { delegateDomain = v; applyDelegateFilters(); }
function filterDelegateHost(v) { delegateHost = v; applyDelegateFilters(); }
function filterHosts(v) { hostSearch = v.toLowerCase(); applyHostFilters(); }
function filterHostStatus(v) { hostStatusFilter = v; applyHostFilters(); }

function showTab(tab, el) {
  ['dashboard','hosts','delegates'].forEach(t => {
    document.getElementById('tab-'+t).style.display = t===tab ? '' : 'none';
  });
  document.querySelectorAll('.nav-link-a').forEach(a => a.classList.remove('active'));
  if(el) el.classList.add('active');
  currentTab = tab;
  const titles = { dashboard: ['Admin Dashboard','Confynex 2026 · Full System Control'], hosts: ['Manage Hosts','Confynex 2026 · All Registered Hosts'], delegates: ['Manage Delegates','Confynex 2026 · All Delegates Across Hosts'] };
  const addLabels = { dashboard: '+ Add Host', hosts: '+ Add Host', delegates: '+ Add Delegate' };
  document.getElementById('topbarTitle').innerHTML = `<div style="font-size:18px;font-weight:600;color:#111;">${titles[tab][0]}</div><div style="font-size:13px;color:#888;">${titles[tab][1]}</div>`;
  document.getElementById('addBtn').textContent = addLabels[tab];
}

function handleAdd() {}

renderHosts(hosts);
renderDelegates(delegates);
</script>
