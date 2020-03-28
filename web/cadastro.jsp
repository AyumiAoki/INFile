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
        <link rel="stylesheet" href="css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/fontawesome.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-6 mr-auto ml-auto mt-4 mb-4 border bg-white shadow rounded">
                <h5 class="mt-3 mb-3 text-center">Cadastro de usuário</h5>
                <form>
                    <div class="form-group mt-3">
                        <label for="exampleInputEmail1">Nome completo</label>
                        <input type="text" class="form-control" id="nome" aria-describedby="nome">
                    </div>
                    
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                        <small id="emailHelp" class="form-text text-muted">
                            Nunca compartilharemos seu email ou matrícula com mais ninguém.</small>
                    </div>
                    <div class="form-group mt-3">
                        <label for="exampleInputEmail1">Matrícula</label>
                        <input type="number" class="form-control" id="matricula" aria-describedby="matricula">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" id="exampleInputPassword1">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Aceitar termos</label>
                    </div>
                    <button type="submit" class="btn btn-success btn-block mb-3">Confirmar</button>
                </form>
                <div class="text-center mb-3">
                    <a class="text-dark">Já possui cadastro? <a href="login.jsp"> Clique aqui </a> </a>
                </div>
            </div>
            <div class="col-md-12 text-center mb-4">
                <a class="mr-4 text-dark" href="">Termos</a>
                <a class="mr-4 text-dark" href="">Privacidade</a>
                <a class="text-dark" href="">Segurança</a>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>


