<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : ayumi
--%>

<%@page import="java.util.ArrayList"%>
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
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <h4 class="mb-4">Publicações do <%= request.getParameter("serie")%> </h4>
                <div class="input-group mb-3 ">
                    <div class="input-group-prepend">
                        <a class="input-group-text"><i class="fa fa-search"></i></a>
                    </div>
                    <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Digite aqui...">
                    <div class="input-group-append">
                        <a class="btn input-group-text"  id="data"><i class="fa fa-sort-numeric-up-alt"></i> Data</a>
                        <a class="btn input-group-text" id="alfabeto"><i class="fa fa-sort-amount-up"></i> Alfebética</a>
                    </div>
                </div>
                <div id="myItems">
                    <%
                        AutorProjetoDAO apDAO = new AutorProjetoDAO();
                        List<Projeto> projetos = new ArrayList<>();
                        String req = request.getParameter("serie");
                        if(req.equals("1°,2° e 3° ano")){
                            projetos = apDAO.getAllProjeto();
                        }else{
                            projetos = apDAO.getProjetosBySerie(req);
                        }
                        
                        for (Projeto a : projetos) {
                            String dataEmUmFormato = a.getData();
                            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                            Date data = formato.parse(dataEmUmFormato);
                            formato.applyPattern("dd/MM/yyyy");
                            String dataFormatada = formato.format(data);
                    %>
                    <div class="card mb-3 shadow card-horizontal">
                        <div class="row no-gutters">
                            <div class="col-lg-3 bg-light border-right row align-items-center ml-0">
                                <div class="bg-light mx-auto py-2">
                                    <img src="../img/lupa.png" class="card-img icon-width" alt="...">
                                </div>
                            </div>
                            <div class="col-lg-8">
                                <div class="card-body">
                                    <h5 class="card-title text-uppercase"><%= a.getAssunto()%></h5>
                                    <p class="card-text text-uppercase">
                                        <%
                                            List<Usuario> autores = apDAO.getAutores(a.getId());
                                            String searchByName = "";
                                            for (Usuario usuario : autores) {
                                                searchByName += usuario.getNome() + " ";
                                        %>
                                        <%= usuario.getNome()%>; 
                                        <% }%>
                                    </p>
                                    <h6 hidden><%= a.getAssunto()%> <%= searchByName%> <%= dataFormatada%></h6>
                                    <p class="card-text"><small class="text-muted">Enviado em <%= dataFormatada%> </small></p>
                                </div>
                            </div>
                        </div>
                        <a href="publicacao.jsp?id=<%= a.getId()%>" class="stretched-link"></a>
                    </div>
                    <% }   %>
                    <%
                        if (projetos.size() == 0) {
                    %>
                    <div class="alert alert-info alert-dismissible fade show"  role="alert">
                        Nenhum projeto foi cadastrado.
                    </div>
                    <%
                        }
                    %>
                </div>
                <div class="text-center">
                    <div class="spinner-border text-success" id="load" role="status">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>
                <div class="alert alert-info alert-dismissible fade show" id="aviso" role="alert">
                    Nenhum projeto foi encontrado.
                </div>
            </div>
        </div>
        <script>
            $("#aviso").hide();
            $('#load').hide();
            function myFunction() {
                Daley();
                var input, filter, cards, cardContainer, h5, title, i;
                input = document.getElementById("myFilter");
                filter = input.value.toUpperCase();
                cardContainer = document.getElementById("myItems");
                cards = cardContainer.getElementsByClassName("card");

                for (i = 0; i < cards.length; i++) {
                    title = cards[i].querySelector(".card-body h6");
                    if (title.innerText.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                        $("#aviso").hide();
                    } else {
                        cards[i].style.display = "none";
                        if (i == 0) {
                            $("#aviso").show();
                        }
                    }
                }
            }

            $('#alfabeto').click(function () {
                meuDaley();
                $('#myItems .card').sort(function (a, b) {
                    return $(a).find(".card-title").text() > $(b).find(".card-title").text() ? 1 : -1;
                }).appendTo("#myItems");
            })

            $('#data').click(function () {
                meuDaley();
                $('#myItems .card').sort(function (a, b) {
                    return $(a).find(".card-text").text() > $(b).find(".card-text").text() ? 1 : -1;
                }).appendTo("#myItems");
            })

            function meuDaley() {
                $('#load').show();
                $('#myItems').hide();
                $('#load').delay(1500).fadeOut();
                $("#myItems").delay(1500).fadeIn();
            }

            function Daley() {
                $('#load').show();
                $('#myItems').hide();
                $('#load').delay("slow").fadeOut();
                $("#myItems").delay("slow").fadeIn();
            }
        </script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


