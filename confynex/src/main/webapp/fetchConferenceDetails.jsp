<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Conference Details | Confynex</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>

:root{
    --navy-950:#0b0e16;
    --navy-900:#10131f;
    --navy-800:#161a29;
    --navy-700:#1d2235;
    --gold-500:#e0b15c;
    --gold-400:#eccb8a;
    --gold-100:#f7e9cd;
    --text-soft:#aab0c2;
    --border-soft:rgba(224,177,92,0.18);
}

*{
    box-sizing:border-box;
}

body{
    background:var(--navy-950);
    font-family:'Inter', sans-serif;
    color:#e9ebf2;
    margin:0;
    min-height:100vh;
}

h1,h2,h3,h4,.brand-name{
    font-family:'Playfair Display', serif;
}

/* ===================== NAVBAR ===================== */

.confynex-nav{
    background:linear-gradient(180deg, var(--navy-900) 0%, var(--navy-950) 100%);
    border-bottom:1px solid var(--border-soft);
    padding:14px 36px;
}

.confynex-nav .navbar-brand{
    display:flex;
    align-items:center;
    gap:10px;
}

.brand-mark{
    width:34px;
    height:34px;
    border-radius:8px;
    background:linear-gradient(135deg, var(--gold-400), var(--gold-500));
    display:flex;
    align-items:center;
    justify-content:center;
    color:var(--navy-950);
    font-size:18px;
}

.brand-name{
    font-weight:700;
    font-size:1.5rem;
    color:#f4f1e8;
    letter-spacing:0.3px;
}

.brand-name span{
    color:var(--gold-500);
}

.confynex-nav .nav-link{
    color:#cfd3e0 !important;
    font-weight:600;
    font-size:0.82rem;
    letter-spacing:0.4px;
    text-transform:uppercase;
    padding:10px 16px !important;
    transition:color .2s ease;
}

.confynex-nav .nav-link:hover,
.confynex-nav .nav-link.active{
    color:var(--gold-400) !important;
}

.btn-home-nav{
    background:transparent;
    border:1.5px solid var(--gold-500);
    color:var(--gold-400);
    font-weight:700;
    font-size:0.82rem;
    letter-spacing:0.4px;
    text-transform:uppercase;
    padding:10px 22px;
    border-radius:8px;
    display:inline-flex;
    align-items:center;
    gap:8px;
    transition:all .2s ease;
    text-decoration:none;
}

.btn-home-nav:hover{
    background:var(--gold-500);
    color:var(--navy-950);
}

.btn-delegate-login{
    background:linear-gradient(135deg, var(--gold-400), var(--gold-500));
    border:none;
    color:var(--navy-950);
    font-weight:700;
    font-size:0.82rem;
    letter-spacing:0.4px;
    text-transform:uppercase;
    padding:11px 22px;
    border-radius:8px;
    display:inline-flex;
    align-items:center;
    gap:8px;
    text-decoration:none;
    box-shadow:0 6px 16px rgba(224,177,92,0.25);
    transition:transform .2s ease;
}

.btn-delegate-login:hover{
    transform:translateY(-1px);
    color:var(--navy-950);
}

/* ===================== PAGE HEADER ===================== */

.page-banner{
    background:
        linear-gradient(180deg, rgba(11,14,22,0.92), rgba(11,14,22,0.98)),
        radial-gradient(circle at 20% 20%, rgba(224,177,92,0.12), transparent 40%);
    padding:48px 0 40px;
    border-bottom:1px solid var(--border-soft);
}

.eyebrow-pill{
    display:inline-flex;
    align-items:center;
    gap:8px;
    background:rgba(224,177,92,0.1);
    border:1px solid var(--border-soft);
    color:var(--gold-400);
    font-size:0.75rem;
    font-weight:700;
    letter-spacing:0.6px;
    text-transform:uppercase;
    padding:7px 16px;
    border-radius:30px;
    margin-bottom:18px;
}

.page-banner h1{
    font-weight:800;
    font-size:2.4rem;
    color:#f7f5ee;
    margin-bottom:8px;
}

.page-banner p{
    color:var(--text-soft);
    max-width:620px;
    margin:0;
}

/* ===================== SECTION CARDS ===================== */

.section-wrap{
    padding:48px 0 70px;
}

.confy-card{
    background:var(--navy-900);
    border:1px solid var(--border-soft);
    border-radius:16px;
    overflow:hidden;
    margin-bottom:34px;
    box-shadow:0 18px 40px rgba(0,0,0,0.35);
}

.confy-card-header{
    display:flex;
    align-items:center;
    justify-content:space-between;
    gap:16px;
    padding:20px 28px;
    background:var(--navy-800);
    border-bottom:1px solid var(--border-soft);
}

.confy-card-header .icon-badge{
    width:42px;
    height:42px;
    border-radius:10px;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:1.15rem;
    flex-shrink:0;
}

.icon-badge.conf{ background:rgba(224,177,92,0.15); color:var(--gold-400); }
.icon-badge.host{ background:rgba(110,168,254,0.15); color:#7db4ff; }
.icon-badge.coord{ background:rgba(123,214,153,0.15); color:#7bd699; }

.confy-card-header h4{
    margin:0;
    color:#f4f1e8;
    font-weight:700;
    font-size:1.1rem;
    display:flex;
    align-items:center;
    gap:14px;
}

.confy-card-header .header-sub{
    font-family:'Inter', sans-serif;
    color:var(--text-soft);
    font-size:0.78rem;
    font-weight:500;
    margin-top:2px;
    text-transform:none;
    letter-spacing:0;
}

.confy-card-body{
    padding:0;
}

/* ===================== TABLES ===================== */

.confy-table{
    width:100%;
    border-collapse:separate;
    border-spacing:0;
    margin:0;
}

.confy-table thead th{
    background:var(--navy-700);
    color:var(--gold-300, var(--gold-400));
    font-size:0.74rem;
    font-weight:700;
    letter-spacing:0.6px;
    text-transform:uppercase;
    padding:14px 24px;
    border-bottom:1px solid var(--border-soft);
    white-space:nowrap;
}

.confy-table tbody td{
    padding:16px 24px;
    color:#dadfec;
    font-size:0.92rem;
    border-bottom:1px solid rgba(255,255,255,0.05);
    vertical-align:middle;
}

.confy-table tbody tr:last-child td{
    border-bottom:none;
}

.confy-table tbody tr{
    transition:background .15s ease;
}

.confy-table tbody tr:hover{
    background:rgba(224,177,92,0.06);
}

.person-cell{
    display:flex;
    align-items:center;
    gap:12px;
    text-align:left;
}

.avatar-circle{
    width:38px;
    height:38px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-weight:700;
    font-size:0.85rem;
    flex-shrink:0;
    color:var(--navy-950);
}

.avatar-host{ background:linear-gradient(135deg,#9cc2ff,#5b8def); }
.avatar-coord{ background:linear-gradient(135deg,#a6e8c0,#54bd83); }

.person-name{
    font-weight:600;
    color:#f1f3fa;
    font-size:0.93rem;
}

.badge-soft{
    display:inline-flex;
    align-items:center;
    gap:6px;
    background:rgba(224,177,92,0.12);
    color:var(--gold-400);
    border:1px solid var(--border-soft);
    border-radius:20px;
    padding:5px 12px;
    font-size:0.78rem;
    font-weight:600;
}

.conf-thumb{
    width:46px;
    height:46px;
    border-radius:10px;
    object-fit:cover;
    border:1px solid var(--border-soft);
}

.empty-state{
    text-align:center;
    padding:48px 24px;
    color:var(--text-soft);
}

.empty-state i{
    font-size:2rem;
    color:var(--gold-500);
    opacity:0.6;
    margin-bottom:10px;
    display:block;
}

footer.confy-footer{
    text-align:center;
    padding:24px;
    color:#5b6175;
    font-size:0.8rem;
    border-top:1px solid var(--border-soft);
}

@media (max-width: 768px){
    .confynex-nav{ padding:14px 18px; }
    .page-banner h1{ font-size:1.7rem; }
}

</style>

</head>

<body>

<!-- ================= NAVBAR ================= -->
<nav class="navbar navbar-expand-lg confynex-nav">
    <div class="container-fluid">

        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <span class="brand-mark"><i class="bi bi-stars"></i></span>
            <span class="brand-name">Confy<span>nex</span></span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#confyNavContent" style="border-color:var(--border-soft);">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="confyNavContent">

            <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Who We Are</a></li>
                <li class="nav-item"><a class="nav-link" href="#">What We Do</a></li>
                <li class="nav-item"><a class="nav-link" href="#">How We Do It</a></li>
                <li class="nav-item"><a class="nav-link active" href="#">Our Work</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Features</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact Us</a></li>
            </ul>

            <div class="d-flex align-items-center gap-2 mt-3 mt-lg-0">
                <a href="${pageContext.request.contextPath}/home" class="btn-home-nav">
                    <i class="bi bi-house-door-fill"></i> Home
                </a>
                <a href="#" class="btn-delegate-login">
                    <i class="bi bi-shield-lock-fill"></i> Delegate Login
                </a>
            </div>

        </div>
    </div>
</nav>

<!-- ================= PAGE BANNER ================= -->
<div class="page-banner">
    <div class="container">
        <span class="eyebrow-pill"><i class="bi bi-stars"></i> Conference Intelligence Platform</span>
        <h1>Conference Overview</h1>
        <p>A complete snapshot of the conference, its host, and the coordinating team — managed end to end with Confynex.</p>
    </div>
</div>

<!-- ================= CONTENT ================= -->
<div class="container section-wrap">

    <!-- ================= CONFERENCE DETAILS ================= -->

    <div class="confy-card">

        <div class="confy-card-header">
            <h4>
                <span class="icon-badge conf"><i class="bi bi-calendar-event-fill"></i></span>
                <span>
                    Conference Details
                    <div class="header-sub">Core event information</div>
                </span>
            </h4>
        </div>

        <div class="confy-card-body table-responsive">

            <table class="confy-table">

                <thead>
                <tr>
                    <th style="width:60px;"></th>
                    <th>Conference Name</th>
                    <th>Date</th>
                    <th>Venue</th>
                    <th>Theme</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${hostDTO}" var="conference">
                    <tr>
                        <td>
                            <img src="https://images.unsplash.com/photo-1505373877841-8d25f7d46678?w=120&h=120&fit=crop"
                                 class="conf-thumb" alt="conference">
                        </td>
                        <td class="text-start fw-semibold" style="color:#f4f1e8;">${conference.conference_title}</td>
                        <td><span class="badge-soft"><i class="bi bi-calendar3"></i> ${conference.conference_date}</span></td>
                        <td>${conference.venue}</td>
                        <td><span class="text-muted">—</span></td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

            <c:if test="${empty hostDTO}">
                <div class="empty-state">
                    <i class="bi bi-calendar-x"></i>
                    No conference records found.
                </div>
            </c:if>

        </div>

    </div>


    <!-- ================= HOST DETAILS ================= -->

    <div class="confy-card">

        <div class="confy-card-header">
            <h4>
                <span class="icon-badge host"><i class="bi bi-person-badge-fill"></i></span>
                <span>
                    Host Details
                    <div class="header-sub">Conference organizer information</div>
                </span>
            </h4>
        </div>

        <div class="confy-card-body table-responsive">

            <table class="confy-table">

                <thead>
                <tr>
                    <th class="text-start">Host Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Organization</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${hostDTO}" var="host">
                    <tr>
                        <td class="text-start">
                            <div class="person-cell">
                                <span class="avatar-circle avatar-host">
                                    <c:out value="${host.full_name.substring(0,1)}" />
                                </span>
                                <span class="person-name">${host.full_name}</span>
                            </div>
                        </td>
                        <td><i class="bi bi-envelope-fill text-muted me-1"></i>${host.email}</td>
                        <td><i class="bi bi-telephone-fill text-muted me-1"></i>${host.phone}</td>
                        <td>${host.company_name}</td>
                    </tr>
                </c:forEach>

                </tbody>

            </table>

            <c:if test="${empty hostDTO}">
                <div class="empty-state">
                    <i class="bi bi-person-x"></i>
                    No host records found.
                </div>
            </c:if>

        </div>

    </div>


    <!-- ================= COORDINATOR DETAILS ================= -->

    <div class="confy-card mb-0">

        <div class="confy-card-header">
            <h4>
                <span class="icon-badge coord"><i class="bi bi-person-workspace"></i></span>
                <span>
                    Coordinator Details
                    <div class="header-sub">On-ground coordination team</div>
                </span>
            </h4>
        </div>

        <div class="confy-card-body table-responsive">

            <table class="confy-table">

                <thead>
                <tr>
                    <th class="text-start">Coordinator Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                </tr>
                </thead>

                <tbody>

                <c:forEach items="${coordinatorDTO}" var="coordinator">

                    <tr>

                        <td class="text-start">
                            <div class="person-cell">
                                <span class="avatar-circle avatar-coord">
                                    <c:out value="${coordinator.fullName.substring(0,1)}" />
                                </span>
                                <span class="person-name">${coordinator.fullName}</span>
                            </div>
                        </td>
                        <td><i class="bi bi-envelope-fill text-muted me-1"></i>${coordinator.email}</td>
                        <td><i class="bi bi-telephone-fill text-muted me-1"></i>${coordinator.phoneNumber}</td>
                        <td>${coordinator.organisationName}</td>

                    </tr>

                </c:forEach>

                </tbody>

            </table>

            <c:if test="${empty coordinatorDTO}">
                <div class="empty-state">
                    <i class="bi bi-people"></i>
                    No coordinator records found.
                </div>
            </c:if>

        </div>

    </div>

</div>

<footer class="confy-footer">
    &copy; 2026 Confynex — Conference Intelligence Platform
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
