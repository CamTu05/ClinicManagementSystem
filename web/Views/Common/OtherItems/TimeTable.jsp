<%-- 
    Document   : TimeTable
    Created on : Jul 10, 2025, 9:17:35 AM
    Author     : SONHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <meta charset="UTF-8">
        <!-- responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- For IE -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- master stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <!-- Favicon -->
        <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/images/favicon/apple-touch-icon.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-32x32.png" sizes="32x32">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/favicon/favicon-16x16.png" sizes="16x16">
    </head>
    <body>
        <div class="boxed_wrapper">
            <%@ include file="../Header/DefaultHeader.jsp" %>
            <%@ include file="../Navbar/DefaultNavbar.jsp" %>


            <!--Start time table area-->
            <div class="time-table-area">
                <div class="container">
                    <div class="row pd-bottom">
                        <div class="col-md-6">
                            <div class="row">
                                <div class="col-md-6">

                                    <select class="selectmenu" onchange="location.href = this.value;">
                                        <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=0&type=${sessionScope.typeDay}">Tất cả</option>
                                        <c:forEach items="${sessionScope.daoSpecialty.specialty}" var="s">
                                            <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${s.id}&type=${sessionScope.typeDay}"
                                                    <c:if test="${sessionScope.idTable == s.id}">selected</c:if>>
                                                ${s.specialtyName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-md-6">

                                    <div class="col-md-6">
                                        <select class="selectmenu" onchange="location.href = this.value;">
                                            <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=-1"
                                                    <c:if test="${sessionScope.typeDay == -1}">selected</c:if>>
                                                        Cả tuần
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=0"
                                                    <c:if test="${sessionScope.typeDay == 0}">selected</c:if>>
                                                        Thứ 2 
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=1"
                                                    <c:if test="${sessionScope.typeDay == 1}">selected</c:if>>
                                                        Thứ 3
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=2"
                                                    <c:if test="${sessionScope.typeDay == 2}">selected</c:if>>
                                                        Thứ 4
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=3"
                                                    <c:if test="${sessionScope.typeDay == 3}">selected</c:if>>
                                                        Thứ 5
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=4"
                                                    <c:if test="${sessionScope.typeDay == 4}">selected</c:if>>
                                                        Thứ 6
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=5"
                                                    <c:if test="${sessionScope.typeDay == 5}">selected</c:if>>
                                                        Thứ 7
                                                    </option>
                                                    <option value="${pageContext.request.contextPath}/LoadSchedulesServlet?id=${sessionScope.idTable}&type=6"
                                                    <c:if test="${sessionScope.typeDay == 6}">selected</c:if>>
                                                        Chủ nhật
                                                    </option>
                                            </select>

                                        </div>  


                                    </div>
                                </div>    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="time-table">
                                        <thead>
                                            <tr>
                                                <th>Ca / Ngày</th>
                                                <th>Thứ 2</th>
                                                <th>Thứ 3</th>
                                                <th>Thứ 4</th>
                                                <th>Thứ 5</th>
                                                <th>Thứ 6</th>
                                                <th>Thứ 7</th>
                                                <th>Chủ nhật</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Buổi sáng -->
                                            <tr>
                                                <td class="single-box time ">
                                                    <div class="inner-content text-center">
                                                        <span>08.00 - 12.00</span>
                                                        <p>am</p>
                                                    </div>
                                                </td>

                                            <c:forEach var="day" begin="0" end="6">
                                                <c:set var="hasSchedule" value="false" />
                                                <c:forEach items="${sessionScope.daoSchedules.schedules}" var="sch">
                                                    <c:if test="${sch.weekday == day && sch.startTime.hours == 8 
                                                                  && (sessionScope.idTable == 0 || sch.doctor.specialty.id == sessionScope.idTable)
                                                                  && (sessionScope.typeDay == -1 || sessionScope.typeDay == day)}">
                                                        <c:set var="hasSchedule" value="true" />
                                                    </c:if>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${hasSchedule}">
                                                        <c:set var="bgClass" value="bgclr-${(day%4)+1}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="bgClass" value="" />
                                                    </c:otherwise>
                                                </c:choose>

                                                <td class="single-box ${bgClass}">
                                                    <div class="inner-content text-center">
                                                        <c:forEach items="${sessionScope.daoSchedules.schedules}" var="sch">
                                                            <c:if test="${sch.weekday == day && sch.startTime.hours == 8 
                                                                          && (sessionScope.idTable == 0 || sch.doctor.specialty.id == sessionScope.idTable)
                                                                          && (sessionScope.typeDay == -1 || sessionScope.typeDay == day)}">
                                                                  <h5>${sch.doctor.specialty.specialtyName}</h5>
                                                                  <c:forEach items="${sessionScope.daoUser.user}" var="u">

                                                                      <c:if test="${u.id == sch.doctor.id}">
                                                                          <p>Bsi. ${u.fullname}</p>
                                                                      </c:if>
                                                                  </c:forEach>

                                                                  <h6 class="level">Năm kinh nghiệm: <span>${sch.doctor.yearsExp}</span></h6>
                                                                  <hr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                            </c:forEach>
                                        </tr>

                                        <!-- Buổi chiều -->
                                        <tr>
                                            <td class="single-box time ">
                                                <div class="inner-content text-center">
                                                    <span>13.00 - 17.00</span>
                                                    <p>pm</p>
                                                </div>
                                            </td>

                                            <c:forEach var="day" begin="0" end="6">
                                                <c:set var="hasSchedule" value="false" />
                                                <c:forEach items="${sessionScope.daoSchedules.schedules}" var="sch">
                                                    <c:if test="${sch.weekday == day && sch.startTime.hours == 13 
                                                                  && (sessionScope.idTable == 0 || sch.doctor.specialty.id == sessionScope.idTable)
                                                                  && (sessionScope.typeDay == -1 || sessionScope.typeDay == day)}">
                                                        <c:set var="hasSchedule" value="true" />
                                                    </c:if>
                                                </c:forEach>

                                                <c:choose>
                                                    <c:when test="${hasSchedule}">
                                                        <c:set var="bgClass" value="bgclr-${((day+1) % 4)+1}" />
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:set var="bgClass" value="" />
                                                    </c:otherwise>
                                                </c:choose>

                                                <td class="single-box ${bgClass}">
                                                    <div class="inner-content text-center">
                                                        <c:forEach items="${sessionScope.daoSchedules.schedules}" var="sch">
                                                            <c:if test="${sch.weekday == day && sch.startTime.hours == 13 
                                                                          && (sessionScope.idTable == 0 || sch.doctor.specialty.id == sessionScope.idTable)
                                                                          && (sessionScope.typeDay == -1 || sessionScope.typeDay == day)}">
                                                                  <h5>${sch.doctor.specialty.specialtyName}</h5>
                                                                  <c:forEach items="${sessionScope.daoUser.user}" var="u">
                                                                      <c:if test="${u.id == sch.doctor.id}">
                                                                          <p>Bsi. ${u.fullname}</p>
                                                                      </c:if>
                                                                  </c:forEach>


                                                                  <h6 class="level">Năm kinh nghiệm:<span> ${sch.doctor.yearsExp}</span></h6>
                                                                  <hr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                            </c:forEach>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--End time table area-->


            <%@ include file="../Footer/DefaultFooter.jsp" %>


        </div>
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="flaticon-triangle-inside-circle"></span></div>

        <!-- main jQuery -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <!-- Wow Script -->
        <script src="${pageContext.request.contextPath}/js/wow.js"></script>
        <!-- bootstrap -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- bx slider -->
        <script src="${pageContext.request.contextPath}/js/jquery.bxslider.min.js"></script>
        <!-- count to -->
        <script src="${pageContext.request.contextPath}/js/jquery.countTo.js"></script>
        <!-- owl carousel -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- validate -->
        <script src="${pageContext.request.contextPath}/js/validation.js"></script>
        <!-- mixit up -->
        <script src="${pageContext.request.contextPath}/js/jquery.mixitup.min.js"></script>
        <!-- easing -->
        <script src="${pageContext.request.contextPath}/js/jquery.easing.min.js"></script>
        <!-- gmap helper -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHzPSV2jshbjI8fqnC_C4L08ffnj5EN3A"></script>
        <!--gmap script-->
        <script src="${pageContext.request.contextPath}/js/gmaps.js"></script>
        <script src="${pageContext.request.contextPath}/js/map-helper.js"></script>
        <!-- fancy box -->
        <script src="${pageContext.request.contextPath}/js/jquery.fancybox.pack.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.appear.js"></script>
        <!-- isotope script-->
        <script src="${pageContext.request.contextPath}/js/isotope.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.prettyPhoto.js"></script> 
        <script src="${pageContext.request.contextPath}/js/jquery.bootstrap-touchspin.js"></script>
        <!-- jQuery timepicker js -->
        <script src="${pageContext.request.contextPath}/assets/timepicker/timePicker.js"></script>
        <!-- Bootstrap select picker js -->
        <script src="${pageContext.request.contextPath}/assets/bootstrap-sl-1.12.1/bootstrap-select.js"></script>                               
        <!-- Bootstrap bootstrap touchspin js -->
        <!-- jQuery ui js -->
        <script src="${pageContext.request.contextPath}/assets/jquery-ui-1.11.4/jquery-ui.js"></script>
        <!-- Language Switche  -->
        <script src="${pageContext.request.contextPath}/assets/language-switcher/jquery.polyglot.language.switcher.js"></script>
        <!-- Html 5 light box script-->
        <script src="${pageContext.request.contextPath}/assets/html5lightbox/html5lightbox.js"></script>


        <!-- revolution slider js -->
        <script src="${pageContext.request.contextPath}/assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- thm custom script -->
        <script src="${pageContext.request.contextPath}/js/custom.js"></script>
        <script>
                                            function scrollToMiddle(event, id) {
                                                event.preventDefault();
                                                const el = document.getElementById(id);
                                                if (el) {
                                                    el.scrollIntoView({
                                                        behavior: "smooth",
                                                        block: "center"
                                                    });
                                                }
                                            }
        </script>
    </body>
</html>
