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
                            <li class="current"><a href="${pageContext.request.contextPath}/HomePageServlet">Trang chủ</a></li>
                            <li class="dropdown"><a href="#">Giới thiệu</a>
                                <ul>
                                    <li><a href="#">Giới thiệu Phòng khám</a></li>
                                    <li><a href="${pageContext.request.contextPath}/DoctorListServlet">Các bác sĩ</a></li>
                                    <li><a href="#">Câu hỏi thường gặp</a></li>
                                    <li><a href="${pageContext.request.contextPath}/DoctorFeedbackServlet" id="patientReviewLink">Đánh giá từ bệnh nhân</a></li>
                                    <li><a href="#">Phòng trưng bày</a></li>
                                </ul>
                            </li>
                            <li class="dropdown"><a href="${pageContext.request.contextPath}/Views/Common/OtherItems/Specialty.jsp">Các chuyên khoa</a>

                                <ul>
                                    <c:forEach items="${sessionScope.daoSpecialty.specialty}" var="s">
                                        <li><a href="${pageContext.request.contextPath}/LoadServicesServlet?id=${s.id}">${s.specialtyName}</a></li>
                                        </c:forEach>
                                </ul>

                            <li><a href="${pageContext.request.contextPath}/LoadSchedulesServlet?id=0&type=-1">Thời gian biểu</a></li>
                            <li class="dropdown"><a href="#">Tin tức</a></li>
                            <li><a href="#">Giải đáp</a></li>
                        </ul>
                    </div>
                </nav>
                <!--End main menu-->  
                <div class="mainmenu-right-box pull-right">
                    <div class="consultation-button">
                        <a href="#" onclick="goToAppointment(event)">Đặt lịch ngay</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    function goToAppointment(event) {
        event.preventDefault();

        const currentPath = window.location.pathname;

        // Nếu đang ở HomePage, chỉ cuộn
        if (currentPath.includes('HomePage.jsp')) {
            const element = document.getElementById('appointment-form');
            if (element) {
                element.scrollIntoView({
                    behavior: "smooth",
                    block: "center"
                });
            }
        } else {
            // Nếu không ở HomePage, chuyển trang
            window.location.href = '${pageContext.request.contextPath}/Views/HomePage.jsp#appointment-form';
        }
    }
</script>



