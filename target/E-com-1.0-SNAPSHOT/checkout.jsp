<%-- 
    Document   : checkout
    Created on : Jul 19, 2024, 5:58:34 AM
    Author     : kmush
--%>

<%
    User user = (User) session.getAttribute("current_user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! login first to access checkoout page ");
        response.sendRedirect("login.jsp");
        return;
    }


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container">

            <div class="row mt-4">

                <div class="col-md-6">
                    <!--cart--card-->

                    <div class="card">
                        <h3 class="text-center mt-3">Your Selected Item </h3>
                        <div class="card-body">

                            <div class="cart-body">


                            </div>


                        </div>

                    </div>



                </div>



                <div class="col-md-6">
                    <div class="card">
                        <h3 class="text-center mt-3">Your Details for order </h3>
                        <div class="card-body">

                            <form action="#!">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter name">
                                </div>
                                
                                  <div class="form-group">
                                    <label for="phoneno">Your Contact</label>
                                    <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="phoneno" aria-describedby="emailHelp" placeholder="Enter Contact Number">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
                                    <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3"  placeholder="Enter Your Address "></textarea>
                                </div>
                                
                                
                                
                                <div class="container text-center">

                                    <button class="btn btn-outline-success">Order Now</button>
                                    <button class="btn btn-outline-primary">Continue Shopping</button>
                                </div>

                            </form>



                        </div>

                    </div>


                </div>


            </div>


        </div>



        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
