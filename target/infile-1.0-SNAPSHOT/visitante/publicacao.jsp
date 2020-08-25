<%-- 
    Document   : cadastroProjeto
    Created on : 25/03/2020, 00:38:44
    Author     : ayumi
--%>

<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.Usuario"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Projeto"%>
<%@page import="model.dao.AutorProjetoDAO"%>
<%@page import="model.bean.AutorProjeto"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publicação</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/fontawesome.js"></script>
        <script src="../js/bootstrap-file-upload.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <%
                    AutorProjetoDAO dao = new AutorProjetoDAO();
                    Projeto projeto = dao.getProjeto(Long.parseLong(request.getParameter("id")));

                    SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
                    Date date = formato.parse(projeto.getData());
                    formato.applyPattern("dd/MM/yyyy");
                    String data = formato.format(date);

                    formato = new SimpleDateFormat("yyyy-MM-dd");
                    date = formato.parse(projeto.getInicio());
                    formato.applyPattern("dd/MM/yyyy");
                    String inicio = formato.format(date);

                    formato = new SimpleDateFormat("yyyy-MM-dd");
                    date = formato.parse(projeto.getFim());
                    formato.applyPattern("dd/MM/yyyy");
                    String fim = formato.format(date);
                %>
                <div class="col-md-12  text-center">
                    <img src="../img/lupa.png" width="150" height="150">
                    <h3 class="text-uppercase"> <b><%= projeto.getAssunto()%></b></h3>
                    <p><%= IOUtils.toString(projeto.getDescricao())%></p>
                </div>
                <h4 class="mt-3">Informações</h4>
                <div class="px-2 py-2">
                    <table class="table table-bordered table-striped">
                        <tbody>
                            <tr>
                                <th scope="row">ASSUNTO</th>
                                <td class="text-uppercase"><%= projeto.getAssunto()%></td>
                            </tr>
                            <tr>
                                <th scope="row">DATA DE PUBLICAÇÃO</th>
                                <td><%= data%></td>
                            </tr>
                            <tr>
                                <th scope="row">ORIENTADOR</th>
                                <td class="text-uppercase"><%= projeto.getOrientador()%></td>
                            </tr>
                            <tr>
                                <th scope="row">INÍCIO</th>
                                <td><%= inicio%></td>
                            </tr>
                            <tr>
                                <th scope="row">FIM</th>
                                <td><%= fim%></td>
                            </tr>
                            <tr>
                                <th scope="row">SÉRIE</th>
                                <td class="text-uppercase"><%= projeto.getSerie()%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <h4 class="mt-3">Imagem</h4>
                <div class="px-2 py-2">
                    <img class="d-block w-100 publicacao-img" src="../salvo/<%= projeto.getImg()%>" alt="First slide">
                </div>
                <h4 class="mt-3">Pré-vizualização</h4>
                <div class="px-2 py-2">
                    <div class="border rounded shadow">
                        <iframe src="../salvo/<%= projeto.getDocumentacao()%>" width="100%" height="350px"></iframe>
                    </div>
                </div>

                <h4 class="mt-3">Disponível em:</h4>
                <div class="px-3 py-2">
                    <div class="form-row">
                        <div class="card mr-4 mb-4 card-width-perfil">
                            <img class="card-img-top py-2 px-2 icon-width mx-auto" src="../img/github.svg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Código fonte</h5>
                                <p class="card-text">Siga o link abaixo para baixar o código fonte completo do INFILE.</p>
                                <a href="<%= projeto.getGit()%>" target="_blank" class="card-link">Clique aqui</a>
                            </div>
                        </div>
                        <% if (projeto.getDrive() != null && !projeto.getDrive().equals("") && !projeto.getDrive().equals("null")) {%>
                        <div class="card mb-2 card-width-perfil">
                            <img class="card-img-top px-2  icon-width mx-auto" src="../img/drive.png" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Documentação</h5>
                                <p class="card-text">Siga o link abaixo para baixar a documentação do INFILE.</p>
                                <a href="<%= projeto.getDrive()%>" target="_blank" class="card-link">Clique aqui</a>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
                <h4 class="mt-3">Autores</h4>
                <div class="px-2 py-2">
                    <div class="form-row">

                        <%

                            List<Usuario> autores = dao.getAutores(Long.parseLong(request.getParameter("id")));
                            for (Usuario usuario : autores) {
                        %>
                        <div class="col-auto mx-auto">
                            <div class="card shadow mx-auto mb-2 card-width-perfil">
                                <div class="text-center">
                                    <img src="../salvo/<%= usuario.getArquivo_imagem()%>" class="card-img mt-2 rounded-circle autores-img"  alt="...">
                                </div>
                                <div class="card-body">
                                    <%
                                        String[] nome = usuario.getNome().trim().split(" ");
                                    %>
                                    <h5 class="card-title text-center one-line"><%= nome[0]%> <%= nome[1]%></h5>
                                    <p class="card-text text-center"><%= usuario.getMatricula()%></p>
                                    <a href="perfil.jsp?userId=<%= usuario.getId() %>" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                                </div>
                                <a href="perfil.jsp?userId=<%= usuario.getId() %>" class="stretched-link"></a>
                            </div>
                        </div>
                        <% }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
