package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Usuario;
import model.dao.GenericDAO;
import model.dao.UsuarioDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author rivail
 */
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getSession().setAttribute("usuario", null);
        response.sendRedirect("../infile/index.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String status = null;
        status = request.getParameter("status");

        if (status != null && status.equals("cadastrar")) {

            UsuarioDAO udao = new UsuarioDAO();
            boolean cadastrado = udao.verificarCadastro(request.getParameter("email"), request.getParameter("matricula"));

            if (cadastrado) {
                // caso usuário cadastrado
                response.sendRedirect("../infile/cadastro.jsp?status=erro");
            } else {
                Usuario user = new Usuario();
                GenericDAO<Usuario> dao = new GenericDAO<>();

                user.setNome(request.getParameter("nome"));
                user.setEmail((request.getParameter("email")));
                user.setMatricula(request.getParameter("matricula"));
                user.setSenha(request.getParameter("senha"));
                user.setArquivo_imagem("../img/0_DEFAULT.jpg");

                dao.saveOrUpdate(user);
                response.sendRedirect("../infile/index.jsp");
            }

        } else {
            if (status != null && status.equals("login")) {

                String email = request.getParameter("email");
                String senha = request.getParameter("senha");
                UsuarioDAO userDao = new UsuarioDAO();

                Long idUser = userDao.login(email, senha);

                Usuario user;

                if (idUser == null) {
                    response.sendRedirect("/infile/login.jsp?status=erro");
                } else if (idUser == -1) {
                    response.sendRedirect("/infile/login.jsp?status=erro");
                } else {
                    GenericDAO<Usuario> userDao2 = new GenericDAO<>();
                    user = userDao2.findById(Usuario.class, idUser);
                    if (user != null) {
                        request.getSession().setAttribute("usuario", user);
                        response.sendRedirect("/infile/usuario/principal.jsp");
                    } else {
                        response.sendRedirect("/infile/login.jsp?status=erro");
                    }
                }
            } else {
                String value = null;
                String nome = null;
                String bio = null;
                String drt_img = null;
                String regiao = null;
                String git = null;
                String lattes = null;
                String diretorio_projeto = this.getServletContext().getRealPath("/") + "../../src/main/webapp/salvo";
                String id = null;

                //Read archive
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);

                File uploadedFile = null;
                File imagem = null;

                if (isMultipart) {
                    FileItemFactory factory = new DiskFileItemFactory();
                    ServletFileUpload upload = new ServletFileUpload(factory);

                    try {
                        List items = upload.parseRequest(request);
                        Iterator iterator = items.iterator();
                        while (iterator.hasNext()) {
                            FileItem item = (FileItem) iterator.next();

                            if (!item.isFormField() && !item.getName().equals("null") && item.getName() != null && !item.getName().equals("")) {
                                String fileName = item.getName();
                                File path = new File(diretorio_projeto);
                                String name = item.getFieldName();

                                if (name.equals("imagem")) {
                                    drt_img = fileName;
                                    imagem = new File(path + "/" + fileName);
                                    System.out.println(imagem.getAbsolutePath());
                                    item.write(imagem);
                                } else {
                                    uploadedFile = new File(path + "/" + fileName);
                                    System.out.println(uploadedFile.getAbsolutePath());
                                    item.write(uploadedFile);
                                }
                            } else {
                                String name = item.getFieldName();
                                value = item.getString();
                                if (name.equals("id")) {
                                    id = value;
                                }

                                if (name.equals("nome")) {
                                    nome = value;
                                }

                                if (name.equals("bio")) {
                                    bio = value;
                                }

                                if (name.equals("regiao")) {
                                    regiao = value;
                                }

                                if (name.equals("git")) {
                                    git = value;
                                }

                                if (name.equals("lattes")) {
                                    lattes = value;
                                }
                                // **************************************************
                                // Process your name and value pairs here! *****
                                // **************************************************
                                System.out.println("Found field " + name + " and value " + value);
                            }
                        }
                    } catch (FileUploadException e) {
                        e.printStackTrace();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }

                GenericDAO<Usuario> gu = new GenericDAO<>();
                Usuario u = (Usuario) request.getSession().getAttribute("usuario");

                u.setNome(nome);
                u.setBio(bio.getBytes());
                u.setRegiao(regiao);
                u.setGit(git);
                u.setLattes(lattes);
                if (drt_img != null) {
                    u.setArquivo_imagem(drt_img);
                }
                gu.saveOrUpdate(u);

                response.sendRedirect("../infile/usuario/perfil.jsp?userId=" + id);
            }
        }

    }
}
