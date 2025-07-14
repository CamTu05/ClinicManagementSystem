<%-- 
    Document   : DashboardHeader
    Created on : Jul 13, 2025, 4:54:37 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Topbar Start -->
<header class="navbar-header">
    <div class="page-container topbar-menu">
        <div class="d-flex align-items-center gap-2">

            <!-- Logo -->
            <a href="index.html" class="logo">

                <!-- Logo Normal -->
                <span class="logo-light">
                    <span class="logo-lg"><img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="logo"></span>
                    <span class="logo-sm"><img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="small logo"></span>
                </span>

                <!-- Logo Dark -->
                <span class="logo-dark">
                    <span class="logo-lg"><img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="dark logo"></span>
                </span>
            </a>

            <!-- Sidebar Mobile Button -->
            <a id="mobile_btn" class="mobile-btn" href="#sidebar">
                <i class="ti ti-menu-deep fs-24"></i>
            </a>

            <button class="sidenav-toggle-btn btn border-0 p-0 active" id="toggle_btn2"> 
                <i class="ti ti-arrow-right"></i>
            </button> 

            <!-- Search -->
            <div class="me-auto d-flex align-items-center header-search d-lg-flex d-none">
                <!-- Search -->
                <div class="input-icon-start position-relative me-2">
                    <span class="input-icon-addon">
                        <i class="ti ti-search"></i>
                    </span>
                    <input type="text" class="form-control shadow-sm" placeholder="Search">
                    <span class="input-icon-addon text-dark shadow fs-18 d-inline-flex p-0 header-search-icon"><i class="ti ti-command"></i></span>
                </div>
                <!-- /Search -->
            </div>

        </div>

        <div class="d-flex align-items-center">

            <!-- Search for Mobile -->
            <div class="header-item d-flex d-lg-none me-2">
                <button class="topbar-link btn btn-icon" data-bs-toggle="modal" data-bs-target="#searchModal" type="button">
                    <i class="ti ti-search fs-16"></i>
                </button>
            </div>

            <!-- AI Assistance -->
            <a href="javascript:void(0);" class="btn btn-liner-gradient me-3 d-lg-flex d-none">AI Assistance<i class="ti ti-chart-bubble-filled ms-1"></i></a>
            <!-- AI Assistance -->

            <!-- Appointment -->
            <div class="header-item">
                <div class="dropdown me-2">
                    <a href="new-appointment.html" class="btn topbar-link"><i class="ti ti-calendar-due"></i></a>
                </div>
            </div>                    
            <!-- Appointment -->

            <!-- Settings -->
            <div class="header-item">
                <div class="dropdown me-2">
                    <a href="profile-settings.html" class="btn topbar-link"><i class="ti ti-settings-2"></i></a>
                </div> 
            </div> 
            <!-- Settings -->                   

            <!-- Light/Dark Mode Button -->
            <div class="header-item d-none d-sm-flex me-2">
                <button class="topbar-link btn btn-icon topbar-link" id="light-dark-mode" type="button">
                    <i class="ti ti-moon fs-16"></i>
                </button>
            </div>


            <!-- Notification Dropdown -->
            <div class="header-item">
                <div class="dropdown me-3">

                    <button class="topbar-link btn btn-icon topbar-link dropdown-toggle drop-arrow-none" data-bs-toggle="dropdown" data-bs-offset="0,24" type="button" aria-haspopup="false" aria-expanded="false">
                        <i class="ti ti-bell-check fs-16 animate-ring"></i>
                        <span class="notification-badge"></span>
                    </button>

                    <div class="dropdown-menu p-0 dropdown-menu-end dropdown-menu-lg" style="min-height: 300px;">

                        <div class="p-2 border-bottom">
                            <div class="row align-items-center">
                                <div class="col">
                                    <h6 class="m-0 fs-16 fw-semibold"> Notifications</h6>
                                </div>
                            </div>
                        </div>

                        <!-- View All-->
                        <div class="p-2 rounded-bottom border-top text-center">
                            <a href="notifications.html" class="text-center text-decoration-underline fs-14 mb-0">
                                View All Notifications
                            </a>
                        </div>

                    </div>
                </div>
            </div>

            <!-- User Dropdown -->
            <div class="dropdown profile-dropdown d-flex align-items-center justify-content-center">
                <a href="javascript:void(0);" class="topbar-link dropdown-toggle drop-arrow-none position-relative" data-bs-toggle="dropdown" data-bs-offset="0,22" aria-haspopup="false" aria-expanded="false">
                    <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg" width="32" class="rounded-circle d-flex" alt="user-image">
                    <span class="online text-success"><i class="ti ti-circle-filled d-flex bg-white rounded-circle border border-1 border-white"></i></span>
                </a>
                <div class="dropdown-menu dropdown-menu-end dropdown-menu-md p-2">

                    <div class="d-flex align-items-center bg-light rounded-3 p-2 mb-2">
                        <img src="${pageContext.request.contextPath}/assets/img/users/user-01.jpg" class="rounded-circle" width="42" height="42" alt="">
                        <div class="ms-2">
                            <p class="fw-medium text-dark mb-0">Jimmy Anderson</p>
                            <span class="d-block fs-13">Administrator</span>
                        </div>
                    </div>

                    <!-- Item-->
                    <a href="profile-settings.html" class="dropdown-item">
                        <i class="ti ti-user-circle me-1 align-middle"></i>
                        <span class="align-middle">Profile Settings</span>
                    </a>

                    <!-- Item-->
                    <a href="account-settings.html" class="dropdown-item">
                        <i class="ti ti-settings me-1 align-middle"></i>
                        <span class="align-middle">Account Settings</span>
                    </a>

                    <!-- item -->
                    <div class="form-check form-switch form-check-reverse d-flex align-items-center justify-content-between dropdown-item mb-0">
                        <label class="form-check-label" for="notify"><i class="ti ti-bell me-1"></i>Notifications</label>
                        <input class="form-check-input me-0" type="checkbox" role="switch" id="notify">
                    </div>

                    <!-- Item-->
                    <a href="transactions.html" class="dropdown-item">
                        <i class="ti ti-transition-right me-1 align-middle"></i>
                        <span class="align-middle">Transactions</span>
                    </a>



                    <!-- Item-->
                    <div class="pt-2 mt-2 border-top">
                        <a href="login.html" class="dropdown-item text-danger">
                            <i class="ti ti-logout me-1 fs-17 align-middle"></i>
                            <span class="align-middle">Log Out</span>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</header>
<!-- Topbar End -->
