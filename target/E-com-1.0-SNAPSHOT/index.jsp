<%-- 
    Document   : index.jsp
    Created on : Jun 26, 2024, 2:28:23 AM
    Author     : kmush
--%>

<%@page import="com.e_com.sfactory.Helper"%>
<%@page import="com.e_com.entities.Category"%>
<%@page import="com.e_com.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.e_com.entities.Product"%>
<%@page import="com.e_com.dao.ProductDao"%>
<%@page import="com.e_com.sfactory.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%@include file ="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3 mx-2">
                <%                    String cat = request.getParameter("category");

                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;
                    if (cat == null || cat.trim().equalsIgnoreCase("all")) {
                        list = pdao.getAllProducts();
                    } else{
                        int cid = Integer.parseInt(cat.trim());
                        list = pdao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategories();
                %>

                <!--show categories--> 
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>

                    </div>
                    <%
                        for (Category category : clist) {
                    %>
                    <a href="index.jsp?category=<%= category.getCategoryid()%>" class="list-group-item list-group-item-action "><%= category.getCategoryTitle()%></a>




                    <%
                        }

                    %>

                </div>

                <!--show products--> 
                <div class="col-md-10">


                    <div class="row mt-4">
                        <!--column 12--> 

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--traversing products--> 
                                <% if (list != null) { %>
                                <%  for (Product product : list) {%>

                                <!--product card--> 
                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%=product.getpPhoto()%>" style="max-height: 180px; max-width: 100%; width: auto; " class="card-img-top m-2" alt="">

                                    </div>

                                    <div class="card-body">

                                        <h5 class="card-tittle"> <%=product.getpName()%> </h5>
                                        <p class="card-text">

                                            <%= Helper.get10Words(product.getpDesc())%>
                                        </p>
                                    </div>
                                    <div class="card-footer " >
                                        <button class=" btn btn-outline-success btn-sm mr-2 " onclick="add_to_cart(<%= product.getPid()%>, '<%= product.getpName()%>',<%= product.getPriceAfterDiscount()%>)">Add to Cart</button>
                                        <button class=" btn btn-outline-primary btn-sm "> &#8377;<%= product.getPriceAfterDiscount()%>/- <span class="text-secondary discount-label"> &#8377;<%= product.getpPrice()%>, <%=product.getpDiscount()%>%OFF  </span></button>
                                    </div>

                                </div>




                                <%
                                    }
                                    if (list.size() == 0) {
                                        out.println("<h1> No Item in this Category </h1>");
                                    }
                                %>
                                <% } else {%>
                                <h1> no products founds.</h1>
                                <!--//video 21--> 

                                <% }%>





                            </div>
                        </div>

                    </div>




                </div>
            </div>

        </div>
        <%@include file="components/common_modals.jsp" %>                   
    </body>
</html>
