<%-- 
    Document   : Login
    Created on : Jul 7, 2025, 3:29:05 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap&subset=vietnamese" rel="stylesheet">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
                font-family: 'Roboto', sans-serif;
            }

            body {
                background: #f0f2f5;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .auth-form {
                background: #fff;
                padding: 30px;
                border-radius: 12px;
                box-shadow: 0 4px 20px rgba(0,0,0,0.1);
                width: 100%;
                max-width: 400px;
            }

            .auth-form h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .auth-form label {
                display: block;
                margin: 10px 0 5px;
                color: #555;
                font-weight: 500;
            }

            .auth-form input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 8px;
                margin-bottom: 15px;
                transition: 0.3s;
            }

            .auth-form input:focus {
                border-color: #007bff;
                outline: none;
            }

            .auth-form button {
                width: 100%;
                padding: 10px;
                background: #007bff;
                color: white;
                border: none;
                border-radius: 8px;
                font-weight: bold;
                transition: 0.3s;
            }

            .auth-form button:hover {
                background: #0056b3;
                cursor: pointer;
            }

            .auth-form .link {
                text-align: center;
                margin-top: 15px;
            }

            .auth-form .link a {
                color: #007bff;
                text-decoration: none;
            }

            .auth-form .link a:hover {
                text-decoration: underline;
            }
        </style>

    </head>
    <body>

        <%@ include file="Common/OtherItems/LoginForm.jsp" %>

    </body>
</html>
