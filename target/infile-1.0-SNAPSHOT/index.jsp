<%-- 
    Document   : index
    Created on : 24/03/2020, 21:03:04
    Author     : ayumi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>INFILE</title>
    </head>
    <jsp:include page="head.jsp"/>
    <body class="bg-light">
        <jsp:include page="header.jsp"/>
        <div class="container">
            <div class="card mb-3 mt-3 noZoom shadow">
                <div class="row no-gutters">
                    <div class="col-lg-3 my-auto">
                        <div class="text-center">
                            <img  src="img/computer.gif" class="card-img card-width" alt="...">
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="card-body">
                            <h4 class="card-title"><b>Seja bem vindo ao INFILE!</b></h4>
                            <p class="card-text text-justify">O nosso serviço tem como objetivo armazenar, preservar, disseminar e possibilitar o acesso aberto, como bem público global, à produção científica, acadêmica e técnica do curso técnico nível médio integrado em informática.</p>
                            <hr>
                            <h5 class="text-center">Faça parte da nossa equipe, começe agora! <br> 
                                <a class="btn btn-outline-success zoom  mt-2 shadow" href="cadastro.jsp">Começar <i class="fa fa-arrow-right"></i></a>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

            <h3 class="mt-3 mb-4">Navegar <i class="fa fa-paper-plane"></i></h3>
            <div class="row">
                <div class="col-auto mx-auto">
                    <div class="card shadow mx-auto mb-2 card-width-perfil">
                        <div class="col-md-12">
                            <div class="text-center">
                                <img src="img/user.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Autor</h5>
                                <p class="card-text">Nesta sessão será apresentado autores de projetos.</p>
                            </div>
                            <hr>
                            <div class="card-body text-right">
                                <a href="visitante/autor.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <a href="visitante/autor.jsp" class="stretched-link"></a>
                    </div>
                </div>
                <div class="col-auto mx-auto">
                    <div class="card shadow mx-auto mb-2 card-width-perfil">
                        <div class="col-md-12">
                            <div class="text-center">
                                <img src="img/titulo.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Título</h5>
                                <p class="card-text">Nesta sessão será apresentado título de projetos.</p>
                            </div>
                            <hr>
                            <div class="card-body text-right">
                                <a href="visitante/titulo.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <a href="visitante/titulo.jsp" class="stretched-link"></a>
                    </div>
                </div>
                <div class="col-auto mx-auto">
                    <div class="card shadow mx-auto mb-2 card-width-perfil">
                        <div class="col-md-12">
                            <div class="text-center">
                                <img src="img/pen.png" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Produções</h5>
                                <p class="card-text">Nesta sessão será apresentado todas as produções.</p>
                            </div>
                            <hr>
                            <div class="card-body text-right">
                                <a href="visitante/serie.jsp?serie=1° Ano">1° ano</a> | 
                                <a href="visitante/serie.jsp?serie=2° Ano">2° ano</a> |  
                                <a href="visitante/serie.jsp?serie=3° Ano">3° ano</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-auto mx-auto">
                    <div class="card shadow mx-auto mb-2 card-width-perfil">
                        <div class="col-md-12">
                            <div class="text-center">
                                <img src="img/date.webp" class="card-img col-md-9 mt-2" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title text-center">Data de Publicações</h5>
                                <p class="card-text">Sessão de publicações disponíveis.</p>
                            </div>
                            <hr>
                            <div class="card-body text-right">
                                <a href="visitante/dataPublicacao.jsp" class="card-link">Ver mais <i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                        <a href="visitante/dataPublicacao.jsp" class="stretched-link"></a>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>

