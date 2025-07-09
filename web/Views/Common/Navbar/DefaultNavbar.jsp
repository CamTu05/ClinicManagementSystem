<%-- 
    Document   : DefaultNavbar
    Created on : Jul 7, 2025, 10:13:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    // Kiểm tra nếu chưa có danh sách trong session
    if (session.getAttribute("daoSpecialty") == null) {
        response.sendRedirect(request.getContextPath() + "/LoadSpecialtyServlet");
        return; 
    }
%>

<!--Start main menu area-->
<section class="mainmenu-area stricky">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!--Start main menu-->
                <nav class="main-menu pull-left">
                    <div class="navbar-header">   	
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="navbar-collapse collapse clearfix">
                        <ul class="navigation clearfix">
                            <li class="current"><a href="${pageContext.request.contextPath}/Views/HomePage.jsp">Trang chủ</a></li>
                            <li class="dropdown"><a href="#">Giới thiệu</a>
                                <ul>
                                    <li><a href="#">Giới thiệu Phòng khám</a></li>
                                    <li><a href="doctors.html">Các bác sĩ</a></li>
                                    <li><a href="#">Câu hỏi thường gặp</a></li>
                                    <li><a href="#">Đánh giá từ bệnh nhân</a></li>
                                    <li><a href="#">Phòng trưng bày</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="${pageContext.request.contextPath}/Views/Common/OtherItems/Specialty.jsp">Các chuyên khoa</a>
                                <!--load từ db lên -->
                                <ul>
                                    <c:forEach items="${sessionScope.daoSpecialty.specialty}" var="s">
                                        <li><a href="${pageContext.request.contextPath}/Views/Common/OtherItems/Services.jsp?id=${s.id}">${s.specialtyName}</a></li>
                                        </c:forEach>
                                </ul>

                            <li><a href="#">Thời gian biểu</a></li>
                            <li class="dropdown"><a href="#">Tin tức</a></li>
                            <li><a href="#">Giải đáp</a></li>
                        </ul>
                    </div>
                </nav>
                <!--End main menu-->  
                <div class="mainmenu-right-box pull-right">
                    <div class="consultation-button">
                        <a href="${pageContext.request.contextPath}/Views/HomePage.jsp#appointment-form" onclick="scrollToMiddle(event, 'appointment-form')">Đặt lịch ngay</a>    
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End main menu area-->
