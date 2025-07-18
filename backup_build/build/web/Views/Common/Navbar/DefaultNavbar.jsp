<%-- 
    Document   : DefaultNavbar
    Created on : Jul 7, 2025, 10:13:15 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <li class="dropdown"><a href="departments.html">Các chuyên khoa</a>
                                <!--load từ db lên -->
<!--                                <ul>
                                    <li><a href="cardiac-clinic.html">Cardiac Clinic</a></li>
                                    <li><a href="pulmonology.html">Pulmonology</a></li>
                                    <li><a href="gynecology.html">Gynecology</a></li>
                                    <li><a href="neurology.html">Neurology</a></li>
                                    <li><a href="urology.html">Urology</a></li>
                                    <li><a href="gastrology.html">Gastrology</a></li>
                                    <li><a href="pediatrician.html">Pediatrician</a></li>
                                    <li><a href="laborotory.html">Laborotory</a></li>
                                </ul>-->
                            </li>
                            <li><a href="#">Thời gian biểu</a></li>
                            <li class="dropdown"><a href="#">Tin tức</a></li>
                            <li><a href="#">Giải đáp</a></li>
                        </ul>
                    </div>
                </nav>
                <!--End main menu-->  
                <div class="mainmenu-right-box pull-right">
                    <div class="consultation-button">
                        <a href="#">Đặt lịch ngay</a>    
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--End main menu area-->
