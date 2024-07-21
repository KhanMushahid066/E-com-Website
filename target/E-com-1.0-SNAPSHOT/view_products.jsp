<%-- 
    Document   : view_products
    Created on : Jul 19, 2024, 3:52:02 PM
    Author     : kmush
--%>
<%@page import="com.e_com.entities.User"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("normal")) {
            session.setAttribute("message", "You are not Admin ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel products</title>
        <%@include file="components/common_css_js.jsp" %>
        <style >

            body{
                background: #cbefcd;
            }
        </style>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Hello World!</h1>
        
        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
