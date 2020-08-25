<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : ayumi
--%>

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
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <h4 class="mb-4">Títulos</h4>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Digite aqui..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button">Buscar</button>
                    </div>
                </div>
                <table class="table table-hover table-bordered">
                    <thead>
                        <tr>
                            <th scope="col">Nome</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Adopetes</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">Big Paper: Sistema de controle de estoque</a></td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">Book Store: Sistema de controle de biblioteca</a></td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">CHS Sports: Um gerenciador de campeonatos espostivos amadores</a></td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">Rivail linhas aereas: Sistema de controle de registro de ponto de funcionários</a></td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">Royale Cars: Sistema de controle carros</a></td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutraPublicacao.jsp">Stars of Tomorrow</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


