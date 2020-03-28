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
            <div class="col-md-9 mx-auto py-3 px-4 bg-white shadow rounded">
                <div class="col-md-12  text-center">
                    <img src="../img/boy.png" class="rounded-circle border border-light shadow-sm" width="150" height="150">
                    <h3>Amanda Lima de Souza</h3>
                </div>
                <div class="col-md-8 mx-auto text-center">
                    <h7>Sou um programador de qualidade, tenho as melhores notas e sou um ótimo cantor. Quando estou de férias vivo tirando fotos com meu cachorro.</h7>
                </div>
                <div class="form-row">
                    <div class="col-md-6">
                        <h4>Dados pessoais</h4>
                    </div>
                </div>

                <div class="px-3">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Nome completo</label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Cidade/Região</label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="exampleInputEmail1">Link do Currículo Lattes <i class="fa fa-link"></i></label>
                            <input type="text" class="form-control" id="nome" aria-describedby="nome">
                        </div>
                    </div>
                </div>

                <div class="form-row">
                    <div class="col-md-6">
                        <h4>Projetos</h4>
                    </div>
                </div>
                <div class="px-3">
                    <div class="card mb-3 shadow">
                        <div class="row no-gutters">
                            <div class="col-md-3 bg-light border row align-items-center ml-0">
                                <div class="text-center bg-light">
                                    <img src="../img/lupa.png" class="card-img col-md-9 mt-2 mb-2" alt="...">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">CHS sports: Um gerenciador de campeonatos espostivos amadores</h5>
                                    <p class="card-text">Moda, Gabriel P.; Júnior, Mirlândio S., Ribeiro, Paulo S.</p>
                                    <p class="card-text"><small class="text-muted">3 minutos atrás</small></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-3 shadow">
                        <div class="row no-gutters">
                            <div class="col-md-3 bg-light border row align-items-center ml-0">
                                <div class="text-center bg-light">
                                    <img src="../img/lupa.png" class="card-img col-md-9 mt-2 mb-2" alt="...">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Adopets</h5>
                                    <p class="card-text">Magalhães, Antônio J. L.; Feitosa, Daniela F.; Neves, Eduardo N. B.; Rodrigues, Letícia M. </p>
                                    <p class="card-text"><small class="text-muted">9 minutos atrás</small></p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="card mb-3 shadow">
                        <div class="row no-gutters">
                            <div class="col-md-3 bg-light border  row align-items-center ml-0">
                                <div class="text-center">
                                    <img src="../img/lupa.png" class="card-img col-md-9 mt-2 mb-2" alt="...">
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title">Yomu: Biblioteca online</h5>
                                    <p class="card-text">Batalha, Bruno C.; Soares, Caroline B.; Lima, Clara B.; Balbi, Yan L.</p>
                                    <p class="card-text"><small class="text-muted">15 minutos atrás</small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Editar perfil</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="text-center">
                                <img src="../img/girl.png" class="rounded-circle border border-light shadow-sm" width="150" height="150">
                                <div class="col-md-6 py-0 mx-auto text-center">
                                    <div class="custom-file">
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" id="customFile">
                                            <label class="custom-file-label" for="customFile">Selecione uma foto</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-row mt-3">
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Nome completo</label>
                                    <input type="text" class="form-control" id="nome" aria-describedby="nome">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Matrícula</label>
                                    <input type="number" class="form-control" id="matricula" aria-describedby="matricula">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Biografia</label>
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Cidade/Região</label>
                                <input type="text" class="form-control" id="nome" aria-describedby="nome">
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Link do Github <i class="fa fa-link"></i></label>
                                    <input type="text" class="form-control" id="nome" aria-describedby="nome">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="exampleInputEmail1">Link do Currículo Lattes <i class="fa fa-link"></i></label>
                                    <input type="text" class="form-control" id="nome" aria-describedby="nome">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted">
                                    Nunca compartilharemos seu email ou matrícula com mais ninguém.</small>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Senha</label>
                                <input type="password" class="form-control" id="exampleInputPassword1">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                            <button type="button" class="btn btn-success">Salvar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>
