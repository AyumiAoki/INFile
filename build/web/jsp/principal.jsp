<%-- 
    Document   : index
    Created on : 24/03/2020, 21:03:04
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
            <div class="col-md-12 mx-auto card noZoom mb-3 mt-3 shadow">
                <div class="row no-gutters">
                    <div class="col-md-3 px-0 py-0 my-auto">
                        <div class="mx-auto">
                            <img  src="../img/pen.gif" class="card-img" alt="...">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card-body">
                            <h4 class="card-title"><b>Contribua com a pesquisa!</b></h4>
                            <p class="card-text">Crie projetos com a nossa plataforma e seja um infile. Crie projetos com a nossa plataforma e seja um infile. Crie projetos com a nossa plataforma e seja um infile.</p>
                        </div>
                    </div>
                    <div class="col-md-3 my-auto">
                        <h5 class="text-center">Crie seu projeto agora! <br> <a class="btn btn-warning text-white mt-2 shadow border border-light zoom" href="cadastroProjeto.jsp">Criar <i class="fa fa-plus"></i></a></h5>
                    </div>
                </div>
            </div>
            <h4 class="mt-4 mb-4"><i class="fa fa-star"></i> Produções</h4>
            <div class="card-deck mb-3">
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/c.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Primeiro ano</h5>
                            <hr>
                            <div class="text-right">
                                <a href="primeiroAno.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/java.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Segundo ano</h5>
                            <hr>
                            <div class="text-right">
                                <a href="segundoAno.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/html.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Terceiro ano</h5>
                            <hr>
                            <div class="text-right">
                                <a href="terceiroAno.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h4 class="mt-5 mb-4"><i class="fa fa-circle fa-sm"></i> Últimas publicações</h4>
            <div class="card mb-3 shadow">
                <div class="row no-gutters">
                    <div class="col-md-3 border bg-light row align-items-center ml-0">
                        <div class="text-center">
                            <img src="../img/lupa.png" class="card-img col-md-9 text-center" alt="...">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Rivail linhas aereas: Sistema de controle de registro de ponto de funcionários</h5>
                            <p class="card-text">Castro, Kallyne E. M.; Pastor, Luyzie I. P.</p>
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
                            <img src="../img/lupa.png" class="card-img col-md-9 " alt="...">
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">Book Store: Sistema de controle de biblioteca</h5>
                            <p class="card-text">Santana, Ayumi A; Oliveira, Cecília N.; Lima, Dirley S.; Silva, Gabrielle M. </p>
                            <p class="card-text"><small class="text-muted">9 minutos atrás</small></p>
                        </div>
                    </div>
                    <a href="verOutraPublicacao.jsp" class="stretched-link"></a>
                </div>
            </div>

            <h4 class="mt-5 mb-4"><i class="fa fa-users"></i> Autores</h4>
            <div class="card-deck mb-3">
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/boy.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Affonso Henrique</h5>
                            <p class="card-text">Descrição do perfil do usuário, lala, lala...</p>
                        </div>
                        <div class="card-body text-right">
                            <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                        </div>
                    </div>
                </div>
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/girl.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Aline Alves</h5>
                            <p class="card-text">Descrição do perfil do usuário, lala, lala...</p>
                        </div>
                        <div class="card-body text-right">
                            <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                        </div>
                    </div>
                </div>
                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/girl.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Ayumi Aoki</h5>
                            <p class="card-text">Descrição do perfil do usuário, lala, lala...</p>
                        </div>
                        <div class="card-body text-right">
                            <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                        </div>
                    </div>
                </div>

                <div class="card shadow">
                    <div class="col-md-12">
                        <div class="text-center">
                            <img src="../img/boy.png" class="card-img col-md-9 mt-2" alt="...">
                        </div>
                        <div class="card-body">
                            <h5 class="card-title text-center">Carlos Felipe</h5>
                            <p class="card-text">Descrição do perfil do usuário, lala, lala...</p>
                        </div>
                        <div class="card-body text-right">
                            <a href="verOutroPerfil.jsp" class="btn btn-primary btn-block stretched-link">Ver perfil <i class="fas fa-external-link-alt"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 text-center border-bottom">
                <a href="autor.jsp">Ver todos <i class="fa fa-arrow-right"></i></a>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </body>
</html>

