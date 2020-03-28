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
        <title>Publicação</title>
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
                    <img src="../img/lupa.png" width="150" height="150">
                    <h3><b>INFILE</b> - REPOSITÓRIO DEPARTAMENTAL DO IFAM</h3>
                </div>
                <div class="form-row float-right">
                    <a class="btn btn-danger text-white mr-2" data-toggle="modal" data-target="#excluir">Excluir</a>
                    <a class="btn btn-warning text-white mr-2" data-toggle="modal" data-target="#editar">Editar</a>
                </div>
                <h4 class="mt-3">Informações</h4>
                <div class="px-2 py-2">
                    <table class="table  table-bordered table-striped">
                        <tbody>
                            <tr>
                                <th scope="row">Assunto:</th>
                                <td>Repositório Departamental</td>
                            </tr>
                            <tr>
                                <th scope="row">Data de publicação:</th>
                                <td>08/09/2020</td>
                            </tr>
                            <tr>
                                <th scope="row">Orientador(a):</th>
                                <td>Emmerson Santa Rita</td>
                            </tr>
                            <tr>
                                <th scope="row">Início:</th>
                                <td>02/03/2020</td>
                            </tr>
                            <tr>
                                <th scope="row">Fim</th>
                                <td>02/08/2020</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <h4 class="mt-3">Imagens</h4>
                <div class="px-2 py-2">
                    <div class="border rounded shadow">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators text-dark">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img class="d-block w-100" src="../img/tela1.png" alt="First slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="../img/tela2.png" alt="Second slide">
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block w-100" src="../img/tela3.png" alt="Third slide">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span><i class="fa fa-angle-left text-dark" aria-hidden="true"></i></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span><i class="fa fa-angle-right text-dark" aria-hidden="true"></i></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
                <h4 class="mt-3">Pré-vizualização</h4>
                <div class="px-2 py-2">
                    <div class="border rounded shadow">
                        <iframe src="../pdf/eMAGv31.pdf" width="100%" height="350px"></iframe>
                    </div>
                </div>

                <h4 class="mt-3">Disponível em:</h4>
                <div class="px-3 py-2">
                    <div class="form-row">
                        <div class="card mr-4" style="width: 12rem;">
                            <img class="card-img-top py-2 px-2" src="../img/github.svg" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Código fonte</h5>
                                <p class="card-text">Siga o link abaixo para baixar o código fonte completo do INFILE.</p>
                                <a href="#" class="card-link">Clique aqui</a>
                            </div>
                        </div>
                        <div class="card" style="width: 12rem;">
                            <img class="card-img-top px-2 py-2" src="../img/drive.png" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">Documentação</h5>
                                <p class="card-text">Siga o link abaixo para baixar a documentação do INFILE.</p>
                                <a href="#" class="card-link">Clique aqui</a>
                            </div>
                        </div>
                    </div>
                </div>
                <h4 class="mt-3">Autores</h4>
                <div class="px-2 py-2">
                    <div class="card-deck mb-3">
                        <div class="card shadow">
                            <div class="text-center">
                                <img src="../img/girl.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Ayumi Aoki</h5>
                                <p class="card-text text-center">Designer</p>
                                <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                            </div>
                        </div>
                        <div class="card shadow">
                            <div class="text-center">
                                <img src="../img/boy.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Francisco Jr.</h5>
                                <p class="card-text text-center">Back-End dev.</p>
                                <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                            </div>
                        </div>
                        <div class="card shadow">
                            <div class="text-center">
                                <img src="../img/boy.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Natan Viana</h5>
                                <p class="card-text text-center">Analyst</p> 
                                <a href="terceiroAno.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                            </div>
                        </div>

                        <div class="card shadow">
                            <div class="text-center">
                                <img src="../img/boy.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Gideão</h5>
                                <p class="card-text text-center">Back-End dev.</p>
                                <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="excluir" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Você realmente deseja excluir esse projeto?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <h5 class="mb-0"><b>INFILE</b> - REPOSITÓRIO DEPARTAMENTAL DO IFAM </h5>
                            <small>Todos os dados serão apagados e não será possível recupera-los.</small>
                            <div class="px-2 py-2">
                                <div class="border border-danger">
                                    <table class="table  table-bordered table-striped">
                                        <tbody>
                                            <tr>
                                                <th scope="row">Assunto:</th>
                                                <td>Repositório Departamental</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Data de publicação:</th>
                                                <td>08/09/2020</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Orientador(a):</th>
                                                <td>Emmerson Santa Rita</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Início:</th>
                                                <td>02/03/2020</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Fim</th>
                                                <td>02/08/2020</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">Estou ciente e quero continuar.</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" >Apagar</button>
                            <button type="button" class="btn btn-success" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="editar" tabindex="-1" role="dialog" aria-labelledby="editarr" aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">Editar projeto</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-row">
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
                            </form>
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
