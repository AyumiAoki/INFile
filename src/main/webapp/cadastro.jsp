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
            <div class="col-md-6 mr-auto ml-auto mt-4 mb-4 border bg-white shadow rounded">
                <h5 class="mt-3 mb-3 text-center">Cadastro de usuário</h5>
                <form method="post"  action="/infile/UsuarioServlet" class="needs-validation" novalidate>
                    <div class="form-group mt-3">
                        <label for="">Nome completo</label>
                        <input type="text" class="form-control" id="nome" aria-describedby="nome" id="nome" name="nome" required="">
                    </div>

                    <div class="form-group">
                        <label for="">Email</label>
                        <input type="email" class="form-control" id="email" aria-describedby="emailHelp" name="email" required="">
                        <div class="invalid-feedback">Email já cadastrado ou inválido.</div>
                        <small id="emailHelp" class="form-text text-muted">
                            Nunca compartilharemos seu email ou matrícula com mais ninguém.</small>
                    </div>
                    <div class="form-group mt-3">
                        <label for="">Matrícula</label>
                        <input type="number" class="form-control" id="matricula" name="matricula" aria-describedby="matricula" required="">
                        <div class="invalid-feedback">Matrícula já cadastrada ou inválido.</div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha" required="">
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                        <label class="form-check-label" for="exampleCheck1">Aceitar termos</label>
                        <div class="invalid-feedback">Você deve concordar antes de enviar.</div>
                    </div>
                    <button type="submit"  name="status" id="status" value="cadastrar" class="btn btn-success btn-block mb-3">Confirmar</button>
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
        <script src="js/validation.js"></script>
        <!--erro-->
        <%
            if (request.getQueryString() != null) {
                if (request.getParameter("status").equals("erro")) {
        %>
        <script>  
            window.onload = function () {
                var btn = document.getElementById("status");
                btn.click();
            };
        </script>
        <%
                }
            }
        %>
        <jsp:include page="footer.jsp"/>
    </body>
</html>


