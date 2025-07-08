<%-- 
    Document   : RegisterForm
    Created on : Jul 8, 2025, 12:48:24 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="auth-form">
            <h2>Đăng ký</h2>
            <form action="register" method="post">
                <label for="fullname">Họ và tên</label>
                <input type="text" name="fullname" id="fullname" required>

                <label for="username">Tên đăng nhập</label>
                <input type="text" name="username" id="username" required>

                <label for="email">Email</label>
                <input type="email" name="email" id="email" required>

                <label for="password">Mật khẩu</label>
                <input type="password" name="password" id="password" required>

                <label for="confirm">Xác nhận mật khẩu</label>
                <input type="password" name="confirm" id="confirm" required>

                <button type="submit">Đăng ký</button>

                <div class="link">
                    Đã có tài khoản? <a href="login.jsp">Đăng nhập</a>
                </div>
            </form>
        </div>
