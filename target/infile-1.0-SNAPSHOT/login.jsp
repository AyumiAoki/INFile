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
                <h5 class="mt-3 mb-3 text-center">Acesse sua conta</h5>
                <form method="post" action="/infile/UsuarioServlet" class="needs-validation" novalidate>
                    <div class="form-group mt-3">
                        <label for="">Email ou Matrícula</label>
                        <input type="text" class="form-control" id="email" name="email" aria-describedby="emailHelp" required>
                        <div class="invalid-feedback">Email ou Matrícula inválido.</div>
                        <small id="emailHelp" class="form-text text-muted">
                            Nunca compartilharemos seu email ou matrícula com mais ninguém.</small> 
                    </div>
                    <div class="form-group">
                        <label for="">Senha</label>
                        <input type="password" class="form-control" id="senha" name="senha" required>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1">
                        <label class="form-check-label" for="exampleCheck1">Mantenha-me conectado</label>
                    </div>
                    <button type="submit" name="status" value="login" id="status" class="btn btn-success btn-block mb-3">Entrar</button>
                </form>
                <div class="text-center mb-3">
                    <a class="text-dark">Ainda não tem cadastro? <a href="cadastro.jsp"> Clique aqui </a> </a>
                </div>
            </div>
            <div class="col-md-12 text-center mb-4">
                <a class="mr-4 text-dark" href="">Termos</a>
                <a class="mr-4 text-dark" href="">Privacidade</a>
                <a class="text-dark" href="">Segurança</a>
            </div>
            <script src="js/validation.js"></script>
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
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>


