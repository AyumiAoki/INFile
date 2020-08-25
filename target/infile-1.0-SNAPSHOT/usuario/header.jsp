<%@page import="model.bean.Usuario"%>
<nav class="navbar navbar-expand-lg navbar-light bg-green shadow-sm mb-4">
    <a class="navbar-brand text-white" href="principal.jsp">
        <img src="../img/logo_1.png" class="d-inline-block align-baseline" height="16" width="97"> 
    </a>  
    <a  href="" class="navbar-toggler text-white border-light" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fa fa-bars fa-lg"></i>
    </a>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
        <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
            <li class="nav-item">
                <a class="nav-link text-white" href="principal.jsp"><i class="fas fa-home"></i> Página Inicial</a>
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
                <img src="../salvo/${usuario.arquivo_imagem}" class="rounded-circle  shadow-sm" width="45" height="45"> 
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="perfil.jsp?userId=${usuario.id}"><i class="fa fa-user"></i> Ver perfil</a>
                <form method="get"  action="/infile/UsuarioServlet">
                    <button class="dropdown-item"><i class="fa fa-sign-out-alt"></i> Sair</button>
                </form>
            </div>
        </div>
    </div>
</nav>
<%
    Usuario u = (Usuario) request.getSession().getAttribute("usuario");
%>
<% if (u == null) { %>
<script>
    window.location.href = "../sessao.jsp";
</script>
<% }%>