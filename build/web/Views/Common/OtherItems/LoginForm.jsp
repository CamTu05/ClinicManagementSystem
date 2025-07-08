<%-- 
    Document   : LoginForm
    Created on : Jul 8, 2025, 12:45:07 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <div class="auth-form">
            <h2>Đăng nhập</h2>
            <form action="Login" method="post">
                <label for="username">Tên đăng nhập</label>
                <input type="text" name="username" id="username" required>

                <label for="password">Mật khẩu</label>
                <input type="password" name="password" id="password" required>

                <button type="submit">Đăng nhập</button>

                <div class="link">
                    Chưa có tài khoản? <a href="Register.jsp">Đăng ký</a>
                </div>
            </form>
        </div>
