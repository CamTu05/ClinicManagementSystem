<%-- 
    Document   : DefaultHeader
    Created on : Jul 7, 2025, 3:57:56 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Start Topbar -->
<div class="topbar-auth" style="background-color: #f5f5f5; padding: 8px 0;">
    <div class="container">
        <div style="text-align: right;">
            <%
                Object user = session.getAttribute("user");
                if (user == null) {
            %>
            <a href="LoginServlet" style="margin-right: 15px; color: #333; text-decoration: none;">Đăng nhập</a>
            <a href="RegisterServlet" style="color: #333; text-decoration: none;">Đăng ký</a>
            <%
                } else {
            %>
                    <li class="option"><a style="color:#0392ce" href="#">Xin chào, ${user.fullname}!</a>
                        <ul class="option-menu">
                            <li><a href="PatientProfileServlet">Thông tin tài khoản</a></li>
                            <li><a href="ChangePasswordServlet">Đổi mật khẩu</a></li>
                            <li><a href="LogoutServlet">Đăng xuất</a></li>
                        </ul>
                    </li>
                
            <%
                }
            %>
        </div>
    </div>
</div>
<!-- End Topbar -->

<!-- Start Header -->
<section class="header-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3">
                <div class="logo">
                    <a href="${pageContext.request.contextPath}/Views/HomePage.jsp">
                        <img src="${pageContext.request.contextPath}/images/resources/logo.png" alt="Awesome Logo">
                    </a>
                </div>
            </div>
            <div class="col-lg-9 col-md-9">
                <div class="header-right">
                    <ul>
                        <li>
                            <div class="icon-holder">
                                <span class="flaticon-technology"></span>
                            </div>
                            <div class="text-holder">
                                <h4>Tổng đài hỗ trợ</h4>
                                <span>+1-888-987-6543</span>    
                            </div>
                        </li>
                        <li>
                            <div class="icon-holder">
                                <span class="flaticon-pin"></span>
                            </div>
                            <div class="text-holder">
                                <h4>123 Khu CNC Hòa Lạc</h4>
                                <span>Thạch Hòa, Thạch Thất</span>    
                            </div>
                        </li>
                        <li>
                            <div class="icon-holder">
                                <span class="flaticon-agenda"></span>
                            </div>
                            <div class="text-holder">
                                <h4>T2 - T7</h4>
                                <span>8h00 - 17h00</span>    
                            </div>
                        </li>        
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End Header -->
