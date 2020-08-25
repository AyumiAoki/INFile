<%-- 
    Document   : cadastroProjeto
    Created on : 25/03/2020, 00:38:44
    Author     : ayumi
--%>

<%@page import="model.dao.GenericDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.bean.Projeto"%>
<%@page import="java.util.List"%>
<%@page import="model.bean.AutorProjeto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.dao.AutorProjetoDAO"%>
<%@page import="model.bean.Usuario"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil</title>
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
            <%
                GenericDAO<Usuario> gdu = new GenericDAO();
                Usuario u = gdu.findById(Usuario.class, Long.parseLong(request.getParameter("userId")));
            %>
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <div class="col-md-12  text-center">
                    <%
                        String[] nome = u.getNome().trim().split(" ");
                    %>
                    <img src="../salvo/<%= u.getArquivo_imagem()%>" class="rounded-circle border border-light shadow autores-img" onerror="erroImg()">
                    <h3><%= nome[0]%> <%= nome[1]%></h3>
                </div>
                <div class="col-md-8 mx-auto text-center">
                    <%
                        String bio = "";
                        if (u.getBio() != null) {
                            bio = IOUtils.toString(u.getBio());
                        }
                    %>
                    <h7><%=bio%></h7>
                </div>
                <h4>Dados pessoais</h4>
                <div class="px-3">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Nome completo</label>
                            <input type="text" class="form-control" value="<%= u.getNome()%>" disabled="" id="nome" aria-describedby="nome">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Matrícula</label>
                            <input type="number" class="form-control" id="matricula" value="<%= u.getMatricula()%>" disabled="" aria-describedby="matricula">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email</label>
                        <input type="email" class="form-control" id="exampleInputEmail1" value="<%= u.getEmail()%>" disabled="" aria-describedby="emailHelp">
                    </div>
                    <div id="accordion">
                        <div class="text-center">
                            <a class="collapsed text-primary" href="" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Ver mais
                            </a>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Cidade/Região</label>
                                <input  type="text" class="form-control" id="nome" value="<%= u.getRegiao()%>" disabled="" aria-describedby="nome">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                                    <input type="text" class="form-control" id="nome" value="<%= u.getGit()%>" disabled="" aria-describedby="nome">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Link do Currículo Lattes <i class="fa fa-link"></i></label>
                                    <input type="text" class="form-control" id="nome" value="<%= u.getLattes()%> " disabled="" aria-describedby="nome">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <h4>Projetos</h4>
                <div class="px-3">
                    <%
                        AutorProjetoDAO apDAO = new AutorProjetoDAO();
                        List<Projeto> projetos = apDAO.getProjetos(u.getMatricula());
                        for (Projeto a : projetos) {%>
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
                    <%
                        }
                    %>
                </div>
                <%
                    if (projetos.size() == 0) {
                %>
                <div class="alert alert-info alert-dismissible fade show" role="alert">
                    Nenhum projeto foi cadastrado.
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <script src="../js/validation.js"></script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
