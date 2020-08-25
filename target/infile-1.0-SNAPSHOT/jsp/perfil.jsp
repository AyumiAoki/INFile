<%-- 
    Document   : cadastroProjeto
    Created on : 25/03/2020, 00:38:44
    Author     : paulo
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
                Usuario logado = (Usuario) request.getSession().getAttribute("usuario");
                boolean visitante = true;

                if (Integer.parseInt("" + logado.getId()) == Integer.parseInt("" + u.getId())) {
                    visitante = false;
                }
            %>
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <% if (u.getBio() == null && !visitante) {%>
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    Olá <b class="text-uppercase"><%= u.getNome()%></b>! Percebemos que seu cadastro está incompleto. Para finalizar seu cadastro clique em editar perfil.
                </div>
                <% } %>
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
                <div class="form-row">
                    <div class="col-md-6">
                        <h4>Dados pessoais</h4>
                    </div>
                    <div class="col-md-6">
                        <a class="btn btn-warning text-white float-right" id="btnEditarPerfil" data-toggle="modal" data-target="#editar">Editar perfil <i class="fa fa-pen"></i></a>
                    </div>
                </div>

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
                        <small id="emailHelp" class="form-text text-muted">
                            Nunca compartilharemos seu email ou matrícula com mais ninguém.</small>
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

                <div class="form-row">
                    <div class="col-md-6">
                        <h4>Meus Projetos</h4>
                    </div>
                    <div class="col-md-6 mb-3">
                        <a class="btn btn-success float-right text-white" id="btnCriarProjeto" href="cadastroProjeto.jsp">Criar projeto <i class="fa fa-plus"></i></a>
                    </div>
                </div>
                <div class="px-3">
                    <%
                        AutorProjetoDAO apDAO = new AutorProjetoDAO();
                        List<AutorProjeto> lap = apDAO.getAutorProjeto(u.getMatricula());
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
            <div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form method="post" action="/infile/UsuarioServlet" enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Editar perfil</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-panel">
                                    <div class="form-group last">
                                        <div class="fileupload fileupload-new" data-provides="fileupload">
                                            <div class="text-center">
                                                <small class="text-muted text-center">(Campo opcional)</small>
                                            </div>
                                            <div class="text-center">
                                                <img src="../salvo/<%= u.getArquivo_imagem()%>" class="fileupload-new rounded-circle border shadow-sm autores-img"  alt="Nenhuma imagem foi enviada"/>
                                                <div class="fileupload-preview fileupload-exists thumbnail bg-light  rounded-circle border shadow-sm autores-img" style="max-height: 200px"></div>
                                            </div>
                                            <div class="text-center my-1">
                                                <span class="btn btn-success btn-file">
                                                    <span class="fileupload-new">Selecionar foto</span>
                                                    <span class="fileupload-exists">Selecionar outra</span>
                                                    <input type="file" id="imagem"  class="default" name="imagem" onchange="previewImage(this, 'modalPreviewImg');" accept="image/png, image/jpg"  multiple/>
                                                </span>
                                                <a href="" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remover</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input type="text" name="id" hidden="" id="id" value="<%= u.getId()%>">
                                <div class="form-row mt-3">
                                    <div class="form-group col-md-6">
                                        <label for="">Nome completo</label>
                                        <a class="text-danger">*</a>
                                        <input type="text" class="form-control" id="nome" name="nome" value="<%= u.getNome()%>" required="" aria-describedby="nome">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Matrícula</label>
                                        <small class="text-muted">(Não é possível alterar este campo)</small>
                                        <input type="number" class="form-control" id="matricula" name="matricula" value="<%= u.getMatricula()%>" disabled="" aria-describedby="matricula">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="">Email</label>
                                    <small class="text-muted">(Não é possível alterar este campo)</small>
                                    <input type="email" class="form-control" id="email" name="email" value="<%= u.getEmail()%>" disabled="" aria-describedby="emailHelp">
                                    <small id="emailHelp" class="form-text text-muted">
                                        Nunca compartilharemos seu email ou matrícula com mais ninguém.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Biografia</label>
                                    <a class="text-danger">*</a>
                                    <textarea class="form-control" id="bio" name="bio"  required="" rows="3"><%=bio%></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Cidade/Região</label>
                                    <a class="text-danger">*</a>
                                    <input type="text" class="form-control" id="regiao" name="regiao" value="<%= u.getRegiao()%>" required="true">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                                        <small class="text-muted">(Campo opcional)</small>
                                        <input type="text" class="form-control" id="git" name="git" value="<%= u.getGit()%>"  aria-describedby="nome">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Link do Currículo Lattes <i class="fa fa-link"></i></label>
                                        <small class="text-muted">(Campo opcional)</small>
                                        <input type="text" class="form-control" id="lattes" name="lattes" value="<%= u.getLattes()%>" aria-describedby="nome">
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-success">Salvar</button>
                            </div>
                        </form>  
                    </div>
                </div>
            </div>
            <div class="modal fade" data-backdrop="static" id="erroImg" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog  modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Ops! :(</h5>
                        </div>
                        <div class="modal-body">
                            <div class="text-center text-warning">
                                <i class="fa fa-exclamation-triangle fa-3x"></i>
                            </div>
                            Nossos dados não estão sincronizados, atualize a página e tente novamente.
                        </div>
                        <div class="modal-footer">
                            <a class="btn btn-warning text-white" href="perfil.jsp?userId<%= u.getId()%>">Atualizar página</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            // erro ao atualizar a foto
            function erroImg() {
                $('#erroImg').modal('show');
            }
        </script>
        <% if (visitante) { %>
        <script>
            $("#btnEditarPerfil").hide();
            $("#btnCriarProjeto").hide();
        </script>
        <% }%>
        <script src="../js/validation.js"></script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
