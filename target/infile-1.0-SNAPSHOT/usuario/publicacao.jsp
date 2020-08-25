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
        <title>Publicação</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/bootstrap-file-upload.js"></script>
    </head>
    <jsp:include page="head.jsp"/>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <%
                    Usuario u = (Usuario) request.getSession().getAttribute("usuario");

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
                <div class="form-row float-right">
                    <a class="btn btn-danger text-white mr-2" id="btnExcluir" data-toggle="modal" data-target="#excluir">Excluir</a>
                    <a class="btn btn-warning text-white mr-2" id="btnEditar" data-toggle="modal" data-target="#editar">Editar</a>
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
                            boolean proprietario = false;
                            for (Usuario usuario : autores) {
                                if (Integer.parseInt("" + usuario.getId()) == Integer.parseInt("" + u.getId())) {
                                    proprietario = true;
                                }
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
                                    <h5 class="card-title text-center one-line"><%= nome[0]%></h5>
                                    <p class="card-text text-center"><%= usuario.getMatricula()%></p>
                                    <a href="perfil.jsp?userId=<%= usuario.getId() %>" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                                </div>
                                <a href="perfil.jsp?userId=<%= usuario.getId() %>" class="stretched-link"></a>
                            </div>
                        </div>
                        <% }
                            if (!proprietario) {
                        %>
                        <script>
                            $("#btnEditar").hide();
                            $("#btnExcluir").hide();
                        </script>
                        <% }%>
                    </div>
                </div>
            </div>
            
                    
            <!--Exclusão-->
            <div class="modal fade" id="excluir" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <form action="/infile/ExcluirProjetoServlet"  method="POST">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">EXCLUIR PROJETO</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <h5 class="mb-0"><%= projeto.getAssunto()%></h5>
                                <small class="text-muted">(Todos os dados serão apagados e não será possível recupera-los.)</small>
                                <div class="px-2 py-2">
                                    <table class="table table-bordered table-striped">
                                        <input type="text" value="<%= projeto.getId()%>" hidden="" id="idPro" name="idPro">
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
                                        </tbody>
                                    </table>
                                </div>
                                <div class="form-check">
                                    <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                                    <label class="form-check-label" for="exampleCheck1">CONFIRMAR EXCLUSÃO</label>
                                    <a class="text-danger">*</a>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-danger" >Apagar</button>
                                <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!--editarrrr-->
            <div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Editar projeto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form method="post" action="/infile/AlterarProjetoServlet" enctype="multipart/form-data" class="needs-validation" novalidate>
                            <div class="modal-body">
                                <input type="text" name="id" id="id" value="<%= request.getParameter("id")%>" hidden="">
                                <input type="text" name="idUser" id="idUser" value="<%= u.getId()%>" hidden="">
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="">Nome do projeto <a class="text-danger">*</a></label>
                                        <input type="text" class="form-control" id="nome" value="<%= projeto.getAssunto()%>" name="nome" aria-describedby="nomeProjeto" required="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Orientador <a class="text-danger">*</a></label>
                                        <input type="text" class="form-control" id="orientador" name="orientador" value="<%= projeto.getOrientador()%>" aria-describedby="orientador" required="">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="">Autores</label>
                                    <small class="text-muted">(Não é possível alterar este campo)</small>
                                    <div class="mx-2">
                                        <%
                                            for (Usuario usuario : autores) {
                                        %>
                                        <div class="form-group">
                                            <label class="text-muted"><%= usuario.getNome()%>: </label>
                                            <input type="text" id="myInput" name="myCountry[]" value="<%= usuario.getMatricula()%>" readonly="" class="form-control m-input" placeholder="Matrícula">  
                                        </div>
                                        <% }%>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="">Anexar projeto <a class="text-danger">*</a></label>
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input"  id="projeto" name="projeto"/>
                                        <label class="custom-file-label" for="">Escolha um arquivo</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="imagem">Inserir imagem</label>
                                    <small class="text-muted">(Campo opcional)</small>
                                    <div class="form-panel">
                                        <div class="form-group last">
                                            <div class="fileupload fileupload-new" data-provides="fileupload">
                                                <div class="border text-center bg-light">
                                                    <img src="../salvo/<%= projeto.getImg()%>" class="fileupload-new thumbnails w-100 cadastroP-img"  alt="Nenhuma imagem foi enviada"/>
                                                    <div class="fileupload-preview fileupload-exists thumbnail w-100" style="max-height: 450px"></div>
                                                </div>
                                                <div class="text-center my-1">
                                                    <span class="btn btn-success btn-file">
                                                        <span class="fileupload-new">Selecionar imagem</span>
                                                        <span class="fileupload-exists">Selecionar outra</span>
                                                        <input type="file" id="imagem"  class="default" name="imagem" onchange="previewImage(this, 'modalPreviewImg');" accept="image/png, image/jpg"  multiple/>
                                                    </span>
                                                    <a href="" class="btn btn-danger fileupload-exists" data-dismiss="fileupload">Remover</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                                        <a class="text-danger">*</a>
                                        <input type="text" class="form-control" value="<%= projeto.getGit()%>" id="git" name="git" aria-describedby="nome">
                                        <small>Link do código fonte.</small>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="exampleInputEmail1">Google Drive <i class="fa fa-link"></i></label>
                                        <small class="text-muted">(Campo opcional)</small>
                                        <input type="text" class="form-control" value="<%= projeto.getDrive()%>" id="drive" name="drive" aria-describedby="nome">
                                        <small>Link alternativo da documentação.</small>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Descrição</label>
                                    <a class="text-danger">*</a>
                                    <textarea class="form-control" id="descricao" name="descricao" rows="3" required=""><%= IOUtils.toString(projeto.getDescricao())%></textarea>
                                </div>

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="">Data</label>
                                        <a class="text-danger">*</a>
                                        <input type="date" class="form-control" value="<%= projeto.getData()%>" id="data" name="data" aria-describedby="ano" required="">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="inputState">Série</label>
                                        <a class="text-danger">*</a>
                                        <select id="serie" name="serie" class="form-control" required="" >
                                            <option selected><%= projeto.getSerie()%></option>
                                            <option>1° ano</option>
                                            <option>2° ano</option>
                                            <option>3° ano</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="">Data início</label>
                                        <a class="text-danger">*</a>
                                        <input type="date" class="form-control" value="<%= projeto.getInicio()%>" id="inicio" name="inicio" aria-describedby="ano" required="">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="">Data fim</label>
                                        <a class="text-danger">*</a>
                                        <input type="date" class="form-control" value="<%= projeto.getFim()%>" id="fim" name="fim" aria-describedby="ano" required="">
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
        </div>
        <script>
            // input file 
            $('#projeto').on('change', function () {
                var fileName = $(this).val();
                $(this).next('.custom-file-label').html(fileName);
            })
        </script>
        <script src="../js/validation.js"></script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
