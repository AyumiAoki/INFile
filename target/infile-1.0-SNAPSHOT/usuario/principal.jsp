<%-- 
    Document   : index
    Created on : 24/03/2020, 21:03:04
    Author     : ayumi
--%>

<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="model.dao.UsuarioDAO"%>
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
            <div class="col-md-12 mx-auto card noZoom mb-3 mt-3 shadow">
                <div class="row no-gutters">
                    <div class="col-md-3 px-0 py-0 my-auto">
                        <div class="text-center">
                            <img  src="../img/pen.gif" class="card-img card-width-perfil" alt="...">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h4 class="card-title"><b>Contribua com a pesquisa!</b></h4>
                            <p class="card-text text-justify">Crie projetos com a nossa plataforma e seja um infile. Crie projetos com a nossa plataforma e seja um infile. Crie projetos com a nossa plataforma e seja um infile.</p>
                        </div>
                    </div>
                    <div class="col-md-3 my-auto ">
                        <h5 class="text-center mb-3">Crie seu projeto agora! <br> <a class="btn btn-warning text-white mt-2 shadow border border-light zoom" href="cadastroProjeto.jsp">Criar <i class="fa fa-plus"></i></a></h5>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mx-auto py-4 px-4 bg-white shadow rounded">
                <h4><i class="fa fa-star"></i> Produções</h4>
                <div class="px-4 py-3">  
                    <div class="form-row">
                        <div class="col-lg-4 ">
                            <div class="card shadow card-width mx-auto mb-2">
                                <div class="col-md-12">
                                    <div class="text-center">
                                        <img src="../img/c.png" class="card-img col-md-10 mt-2" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Primeiro ano</h5>
                                        <hr>
                                        <div class="text-right">
                                            <a href="serie.jsp?serie=1° Ano" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                                        </div>
                                    </div>

                                </div>
                                <a href="serie.jsp?serie=1° Ano" class="stretched-link"></a>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-2">
                            <div class="card shadow card-width mx-auto">
                                <div class="col-md-12">
                                    <div class="text-center">
                                        <img src="../img/java.png" class="card-img col-md-10 mt-2" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Segundo ano</h5>
                                        <hr>
                                        <div class="text-right">
                                            <a href="serie.jsp?serie=2° Ano" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <a href="serie.jsp?serie=2° Ano" class="stretched-link"></a>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="card shadow card-width mx-auto">
                                <div class="col-md-12">
                                    <div class="text-center">
                                        <img src="../img/html.png" class="card-img col-md-10 mt-2" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title text-center">Terceiro ano</h5>
                                        <hr>
                                        <div class="text-right">
                                            <a href="serie.jsp?serie=3° Ano" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <a href="serie.jsp?serie=3° Ano" class="stretched-link"></a>
                            </div>
                        </div>
                    </div>
                </div>
                <h4><i class="fa fa-clock "></i> Últimas publicações</h4>
                <div class="py-3 px-4">
                    <%
                        AutorProjetoDAO apDAO = new AutorProjetoDAO();
                        List<Projeto> projetos = apDAO.getAllProjeto();
                        int i = 0;
                        for (Projeto a : projetos) {
                            i++;
                            if (i <= 2) {
                    %>

                    <div class="card mb-3 mt-3 shadow card-horizontal">
                        <div class="row no-gutters">
                            <div class="col-lg-3 bg-light border row align-items-center ml-0">
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
                                            for (Usuario usuario : autores) {
                                        %>
                                        <%= usuario.getNome()%>; 
                                        <% } %>
                                    </p>
                                    <%
                                        String dataEmUmFormato = a.getData();
                                        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                                        Date data = formato.parse(dataEmUmFormato);
                                        formato.applyPattern("dd/MM/yyyy");
                                        String dataFormatada = formato.format(data);
                                    %>
                                    <p class="card-text"><small class="text-muted">Enviado em <%= dataFormatada%> </small></p>
                                </div>
                            </div>
                        </div>
                        <a href="publicacao.jsp?id=<%= a.getId()%>" class="stretched-link"></a>
                    </div>
                    <% }
                        }%>
                    <div class="col-md-12 text-center border-bottom">
                        <a href="serie.jsp?serie=1°,2° e 3° ano">Ver todos <i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
                <h4><i class="fa fa-users"></i> Autores</h4>
                <div class="px-4 py-3">
                    <div class="form-row">
                        <%
                            UsuarioDAO dao = new UsuarioDAO();
                            Usuario u = (Usuario) request.getSession().getAttribute("usuario");
                            List<Usuario> users = dao.getUsers(u.getMatricula());
                            for (Usuario user : users) {
                        %>
                        <div class="col-auto mx-auto">
                            <div class="card shadow card-width mx-auto mb-2 card-width-perfil">
                                <div class="col-md-12">
                                    <div class="text-center">
                                        <img src="../salvo/<%= user.getArquivo_imagem()%>" class="card-img mt-2 rounded-circle autores-img" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <%
                                            String[] nome = user.getNome().trim().split(" ");
                                        %>
                                        <h5 class="card-title text-center"><%= nome[0]%> </h5>
                                        <%
                                            String bio = "Cadastro incompleto";
                                            if (user.getBio() != null) {
                                                bio = IOUtils.toString(user.getBio());
                                            }
                                        %>
                                        <p class="card-text text-center"><%= bio%></p>

                                        <a href="" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                                    </div>
                                </div>
                                <a href="perfil.jsp?userId=<%= user.getId()%>" class="stretched-link"></a>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                    <%
                        if (users.size() == 0) {
                    %>
                    <div class="alert alert-info alert-dismissible fade show" role="alert">
                        Nenhum autor foi cadastrado.
                    </div>
                    <%
                        }
                    %>
                    <div class="col-md-12 text-center border-bottom">
                        <a href="autor.jsp">Ver todos <i class="fa fa-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

