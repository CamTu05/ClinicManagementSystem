<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Feedback Form</title>

        <!-- Responsive meta -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- master stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- Responsive stylesheet -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
        <style>
            /* Form container */
            form {
                max-width: 600px;
                margin: 0 auto;
                padding: 20px;
                background-color: #f9f9f9;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* Label style */
            form label {
                font-weight: bold;
                font-size: 16px;
                color: #555;
                margin-bottom: 5px;
                display: inline-block;
            }

            /* Input, select, and textarea styles */
            form input, form select, form textarea {
                width: 100%;
                padding: 8px;
                margin-bottom: 15px;
                border-radius: 5px;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Feedback textarea */
            form textarea {
                height: 120px;
            }

            /* Flexbox styling for rows (Name & Age, Phone & Email) */
            form .flex-row {
                display: flex;
                justify-content: space-between;
                margin-bottom: 15px;
            }

            /* Flex items (left and right columns) */
            form .flex-row > div {
                flex: 1;
                padding-right: 10px;
            }

            /* Remove the padding-right for the last item */
            form .flex-row > div:last-child {
                padding-left: 10px;
            }

            /* Submit button */
            form input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                padding: 12px 20px;
                font-size: 16px;
                border-radius: 5px;
                cursor: pointer;
                width: 100%;
                transition: background-color 0.3s;
            }

            /* Submit button hover effect */
            form input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div style="padding-bottom: 20px;">
            <%@ include file="/Views/Common/Header/DefaultHeader.jsp" %>
            <%@ include file="/Views/Common/Navbar/DefaultNavbar.jsp" %>
        </div>

        <h2 style="text-align: center; font-size: 24px; margin-bottom: 20px; color: #333; text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);">Feedback Form</h2>

        <form action="DoctorFeedbackServlet" method="POST">
            <select id="doctorId" name="doctorId" required>
                <c:forEach var="d" items="${doctorList}" varStatus="status">
                    <option value="${d.id}">${doctorName[status.index]}</option>
                </c:forEach>
            </select>

            <!-- Name and Age (same row) -->
            <div class="flex-row">
                <div>
                    <label>Your Name:</label>
                    <!-- ★ required -->
                    <input type="text" name="fullName" required />
                </div>
                <div>
                    <label>Your Age:</label>
                    <input type="number" name="age" min="0" max="120" required />
                </div>
            </div>

            <!-- Phone and Email (same row) -->
            <div class="flex-row">
                <div>
                    <label>Your Phone Number:</label>
                    <!-- ★ required + pattern mẫu số VN (tuỳ chỉnh) -->
                    <input type="tel" name="phone"
                           pattern="0[0-9]{9,10}" 
                           title="Số điện thoại bắt đầu bằng 0 và dài 10-11 chữ số"
                           required />
                </div>
                <div>
                    <label>Your Email:</label>
                    <!-- ★ required -->
                    <input type="email" name="email" required />
                </div>
            </div>

            <!-- Feedback Text -->
            <label for="feedback">Your Feedback:</label><br>
            <!-- ★ required đã có -->
            <textarea id="feedback" name="feedback" rows="4"
                      placeholder="Write your feedback here..." required></textarea>

            <!-- Rating -->
            <label for="rating">Rating:</label>
            <!-- ★ required -->
            <select id="rating" name="rating" required>
                <option value="" disabled selected>Select rating</option>
                <option value="1">1 Star</option>
                <option value="2">2 Stars</option>
                <option value="3">3 Stars</option>
                <option value="4">4 Stars</option>
                <option value="5">5 Stars</option>
            </select>

            <input type="submit" value="Submit Feedback" />
        </form>


        <%@ include file="/Views/Common/Footer/DefaultFooter.jsp" %>

    </body>
</html>
