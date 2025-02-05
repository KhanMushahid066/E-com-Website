<%-- 
    Document   : login
    Created on : Jul 2, 2024, 4:12:57 PM
    Author     : kmush
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mt-5">
            <div class="row ">
                <div class="col-md-6 offset-md-3">

                    <div class="card mt-3">

                        <div class="card-header custom-bg text-center text-white">
                            <h3>Login Here</h3>
                        </div>

                        <div class="card-body">
                            <%@include file="components/message.jsp" %>
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                   
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp" class="text-center d-block mb-3" >if not registered click here </a>
                                <div class="container text-center">
                                    
                                    <button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
                                    <button type="reset" class="btn btn-primary custom-bg border-0 ">Reset</button>
                                    
                                </div>
                                
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div.container>



</body>
</html>
