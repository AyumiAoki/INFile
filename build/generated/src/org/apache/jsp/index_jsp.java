package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <title>INFILE</title>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/bootstrap/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\">\n");
      out.write("        <script src=\"js/jquery-3.4.1.min.js\"></script>\n");
      out.write("        <script src=\"js/popper.min.js\"></script>\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/fontawesome.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body class=\"bg-light\">\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("\n");
      out.write("        <div class=\"container\">\n");
      out.write("            <div class=\"card mb-3 mt-3 noZoom shadow\">\n");
      out.write("                <div class=\"row no-gutters\">\n");
      out.write("                    <div class=\"col-lg-3 my-auto\">\n");
      out.write("                        <div class=\"text-center\">\n");
      out.write("                            <img  src=\"img/computer.gif\" class=\"card-img card-width\" alt=\"...\">\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-9\">\n");
      out.write("                        <div class=\"card-body\">\n");
      out.write("                            <h4 class=\"card-title\"><b>Seja bem vindo ao INFILE!</b></h4>\n");
      out.write("                            <p class=\"card-text text-justify\">O nosso serviço tem como objetivo armazenar, preservar, disseminar e possibilitar o acesso aberto, como bem público global, à produção científica, acadêmica e técnica do curso técnico nível médio integrado em informática.</p>\n");
      out.write("                                <hr>\n");
      out.write("                            <h5 class=\"text-center\">Faça parte da nossa equipe, começe agora! <br> <a class=\"btn btn-success zoom text-white mt-2 shadow\" href=\"cadastro.jsp\">Começar <i class=\"fa fa-arrow-right\"></i></a></h5>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <h3 class=\"mt-3 mb-4\">Navegar <i class=\"fa fa-paper-plane\"></i></h3>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-auto mx-auto\">\n");
      out.write("                    <div class=\"card shadow mx-auto mb-2 card-width-perfil\">\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <img src=\"img/user.png\" class=\"card-img col-md-9 mt-2\" alt=\"...\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <h5 class=\"card-title text-center\">Autor</h5>\n");
      out.write("                                <p class=\"card-text\">Nesta sessão será apresentado autores de projetos.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <hr>\n");
      out.write("                            <div class=\"card-body text-right\">\n");
      out.write("\n");
      out.write("                                <a href=\"visitante/autor.jsp\" class=\"card-link\">Ver mais <i class=\"fas fa-arrow-right\"></i></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <a href=\"visitante/autor.jsp\" class=\"stretched-link\"></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-auto mx-auto\">\n");
      out.write("                    <div class=\"card shadow mx-auto mb-2 card-width-perfil\">\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <img src=\"img/titulo.png\" class=\"card-img col-md-9 mt-2\" alt=\"...\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <h5 class=\"card-title text-center\">Título</h5>\n");
      out.write("                                <p class=\"card-text\">Nesta sessão será apresentado título de projetos.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <hr>\n");
      out.write("                            <div class=\"card-body text-right\">\n");
      out.write("                                <a href=\"visitante/titulo.jsp\" class=\"card-link\">Ver mais <i class=\"fas fa-arrow-right\"></i></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <a href=\"visitante/titulo.jsp\" class=\"stretched-link\"></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-auto mx-auto\">\n");
      out.write("                    <div class=\"card shadow mx-auto mb-2 card-width-perfil\">\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <img src=\"img/pen.png\" class=\"card-img col-md-9 mt-2\" alt=\"...\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <h5 class=\"card-title text-center\">Produções</h5>\n");
      out.write("                                <p class=\"card-text\">Nesta sessão será apresentado todas as produções.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <hr>\n");
      out.write("                            <div class=\"card-body text-right\">\n");
      out.write("                                <a href=\"visitante/primeiroAno.jsp\">1° ano</a> | \n");
      out.write("                                <a href=\"visitante/segundoAno.jsp\">2° ano</a> |  \n");
      out.write("                                <a href=\"visitante/terceiroAno.jsp\">3° ano</a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-auto mx-auto\">\n");
      out.write("                    <div class=\"card shadow mx-auto mb-2 card-width-perfil\">\n");
      out.write("                        <div class=\"col-md-12\">\n");
      out.write("                            <div class=\"text-center\">\n");
      out.write("                                <img src=\"img/date.webp\" class=\"card-img col-md-9 mt-2\" alt=\"...\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"card-body\">\n");
      out.write("                                <h5 class=\"card-title text-center\">Data de Publicações</h5>\n");
      out.write("                                <p class=\"card-text\">Sessão de publicações disponíveis.</p>\n");
      out.write("                            </div>\n");
      out.write("                            <hr>\n");
      out.write("                            <div class=\"card-body text-right\">\n");
      out.write("                                <a href=\"visitante/dataPublicacao.jsp\" class=\"card-link\">Ver mais <i class=\"fas fa-arrow-right\"></i></a>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <a href=\"visitante/dataPublicacao.jsp\" class=\"stretched-link\"></a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
