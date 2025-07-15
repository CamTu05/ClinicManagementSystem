
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.RequestDispatcher" %>

<%
    
    if (session.getAttribute("daoSpecialty") == null||session.getAttribute("daoSchedules") == null ||
        session.getAttribute("daoDoctor") == null ||
        session.getAttribute("daoUser") == null) {
        RequestDispatcher rd = request.getRequestDispatcher("/LoadSpecialtyServlet");
        rd.include(request, response);
    }


%>



<%-- 
    Document   : HomePage
    Created on : Jul 7, 2025, 3:58:43 PM
    Author     : admin
--%>



<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>      
    </body>
</html>
