<%-- 
    Document   : DoctorNavbar
    Created on : Jul 13, 2025, 5:10:19 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Sidenav Menu Start -->
<div class="sidebar" id="sidebar">

    <!-- Start Logo -->
    <div class="sidebar-logo">
        <div>
            <!-- Logo Normal -->
            <a href="index.html" class="logo logo-normal">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="Logo">
            </a>

            <!-- Logo Small -->
            <a href="index.html" class="logo-small">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg" alt="Logo">
            </a>

            <!-- Logo Dark -->
            <a href="index.html" class="dark-logo">
                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="Logo">
            </a>
        </div>
        <button class="sidenav-toggle-btn btn border-0 p-0 active" id="toggle_btn"> 
            <i class="ti ti-arrow-left"></i>
        </button>

        <!-- Sidebar Menu Close -->
        <button class="sidebar-close">
            <i class="ti ti-x align-middle"></i>
        </button>                
    </div>
    <!-- End Logo -->

    <!-- Sidenav Menu -->
    <div class="sidebar-inner" data-simplebar>                
        <div id="sidebar-menu" class="sidebar-menu">
            <ul>
                <li class="menu-title"><span>Main Menu</span></li>
                <li>
                    <ul>
                        <li class="active">
                            <a href="doctor-dashboard.html">
                                <i class="ti ti-layout-dashboard"></i><span>Bảng điều khiển</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-calendar-check"></i><span>Cuộc hẹn</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="doctors-appointments.html">Cuộc hẹn</a></li>
                                <li><a href="online-consultations.html">Tư vấn trực tuyến</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/MyDoctorSchedule">
                                <i class="ti ti-clock-check"></i><span>Lịch làm việc</span>
                            </a>
                        </li>
                        <li>
                            <a href="doctors-prescriptions.html">
                                <i class="ti ti-prescription"></i><span>Đơn thuốc</span>
                            </a>
                        </li>
                        <li>
                            <a href="doctors-leaves.html">
                                <i class="ti ti-calendar-x"></i><span>Rời khỏi</span>
                            </a>
                        </li>
                        <li>
                            <a href="doctors-reviews.html">
                                <i class="ti ti-star"></i><span>Đánh giá</span>
                            </a>
                        </li>
                        <li class="submenu">
                            <a href="javascript:void(0);">
                                <i class="ti ti-settings"></i><span>Cài đặt</span>
                                <span class="menu-arrow"></span>
                            </a>
                            <ul>
                                <li><a href="doctors-profile-settings.html">Cài đặt hồ sơ</a></li>
                                <li><a href="doctors-password-settings.html">Thay đổi mật khẩu</a></li>
                                <li><a href="doctors-notification-settings.html">Thông báo</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>

            </ul>                   
        </div>
        <div class="sidebar-footer border-top mt-3">
            <div class="trial-item mt-0 p-3 text-center">
                <div class="trial-item-icon rounded-4 mb-3 p-2 text-center shadow-sm d-inline-flex">
                    <img src="${pageContext.request.contextPath}/assets/img/icons/sidebar-icon.svg" alt="img">
                </div>
                <div>
                    <h6 class="fs-14 fw-semibold mb-1">Upgrade To Pro</h6>
                    <p class="fs-13 mb-0">Check 1 min video and begin use Preclinic like a pro</p>
                </div>
                <a href="javascript:void(0);" class="close-icon shadow-sm"><i class="ti ti-x"></i></a>
            </div>
        </div>
    </div>

</div>
<!-- Sidenav Menu End -->
