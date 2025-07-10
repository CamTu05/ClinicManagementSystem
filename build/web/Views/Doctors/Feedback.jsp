<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <style>
            #flip{
                transform: scaleX(-1);
                transform-origin: center;
            }

            /* Ẩn các nút radio */
            .rating input[type="radio"] {
                display: none;
            }

            /* Thiết lập kiểu cho các ngôi sao */
            .rating label {
                font-size: 24px;
                cursor: pointer;
                color: #ccc; /* Màu mặc định */
                transition: color 0.3s ease;
            }

            /* Khi hover hoặc chọn ngôi sao */
            .rating label:hover,
            .rating input[type="radio"]:checked + label,
            .rating input[type="radio"]:checked + label + label,
            .rating input[type="radio"]:checked + label + label + label,
            .rating input[type="radio"]:checked + label + label + label + label,
            .rating input[type="radio"]:checked ~ label {
                color: #ff9800; /* Màu vàng khi chọn */
            }

            /* Đảm bảo rằng các ngôi sao trước ngôi sao đã chọn sáng lên */
            .rating input[type="radio"]:checked ~ label {
                color: #ff9800;
            }
        </style>
        <meta charset="UTF-8">
        <title>Feedback Form</title>

        <!-- Responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- master stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    </head>
    <body>
        <div style="padding-bottom: 20px;">
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>
        </div>

        <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px; color: #333; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);">Feedback Form</h2>

        <form action="DoctorFeedbackServlet" method="POST" enctype="multipart/form-data" style="max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f9f9f9; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);" onsubmit="return validateForm(event)">
            <label for="doctor" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px; display: inline-block;">Choose Doctor:</label>
            <select id="doctorId" name="doctorId" required style="width: 100%; padding: 8px; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;">
                <c:forEach var="d" items="${doctorList}" varStatus="status">
                    <option value="${d.id}">${doctorName[status.index]}</option>
                </c:forEach>
            </select>

            <!-- Name and Age (same row) -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                <div style="flex: 1; padding-right: 10px;">
                    <label style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Your Name:</label>
                    <input type="text" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
                <div style="flex: 1; padding-left: 10px;">
                    <label style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Your Age:</label>
                    <input type="number" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
            </div>

            <!-- Phone and Email (same row) -->
            <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
                <div style="flex: 1; padding-right: 10px;">
                    <label style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Your Phone Number:</label>
                    <input type="tel" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
                <div style="flex: 1; padding-left: 10px;">
                    <label style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Your Email:</label>
                    <input type="email" required style="width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;" />
                </div>
            </div>

            <!-- Feedback Text -->
            <label for="feedback" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Your Feedback:</label><br>
            <textarea id="feedback" name="feedback" rows="4" cols="50" placeholder="Write your feedback here..." required style="width: 100%; padding: 8px; margin-bottom: 15px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box;"></textarea>

            <!-- Rating -->
            <label for="rating" style="font-weight: bold; font-size: 16px; color: #555; margin-bottom: 5px;">Rating:</label>
            <div id="flip" class="rating" style="display: flex; justify-content: space-between; width: 150px; margin-bottom: 15px;">
                <input type="radio" id="star1" name="rating" value="1" />
                <label for="star1">☆</label>

                <input type="radio" id="star2" name="rating" value="2" />
                <label for="star2">☆</label>

                <input type="radio" id="star3" name="rating" value="3" />
                <label for="star3">☆</label>

                <input type="radio" id="star4" name="rating" value="4" />
                <label for="star4">☆</label>

                <input type="radio" id="star5" name="rating" value="5" />
                <label for="star5">☆</label>
            </div>

            <!-- Submit Button -->
            <input type="submit" value="Submit Feedback" style="background-color: #4CAF50; color: white; border: none; padding: 12px 20px; font-size: 16px; border-radius: 5px; cursor: pointer; width: 100%; transition: background-color 0.3s;" />
        </form>

        <script>
            function validateForm(event) {
                const doctor = document.getElementById("doctorId").value;
                const name = document.getElementById("name").value;
                const age = document.getElementById("age").value;
                const phone = document.getElementById("phone").value;
                const email = document.getElementById("email").value;
                const feedback = document.getElementById("feedback").value;
                const rating = document.querySelector('input[name="rating"]:checked');

                if (!doctor || !name || !age || !phone || !email || !feedback || !rating) {
                    alert("Please fill in all fields!");
                    event.preventDefault();  // Ngừng gửi form khi có lỗi
                    return false;
                }

                if (isNaN(age) || age <= 0) {
                    alert("Please enter a valid age greater than 0!");
                    event.preventDefault();  // Ngừng gửi form khi có lỗi
                    return false;
                }

                const phonePattern = /^[0-9]+$/;
                if (!phonePattern.test(phone)) {
                    alert("Phone number must be a valid number!");
                    event.preventDefault();  // Ngừng gửi form khi có lỗi
                    return false;
                }

                return true;  // Cho phép gửi form nếu tất cả hợp lệ
            }
        </script>

        <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>

    </body>
</html>
