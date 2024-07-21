<%-- 
    Document   : admin
    Created on : Jul 5, 2024, 1:30:37 AM
    Author     : kmush
--%>

<%@page import="java.util.Map"%>
<%@page import="com.e_com.sfactory.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.e_com.entities.Category"%>
<%@page import="com.e_com.sfactory.FactoryProvider"%>
<%@page import="com.e_com.dao.CategoryDao"%>
<%@page import="com.e_com.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

<%CategoryDao ctdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = ctdao.getCategories();

//getting count of user / product
    Map<String, Long> map = Helper.getCounts(FactoryProvider.getFactory());


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin panel</title>
        <%@include file="components/common_css_js.jsp" %>
        <style >

            body{
                background: #cbefcd;
            }
        </style>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container-fluid mt-2">
            <%@include file="components/messageGreen.jsp" %>


        </div>


        <div class="container admin">
            <!--first row--> 
            <div class="row mt-3">

                <!--first column-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card p-2" data-toggle="tooltip" data-placement="top" title="Numbers of users on this website">

                        <div class="card-body text-center">


                            <div class="container p-2 ">

                                <img  style="max-width: 97.5px"  class="img-fuild rounded-circle" src="img/users.png" alt="user">

                            </div>

                            <h3><%= map.get("userCount")%></h3>
                            <h3 class="text-uppercase text-muted">users</h3>
                        </div>
                    </div>
                </div>

                <!--second column-->
                <div class="col-md-4">

                    <!--second box-->
                    <div class="card p-2" data-toggle="tooltip" data-placement="top" title="Numbers of categories on this website">

                        <div class="card-body text-center">
                            <div class="container p-2  ">

                                <img  style="max-width: 97.5px"  class="img-fuild " src="img/categories.png" alt="user">

                            </div>

                            <h3><%= list.size()%></h3>
                            <h3 class="text-uppercase text-muted">categories</h3>
                        </div>
                    </div>


                </div>

                <!--third column-->
                <div class="col-md-4">

                    <!--Third box-->
                    <div class="card p-2" data-toggle="tooltip" data-placement="top" title="Numbers of products on this website">

                        <div class="card-body text-center">

                            <div class="container p-2 ">

                                <img  style="max-width: 97.5px"  class="img-fuild " src="img/products.png" alt="user">

                            </div>
                            <h3><%= map.get("productCount")%></h3>
                            <h3 class="text-uppercase text-muted">products</h3>
                        </div>
                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-2">


                <!--second row first column-->
                <div class="col-md-6">

                    <div class="card p-2" data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center ">

                            <div class="container p-2  ">

                                <img  style="max-width: 97.5px"  class="img-fuild rounded-circle" src="img/add products.png" alt="user">

                            </div>
                            <p class="mt-2">Click here to add new category </p>
                            <h3 class="text-uppercase text-muted"> Add categories</h3>
                        </div>
                    </div>   
                </div>

                <!--second row second column-->

                <div class="col-md-6">

                    <div class="card p-2" >

                        <div class="card-body text-center">

                            <div class="container p-2 ">

                                <img  style="max-width: 97.5px"  class="img-fuild rounded-circle " src="img/add categories.png" alt="user">

                            </div>
                            <p class="mt-2">Click here to add new category </p>
                            <h3 class="text-uppercase text-muted">Add products</h3
                        </div>
                    </div>   
                </div>

            </div>


        </div>

        <!--view products third row -->
        <div class="row mt-2">

            <div class="col-md-12">

                <div onclick="window.location = 'view_products.jsp'" class="card p-2" data-toggle="tooltip" data-placement="top" title="View All Products ">

                    <div class="card-body text-center ">

                        <div class="container p-2  ">
                            <img  style="max-width: 97.5px"  class="img-fuild rounded-circle" src="img/view.png" alt="user">
                        </div>
                        <p class="mt-2 text-primary">Click here to view All products </p>
                        <h3 class="text-uppercase text-muted"> View Products </h3>
                    </div>
                </div>   
            </div>
        </div>



        <!--end third row--> 

        <!--add category modal--> 
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">


                        <form action="ProuctOperationServlet"method="post">


                            <input type="hidden" name="operation" value="addcategory" />



                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter category tittle" required />
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success"> Add category</button>
                                <button type="button" class="btn btn-secondary btn-outline-danger" data-dismiss="modal">Close</button>

                            </div>


                        </form>


                    </div>

                </div>
            </div>
        </div>
        <!--end category modal--> 



        <!--add product modal--> 
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--second  form-->
                        <form action="ProuctOperationServlet" method="post" enctype="multipart/form-data">

                            <input type="hidden" name="operation" value="addproduct" />


                            <!--product tittle--> 
                            <div class="form-group">
                                <input class="form-control" type="text"  placeholder="Enter Product Name" name="pName" required>
                            </div>

                            <!--product description--> 
                            <div class="form-group">
                                <textarea style="height: 150px" class="form-control"placeholder="Enter Product description" name="pDesc" required></textarea>
                            </div>
                            <!--product price--> 
                            <div class="form-group">

                                <input class="form-control" type="number" placeholder="Enter product price" name="pPrice"  required>
                            </div>
                            <!--product discount--> 
                            <div class="form-group">

                                <input class="form-control" type="number" placeholder="Enter product discount" name="pDiscount" required>
                            </div>


                            <!--product quantity--> 
                            <div class="form-group">

                                <input class="form-control" type="number" placeholder="Enter product quantity" name="pQuantity" required>
                            </div>




                            <!--product category--> 

                            <div class="form-group">                       
                                <select name="catId" class="form-control" id="">
                                    <% for (Category c : list) {%>

                                    <option value="<%= c.getCategoryid()%>"> <%= c.getCategoryTitle()%> </option>                           


                                    <% }%> 

                                </select>
                            </div>

                            <div class="form-group">

                                <div class="custom-file">
                                    <input type="file" class="custom-file-input"  name="pPic" aria-describedby="inputGroupFileAddon">
                                    <label class="custom-file-label" for="productImage">Choose file</label>
                                </div>
                            </div>

                            <!--button--> 
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Close</button>
                            </div>


                        </form>

                        <!--end form --> 


                    </div>

                </div>
            </div>
        </div>
        <!--end product -->

        <!--common modal check out--> 

        <%@include file="components/common_modals.jsp" %>
        <script>
            $(function () {
                $('[data-toggle="tooltip"]').tooltip()
            })
        </script>
    </body>
</html>




