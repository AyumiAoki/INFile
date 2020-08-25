<%-- 
    Document   : cadastroProjeto
    Created on : 25/03/2020, 00:38:44
    Author     : paulo
--%>

<%@page import="java.util.List"%>
<%@page import="model.bean.Usuario"%>
<%@page import="model.dao.UsuarioDAO"%>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Projeto</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/bootstrap/bootstrap-file-upload.css">
        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/fontawesome.js"></script>
        <script src="../js/bootstrap-file-upload.js"></script>
        <style>
            #minhaTabela tr td{
                cursor: pointer;
            }

            /**Cor quando selecionado**/
            #minhaTabela tr.selecionado td{
                background-color: #46c948;
                opacity: 90%;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <%
                Usuario logado = (Usuario) request.getSession().getAttribute("usuario");
            %>
            <div class="col-md-8 mr-auto ml-auto mt-4 mb-4 border bg-white shadow rounded">
                <h4 class="mt-3 text-center">Novo projeto</h4>
                <form method="post" action="/infile/CadastrarProjetoServlet" enctype="multipart/form-data" class="needs-validation" novalidate>
                    <input type="text" name="idUser" id="idUser" value="${usuario.id}" hidden="">
                    <div class="form-group">
                        <label for="">Termo de autorização</label>
                        <a class="text-danger">*</a>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input"  id="termo" required="" name="termo"/>
                            <label class="custom-file-label" for="">Escolha um arquivo</label>
                            <small class="text-danger">Insira o termo nesse campo conforme solicitado.</small>
                        </div>
                    </div>
                    <hr>
                    <div class="form-row mt-3">
                        <div class="form-group col-md-6">
                            <label for="">Nome do projeto <a class="text-danger">*</a></label>
                            <input type="text" class="form-control" id="nome" name="nome" aria-describedby="nomeProjeto" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">Orientador <a class="text-danger">*</a></label>
                            <input type="text" class="form-control" id="orientador" name="orientador" aria-describedby="orientador" required="">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div id="inputFormRow">
                                <div class="form-group">
                                    <label for="">Autores <a class="text-danger">*</a></label>
                                    <div class="mx-2">
                                        <label class="text-muted">${usuario.nome} </label>
                                        <div class="input-group mb-3">
                                            <input type="text" id="myInput" name="myCountry[]" value="${usuario.matricula}" readonly="" class="form-control m-input" placeholder="Matrícula" required="">
                                            <div class="input-group-append">       
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="newRow"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="">Anexar projeto <a class="text-danger">*</a></label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input"  id="projeto" name="projeto" required=""/>
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
                                        <img src="../img/png_jpg_gif.jpg" class="fileupload-new thumbnails w-100 cadastroP-img"  alt="Nenhuma imagem foi enviada"/>
                                        <div class="fileupload-preview fileupload-exists thumbnail w-100" style="max-height: 450px"></div>
                                    </div>
                                    <div class="text-center my-1">
                                        <span class="btn btn-success btn-file">
                                            <span class="fileupload-new">Selecionar imagem</span>
                                            <span class="fileupload-exists">Selecionar outra</span>
                                            <input type="file" id="imagem" required="" class="default" name="imagem" onchange="previewImage(this, 'modalPreviewImg');" accept="image/png, image/jpg"  multiple/>
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
                            <input type="text" class="form-control" required="" id="git" name="git" aria-describedby="nome">
                            <small>Link do código fonte.</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Google Drive <i class="fa fa-link"></i></label>
                            <small class="text-muted">(Campo opcional)</small>
                            <input type="text" class="form-control" id="drive" name="drive" aria-describedby="nome">
                            <small>Link alternativo da documentação.</small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Descrição</label>
                        <a class="text-danger">*</a>
                        <textarea class="form-control" id="descricao" name="descricao" rows="3" required=""></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="">Data</label>
                            <a class="text-danger">*</a>
                            <input type="date" class="form-control" id="data" name="data" aria-describedby="ano" required="">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="inputState">Série</label>
                            <a class="text-danger">*</a>
                            <select id="serie" name="serie" class="form-control" required="" >
                                <option></option>
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
                            <input type="date" class="form-control" id="inicio" name="inicio" aria-describedby="ano" required="">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="">Data fim</label>
                            <a class="text-danger">*</a>
                            <input type="date" class="form-control" id="fim" name="fim" aria-describedby="ano" required="">
                        </div>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="exampleCheck1" required="">
                        <label class="form-check-label" for="exampleCheck1">Eu declaro que os dados preencidos acima são verdadeiros.</label>
                    </div>
                    <button type="submit" class="btn btn-success btn-block mb-4 mt-1">Confirmar</button>
                </form>
            </div>
        </div>

        <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLongTitle">Selecionar autor</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
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
                    <div class="modal-footer">
                        <button id="addRow" type="button" class="btn btn-success" data-dismiss="modal">Selecionar</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" data-backdrop="static" id="termoM" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <a class="modal-title" id="exampleModalCenterTitle"><b>TERMO DE AUTORIZAÇÃO</b></a>
                        <button type="button" class="close text-danger" data-dismiss="modal" aria-label="Close">
                            <b><span aria-hidden="true">&times;</span></b>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="text-center text-danger mb-2">
                            <b> ETAPA OBRIGATÓRIA </b>
                        </div>
                        <h6 class="text-uppercase text-justify">
                            Antes de publicar o projeto,<b> você deve primeiro  preencher o termo de autorização para a publicação. </b> 
                            Desta forma, você estará assegurando que não haverá problemas em tornar a produção acadêmica visível aos 
                            usuários, e também, irá garantir seus <b>direitos de autoria </b> e <b> privacidade. </b>
                        </h6>
                        <b><i class="far fa-bookmark"></i> INSTRUÇÕES:</b>
                        <h6 class="px-3 py-1 text-uppercase">
                            1. BAIXE O DOCUMENTO (.PDF) ABAIXO; <br>
                            2. PREENCHA OS CAMPOS SOLICITADOS; <br>
                            3. No cadastro, anexe o documento preenchido no campo solicitado.
                        </h6>
                        <hr>
                        <b>BAIXAR <a class="text-danger">*</a></b>
                        <div class="text-center mt-1">
                            <small class="text-muted"><b>Clique no link abaixo para baixar o documento.</b></small> <br>
                            <a class="" href="../pdf/termo.pdf" download="">Termo (.PDF)</a>
                        </div>
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" checked id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Mostrar novamente.</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../js/cadastroprojeto.js"></script>
        <script src="../js/validation.js"></script>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
