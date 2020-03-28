<%-- 
    Document   : login
    Created on : 24/03/2020, 21:52:33
    Author     : paulo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>INFILE</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                <h4 class="mb-4">Publicações do terceiro ano</h4>
                <div class="row">
                    <div class="form-group col-md-3">
                        <select id="inputState" class="form-control">
                            <option>Últimas publicações</option>
                            <option>Autor</option>
                            <option>Título</option>
                        </select>
                    </div>
                    <div class="col-md-9">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Digite aqui..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-outline-secondary" type="button">Buscar</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-3 shadow">
                    <div class="row no-gutters">
                        <div class="col-md-3 bg-light border row align-items-center ml-0">
                            <div class="text-center bg-light">
                                <img src="../img/lupa.png" class="card-img col-md-9" alt="...">
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
                    <a href="verOutraPublicacao.jsp" class="stretched-link"></a>
                </div>

                <div class="card mb-3 shadow">
                    <div class="row no-gutters">
                        <div class="col-md-3 bg-light border row align-items-center ml-0">
                            <div class="text-center bg-light">
                                <img src="../img/lupa.png" class="card-img col-md-9" alt="...">
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
                    <a href="verOutraPublicacao.jsp" class="stretched-link"></a>
                </div>

                <div class="card mb-3 shadow">
                    <div class="row no-gutters">
                        <div class="col-md-3 bg-light border  row align-items-center ml-0">
                            <div class="text-center">
                                <img src="../img/lupa.png" class="card-img col-md-9" alt="...">
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
                    <a href="verOutraPublicacao.jsp" class="stretched-link"></a>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>


