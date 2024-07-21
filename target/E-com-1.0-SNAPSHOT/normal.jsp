<%-- 
    Document   : normal
    Created on : Jul 5, 2024, 1:31:05 AM
    Author     : kmush
--%>

<%@page import="com.e_com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUsertype().equals("admin")) {
            session.setAttribute("message", "You are not normal User ! Do not access this page");
            response.sendRedirect("login.jsp");
            return;
        }

    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Normal Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%--<%@include file="components/navbar.jsp" %>--%>
        <!--<h1>normal user page</h1>-->
        <jsp:include page="index.jsp" />
        <h2>hello</h2>
        <!--common modal check out--> 

        <%@include file="components/common_modals.jsp" %>

    </body>
</html>
