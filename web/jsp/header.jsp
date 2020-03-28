<nav class="navbar navbar-expand-lg navbar-light bg-green shadow-sm mb-4">
    <a class="navbar-brand text-white" href="principal.jsp">
        <img src="../img/logo.png" class="d-inline-block align-baseline" height="16" width="97"> 
    </a>
    <a class="navbar-toggler text-white border-light" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fa fa-bars fa-lg"></i>
    </a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link text-white" href="principal.jsp"><i class="fas fa-home"></i> Página Inicial</a>
            </li>
            <li class="nav-item">
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle text-white" href="" id="dropdownMenu2" data-toggle="dropdown">
                        <i class="fa fa-paper-plane"></i> Navegar
                    </a>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                        <a class="dropdown-item" href="autor.jsp">Autor</a>
                        <a class="dropdown-item" href="dataPublicacao.jsp">Data de publicação</a>
                        <a class="dropdown-item" href="">Termo de autorização</button>
                        <a class="dropdown-item" href="titulo.jsp">Título</a>
                    </div>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href="../ajuda.jsp">
                    <i class="fa fa-question"></i> Ajuda
                </a>
            </li>
        </ul>

        <div class="input-group col-md-3">
            <input type="text" class="form-control" placeholder="Digite aqui..." aria-label="Recipient's username" aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-light border" type="button">Buscar</button>
            </div>
        </div>
        <div class="dropdown">
            <a  id="dropdownMenuButton" href="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <img src="../img/girl.png" class="rounded-circle border border-light shadow-sm" width="45" height="45"> 
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="perfil.jsp"><i class="fa fa-user"></i> Ver perfil</a>
                <a class="dropdown-item" href="../index.jsp"><i class="fa fa-sign-out-alt"></i> Sair</a>
            </div>
        </div>
    </div>
</nav>