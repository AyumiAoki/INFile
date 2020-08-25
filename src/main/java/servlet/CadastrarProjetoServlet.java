package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.AutorProjeto;
import model.bean.Projeto;
import model.dao.GenericDAO;
import model.dao.ProjetoDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author rivail
 */
public class CadastrarProjetoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idUser = null;
        String value = null;
        String nome = null;
        ArrayList<String> autor = new ArrayList<>();
        String orientador = null;
        String drt_img = null;
        String arquivo_projeto = null;
        String git = null;
        String drive = null;
        String descricao = null;
        String data = null;
        String serie = null;
        String inicio = null;
        String fim = null;
        String drt_termo = null;
        String diretorio_projeto = this.getServletContext().getRealPath("/") + "../../src/main/webapp/salvo";

        //Read archive
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        File uploadedFile = null;
        File imagem = null;
        File projeto = null;
        File termo = null;

        if (isMultipart) {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);

            try {
                List items = upload.parseRequest(request);
                Iterator iterator = items.iterator();
                while (iterator.hasNext()) {
                    FileItem item = (FileItem) iterator.next();

                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        File path = new File(diretorio_projeto);
                        String name = item.getFieldName();

                        if (name.equals("termo")) {
                            drt_termo = fileName;
                            termo = new File(path + "/" + fileName);
                            System.out.println(termo.getAbsolutePath());
                            item.write(termo);
                        } else {
                            if (name.equals("projeto")) {
                                arquivo_projeto = fileName;
                                projeto = new File(path + "/" + fileName);
                                System.out.println(projeto.getAbsolutePath());
                                item.write(projeto);
                            } else {
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
                            }
                        }
                    } else {
                        String name = item.getFieldName();
                        value = item.getString();
                        if (name.equals("idUser")) {
                            idUser = value;
                        }

                        if (name.equals("nome")) {
                            nome = value;
                        }

                        if (name.equals("orientador")) {
                            orientador = value;
                        }

                        if (name.equals("myCountry[]")) {
                            autor.add(value);
                        }

                        if (name.equals("git")) {
                            git = value;
                        }

                        if (name.equals("drive")) {
                            drive = value;
                        }

                        if (name.equals("descricao")) {
                            descricao = value;
                        }

                        if (name.equals("data")) {
                            data = value;
                        }

                        if (name.equals("serie")) {
                            serie = value;
                        }

                        if (name.equals("inicio")) {
                            inicio = value;
                        }

                        if (name.equals("fim")) {
                            fim = value;
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

        //data
        //projeto
        Projeto p = new Projeto();

        p.setAssunto(nome);
        p.setOrientador(orientador);
        p.setImg(drt_img);
        p.setGit(git);
        p.setDrive(drive);
        p.setDocumentacao(arquivo_projeto);
        p.setDescricao(descricao.getBytes());
        p.setData(data);
        p.setSerie(serie);
        p.setInicio(inicio);
        p.setFim(fim);
        p.setTermo(drt_termo);

        GenericDAO<Projeto> gp = new GenericDAO<>();
        gp.saveOrUpdate(p);

        //ProjetoAutor
        ProjetoDAO projetoDAO = new ProjetoDAO();
        Long idProjeto = projetoDAO.getIdByName(nome);

        for (String umAutor : autor) {
            GenericDAO<AutorProjeto> gap = new GenericDAO<>();
            AutorProjeto ap = new AutorProjeto();

            ap.setIdProjeto(idProjeto);
            ap.setMatUsuario(umAutor);
            gap.saveOrUpdate(ap);
        }

        response.sendRedirect("../infile/usuario/perfil.jsp?userId=" + idUser);
    }
}
