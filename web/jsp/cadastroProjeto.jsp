<%-- 
    Document   : cadastroProjeto
    Created on : 25/03/2020, 00:38:44
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Projeto</title>
        <link rel="stylesheet" href="../css/bootstrap/bootstrap.min.css">
        <link rel="stylesheet" href="../css/style.css">
        <script src="../js/jquery-3.4.1.min.js"></script>
        <script src="../js/popper.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/fontawesome.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="col-md-8 mr-auto ml-auto mt-4 mb-4 border bg-white shadow rounded">
                <h4 class="mt-3 text-center">Novo projeto</h4>
                <form>
                    <div class="form-row mt-3">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Nome do projeto</label>
                            <input type="text" class="form-control" id="nomeProjeto" aria-describedby="nomeProjeto">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Nome do autor</label>
                            <input type="text" class="form-control" id="nomeAutor" aria-describedby="nomeAutor">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Orientador</label>
                        <input type="text" class="form-control" id="nomeAutor" aria-describedby="orientador">
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Anexar projeto</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="customFile">
                                <label class="custom-file-label" for="customFile">Selecionar arquivo</label>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Anexar imagens</label>
                            <div class="custom-file">
                                <input type="file" class="custom-file-input" id="customFile">
                                <label class="custom-file-label" for="customFile">Selecionar arquivo</label>
                            </div>
                            <small>Este campo é opcional.</small>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                            <small>Link do código fonte.</small>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Google Drive <i class="fa fa-link"></i></label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                            <small>Link alternativo da documentação.</small>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Descrição</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Ano</label>
                            <input type="date" class="form-control" id="ano" aria-describedby="ano">
                        </div>

                        <div class="form-group col-md-6">
                            <label for="inputState">Série</label>
                            <select id="inputState" class="form-control">
                                <option>Selecione</option>
                                <option>1° ano</option>
                                <option>2° ano</option>
                                <option>3° ano</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleInputEmail1">Termo de autorização</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile">
                            <label class="custom-file-label" for="customFile">Selecionar termo</label>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-success btn-block mb-4 mt-5">Confirmar</button>
                </form>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
