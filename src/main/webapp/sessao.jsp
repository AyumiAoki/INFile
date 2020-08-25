<%-- 
    Document   : index
    Created on : 24/03/2020, 21:03:04
    Author     : ayumi
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Usuario"%>
<%@page import="model.bean.Projeto"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.AutorProjetoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>INFILE</title>
    </head>
    <jsp:include page="head.jsp"/>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-12 mx-auto py-4 px-4 bg-white shadow rounded">
                <div class="px-4 py-3 text-center">  
                    <img src="https://i.pinimg.com/originals/5d/35/e3/5d35e39988e3a183bdc3a9d2570d20a9.gif" style="width: 20rem">
                    <h5>Sua sessão expirou,  <a href="login.jsp">clique aqui</a> para fazer login.</h5>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>

