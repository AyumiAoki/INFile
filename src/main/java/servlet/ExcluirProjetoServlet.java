package servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.AutorProjeto;
import model.bean.Projeto;
import model.bean.Usuario;
import model.dao.AutorProjetoDAO;
import model.dao.GenericDAO;

/**
 *
 * @author rivail
 */
public class ExcluirProjetoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Usuario logado = (Usuario) request.getSession().getAttribute("usuario");
        AutorProjetoDAO apDAO = new AutorProjetoDAO();
        List<AutorProjeto> listAp = apDAO.getIdAutores(Long.parseLong(request.getParameter("idPro")));

        for (AutorProjeto ap : listAp) {
            GenericDAO<AutorProjeto> autorG = new GenericDAO<>();
            AutorProjeto autorProjeto = new AutorProjeto();
            System.out.println("id: " + ap.getId() + ", idProjeto: " + ap.getIdProjeto() + " ,mat " + ap.getMatUsuario());
            autorProjeto = autorG.findById2(AutorProjeto.class, ap.getId());
            autorG.remove(autorProjeto);
        }

        GenericDAO<Projeto> projetoG = new GenericDAO<>();
        Projeto projeto = new Projeto();
        projeto = projetoG.findById2(Projeto.class, Long.parseLong(request.getParameter("idPro")));
        projetoG.remove(projeto);
        
        response.sendRedirect("../infile/usuario/perfil.jsp?userId=" + logado.getId());
    }
}
