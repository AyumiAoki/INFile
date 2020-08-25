<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : ayumi
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.bean.Projeto"%>
<%@page import="model.dao.AutorProjetoDAO"%>
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
                <h4 class="mb-4">Data de publicação</h4>
                <div class="input-group mb-3 ">
                    <div class="input-group-prepend">
                        <a class="input-group-text"><i class="fa fa-search"></i></a>
                    </div>
                    <input type="text" id="search" class="form-control" onkeyup="myFunction()" placeholder="Digite aqui...">
                    <div class="input-group-append">
                        <a class="btn input-group-text" onclick="sortTable()" id="data"><i class="fa fa-sort-numeric-up-alt"></i> Data</a>
                    </div>
                </div>
                <table class="table table-hover border table-responsive-md" id="tableMy">
                    <thead>
                        <tr>
                            <th scope="col">Nome</th>
                            <th scope="col">Data</th>
                        </tr>
                    </thead>
                    <tbody id="minhaTabela">
                        <%
                            AutorProjetoDAO apDAO = new AutorProjetoDAO();
                            List<Projeto> projetos = new ArrayList<>();
                            projetos = apDAO.getAllProjeto();

                            for (Projeto a : projetos) {
                                SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                Date date = formato.parse(a.getData());
                                formato.applyPattern("dd/MM/yyyy");
                                String data = formato.format(date);
                        %>
                        <tr>
                            <td><%= a.getAssunto()%></td>
                            <td><%= data%></td>
                            <td hidden=""><%= a.getId()%></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <%
                    if (projetos.size() == 0) {
                %>
                <div class="mb-3">
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        Nenhum projeto cadastrado.
                    </div>
                </div>
                <% }%>
                <div class="text-center">
                    <div class="spinner-border text-success" id="load" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
            </div>
            <script>
                function sortTable() {
                    var table, rows, switching, i, x, y, shouldSwitch;
                    table = document.getElementById("tableMy");
                    switching = true;
                    while (switching) {
                        switching = false;
                        rows = table.rows;
                        for (i = 1; i < (rows.length - 1); i++) {
                            shouldSwitch = false;
                            x = rows[i].getElementsByTagName("TD")[0];
                            y = rows[i + 1].getElementsByTagName("TD")[0];
                            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                                shouldSwitch = true;
                                break;
                            }
                        }
                        if (shouldSwitch) {
                            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                            switching = true;
                        }
                    }
                }

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
                        nome += selecionado[2].innerHTML;
                    }
                    window.location.href = "publicacao.jsp?id=" + nome;
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
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


