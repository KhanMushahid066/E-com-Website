<%-- 
    Document   : registersp
    Created on : Jul 2, 2024, 4:12:42 PM
    Author     : kmush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> 
        <div class="container-fluid">

            <div class="container mt-2">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            
                             <%@include file="components/message.jsp" %>
                             
                             
                            <div class="card-body">
                               
                                <div class="container text-center">
                                    <img src="img/user-icon.png" style="max-width: 100px;" class="img-fuild" alt="">
                                </div>
                                <h3 class="text-center">  Sign Up Here </h3>
                                <form action="RegisterServlet" method="post">
                                    <div class="form-group">
                                        <label for="name">User Name</label>
                                        <input type="text" name="user_name" class="form-control form-control-sm" id="name" placeholder="Enter Username">
                                    </div>
                                    <div class="form-group">
                                        <label for="email">User Email</label>
                                        <input type="email" name="user_email" class="form-control form-control-sm" id="email" placeholder="Enter Email">
                                    </div>
                                    <div class="form-group">
                                        <label for="password">User Password</label>
                                        <input type="password" name="user_pass" class="form-control form-control-sm" id="password" placeholder="Enter Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="phone">User Phone</label>
                                        <input type="tel" name="user_tel" class="form-control form-control-sm" id="phone" placeholder="Enter Phone Number">
                                    </div>
                                    <div class="form-group">
                                        <label for="address">User Address</label>
                                        <textarea name="user_address" class="form-control form-control-sm" rows="3" placeholder="Enter Address"></textarea>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-outline-success btn-sm mr-2">Register</button>
                                        <button type="reset" class="btn btn-outline-primary btn-sm">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
