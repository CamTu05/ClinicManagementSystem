<%-- 
    Document   : LanTT
    Created on : Jul 10, 2025, 2:00:02 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>



<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Doctors || Hospitals || Responsive HTML 5 Template</title>

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

        <link rel="stylesheet" href="css/doctorStyle.css"/>

        <style>
            .rating {
                display: inline-flex;
                flex-direction: row-reverse;       /* Đảo ngược để dùng selector ~ */
                gap: .4rem;
            }
            .rating input {
                display: none;                     /* Ẩn radio góc nhìn */
            }

            /* ---------- VẼ SAO ---------- */
            .rating label {
                font-size: 2.2rem;                 /* Kích thước sao */
                color: #ccc;                       /* Màu sao rỗng */
                cursor: pointer;
                transition: transform .15s;
            }

            /* Sao đã CHỌN */
            .rating input:checked ~ label,
            .rating label:hover,
            .rating label:hover ~ label {
                color: #ffb703;                    /* Màu sao sáng */
            }

            /* Hiệu ứng khi hover */
            .rating label:hover {
                transform: scale(1.15);
            }
        </style>

        <!-- Fixing Internet Explorer-->
        <!--[if lt IE 9]>
            <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
            <script src="js/html5shiv.js"></script>
        <![endif]-->
    </head>

    <body style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;">
        <c:if test="${not empty message}">
            <script>alert("${fn:escapeXml(message)}");</script>
        </c:if>

        <div class="layout-bar">
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>
        </div>
        <br/>

        <!-- CARD -->
        <section class="card">
            <div class="doctor-info">
                <img src="${pageContext.request.contextPath}/images/team/${d.picture}" alt="Ảnh bác sĩ">
                <div>
                    <div class="doctor-name">${d.fullName}</div>
                    <p class="doctor-meta"><strong>Chuyên khoa:</strong> ${d.specialtyName}</p>
                    <p class="doctor-meta"><strong>Kinh nghiệm:</strong> ${d.yearsExperience}</p>
                    <p class="doctor-meta"><strong>Email:</strong> ${d.email}</p>


                    <div class="rating">
                        <span class="stars" style="--rating: 4.0;"></span>
                        <span style="color: #f5b50a;">&#9733;</span>
                        Rating: ${d.avgRating}/5
                    </div>

                    <div class="schedule">${d.schedule}</div>
                </div>
            </div>

            <div class="feedback-form">
                <br/>
                <h3>Gửi phản hồi của bạn</h3>
                <form action="DoctorIndividualServlet" method="post">
                    <input type="hidden" name="DoctorId" value="${d.doctorId}">

                    <!-- Comment -->
                    <textarea name="comment" placeholder="Nhập phản hồi của bạn..." required></textarea>

                    <div class="rating">
                        <!-- Lưu ý: value càng lớn ở bên trái nhờ flex-direction: row-reverse -->
                        <input type="radio" id="star5" name="rating" value="5" />
                        <label for="star5" title="Tuyệt vời">★</label>

                        <input type="radio" id="star4" name="rating" value="4" />
                        <label for="star4" title="Tốt">★</label>

                        <input type="radio" id="star3" name="rating" value="3" />
                        <label for="star3" title="Bình thường">★</label>

                        <input type="radio" id="star2" name="rating" value="2" />
                        <label for="star2" title="Kém">★</label>

                        <input type="radio" id="star1" name="rating" value="1" />
                        <label for="star1" title="Tệ">★</label>
                    </div>
                    <br/>
                    <button type="submit" name="btnSubmit" value="oke">Gửi phản hồi</button>
                </form>
            </div>

            <div class="feedback-list">
                <br/>
                <h3>Phản hồi từ bệnh nhân</h3>
                <c:forEach var="f" items="${feedbacks}">
                    <div class="feedback-item">
                        <div class="feedback-header">
                            <div class="avatar">${f.initial}</div>
                            <span class="author">${f.patient_name}</span>
                            <span class="date">${f.feedback_date}</span>
                        </div>
                        <div class="feedback-content">
                            ${f.comment}
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <!-- Phone -->
        <div class="phone-bar">
            <div class="phone-icon">☎</div>
            <div class="phone-number">${d.phone}</div>
        </div>

        <div class="layout-bar">
            <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>
        </div>
        <!--Scroll to top-->
        <div class="scroll-to-top scroll-to-target" data-target="html"><span class="flaticon-triangle-inside-circle"></span></div>

        <!-- main jQuery -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- Wow Script -->
        <script src="js/wow.js"></script>
        <!-- bootstrap -->
        <script src="js/bootstrap.min.js"></script>
        <!-- bx slider -->
        <script src="js/jquery.bxslider.min.js"></script>
        <!-- count to -->
        <script src="js/jquery.countTo.js"></script>
        <!-- owl carousel -->
        <script src="js/owl.carousel.min.js"></script>
        <!-- validate -->
        <script src="js/validation.js"></script>
        <!-- mixit up -->
        <script src="js/jquery.mixitup.min.js"></script>
        <!-- easing -->
        <script src="js/jquery.easing.min.js"></script>
        <!-- gmap helper -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAHzPSV2jshbjI8fqnC_C4L08ffnj5EN3A"></script>
        <!--gmap script-->
        <script src="js/gmaps.js"></script>
        <script src="js/map-helper.js"></script>
        <!-- fancy box -->
        <script src="js/jquery.fancybox.pack.js"></script>
        <script src="js/jquery.appear.js"></script>
        <!-- isotope script-->
        <script src="js/isotope.js"></script>
        <script src="js/jquery.prettyPhoto.js"></script> 
        <script src="js/jquery.bootstrap-touchspin.js"></script>
        <!-- jQuery timepicker js -->
        <script src="assets/timepicker/timePicker.js"></script>
        <!-- Bootstrap select picker js -->
        <script src="assets/bootstrap-sl-1.12.1/bootstrap-select.js"></script>                               
        <!-- Bootstrap bootstrap touchspin js -->
        <!-- jQuery ui js -->
        <script src="assets/jquery-ui-1.11.4/jquery-ui.js"></script>
        <!-- Language Switche  -->
        <script src="assets/language-switcher/jquery.polyglot.language.switcher.js"></script>
        <!-- Html 5 light box script-->
        <script src="assets/html5lightbox/html5lightbox.js"></script>


        <!-- revolution slider js -->
        <script src="assets/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="assets/revolution/js/jquery.themepunch.revolution.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.actions.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.migration.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
        <script src="assets/revolution/js/extensions/revolution.extension.video.min.js"></script>

        <!-- thm custom script -->
        <script src="js/custom.js"></script>
    </body>
</html>
