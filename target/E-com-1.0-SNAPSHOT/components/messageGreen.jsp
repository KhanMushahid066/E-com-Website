<%-- 
    Document   : messageGreen
    Created on : Jul 12, 2024, 4:54:39 PM
    Author     : kmush
--%>

<%
    String message = (String) session.getAttribute("messageGreen");
    if (message != null) {

        //prit
        //out.println(message);
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
    <strong><%= message %></strong> 
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div> 
<%
        session.removeAttribute("messageGreen");
    }

%>