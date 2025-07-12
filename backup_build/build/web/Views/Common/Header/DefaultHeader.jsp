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
                <a href="${pageContext.request.contextPath}/Views/Login.jsp" style="margin-right: 15px; color: #333; text-decoration: none;">Đăng nhập</a>
                <a href="${pageContext.request.contextPath}/Views/Register.jsp" style="color: #333; text-decoration: none;">Đăng ký</a>
            <%
                } else {
            %>
                <span style="margin-right: 10px; color: #333;">Xin chào, <%= user %></span>
                <a href="${pageContext.request.contextPath}/logout" style="color: #333; text-decoration: none;">Đăng xuất</a>
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
