<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : ayumi
--%>

<%@page import="java.util.List"%>
<%@page import="model.bean.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>
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
                <h4 class="mb-4">Autores</h4>
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-search"></i></span>
                    </div>
                    <input type="text" id="search" class="form-control" placeholder="Digite aqui...">
                </div>
                <table class="table table-hover border table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Nome</th>
                            <th scope="col">Matrícula</th>
                            <th scope="col">Email</th>
                        </tr>
                    </thead>
                    <tbody id='minhaTabela'>
                        <%
                            UsuarioDAO dao = new UsuarioDAO();
                            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
                            List<Usuario> users = dao.getUsers(u.getMatricula());
                            for (Usuario user : users) {
                        %>
                        <tr>
                            <td><%= user.getNome()%> </td>
                            <td><%= user.getMatricula()%></td>
                            <td><%= user.getEmail()%></td>
                            <td hidden=""><%= user.getId()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <%
                    if (users.size() == 0) {
                %>
                <div class="mb-3">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        Nenhum usuário cadastrado.
                    </div>
                </div>
                <% }%>
                <div class="text-center">
                    <div class="spinner-border text-success" id="load" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $('#load').hide();

            var tabela = document.getElementById("minhaTabela");
            var linhas = tabela.getElementsByTagName("tr");

            for (var i = 0; i < linhas.length; i++) {
                var linha = linhas[i];
                linha.addEventListener("click", function () {
                    //Adicionar ao atual
                    selLinha(this, false); //Selecione apenas um
                    //selLinha(this, true); //Selecione quantos quiser
                });
            }

            var matricula = "";
            var nome = "";
            /**
             Caso passe true, você pode selecionar multiplas linhas.
             Caso passe false, você só pode selecionar uma linha por vez.
             **/
            function selLinha(linha, multiplos) {
                if (!multiplos) {
                    var linhas = linha.parentElement.getElementsByTagName("tr");
                    for (var i = 0; i < linhas.length; i++) {
                        var linha_ = linhas[i];
                        linha_.classList.remove("selecionado");
                    }
                }
                linha.classList.toggle("selecionado");
                var selecionados = tabela.getElementsByClassName("selecionado");
                //Verificar se eestá selecionado
                if (selecionados.length < 1) {
                    alert("Selecione pelo menos uma linha");
                    return false;
                }

                matricula = "";
                nome = "";

                for (var i = 0; i < selecionados.length; i++) {
                    var selecionado = selecionados[i];
                    selecionado = selecionado.getElementsByTagName("td");
                    nome += selecionado[3].innerHTML;
                    matricula += selecionado[1].innerHTML;
                }
                window.location.href = "perfil.jsp?userId=" + nome;
            }

            //search bar
            $(document).ready(function () {
                $("#search").on("keyup", function () {
                    Daley();
                    var value = $(this).val().toLowerCase();
                    $("#minhaTabela tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
                    });
                });
            });

            function Daley() {
                $('#load').show();
                $('#minhaTabela').hide();
                $('#load').delay("slow").fadeOut();
                $("#minhaTabela").delay("slow").fadeIn();
            }
        </script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


