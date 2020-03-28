<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>INFILE</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/fontawesome.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <h4 class="mb-4">Autores</h4>
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
                            <th scope="col">Turma</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Affonso Henrique Ruiz Jurema</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Aline Alves Cunegundes</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">André Airton Samuel Pereira</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Ayumi Aoki Santana</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Carlos Felipe Souza</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Cecilia do Nascimento Oliveira</a></td>
                            <td>INF31A</td>
                        </tr>
                        <tr>
                            <td><a class="text-dark" href="verOutroPerfil.jsp">Dirley Edmar Oliveira Lima</a></td>
                            <td>INF31A</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


