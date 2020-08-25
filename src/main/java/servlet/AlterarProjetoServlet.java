package servlet;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.Projeto;
import model.dao.GenericDAO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author rivail
 */
public class AlterarProjetoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idUser = null;
        String value = null;
        String nome = null;
        String orientador = null;
        String drt_img = null;
        String arquivo_projeto = null;
        String git = null;
        String drive = null;
        String descricao = null;
        String data = null;
        String serie = null;
        String id = null;
        String inicio = null;
        String fim = null;
        String diretorio_projeto = this.getServletContext().getRealPath("/") + "../../src/main/webapp/salvo";

        //Read archive
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        File uploadedFile = null;
        File imagem = null;
        File projeto = null;

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
                        System.out.println("file name:" + item.getName());
                        

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
                    } else {
                        String name = item.getFieldName();
                        value = item.getString();
                        if (name.equals("idUser")) {
                            idUser = value;
                        }
                        
                        if (name.equals("id")) {
                            id = value;
                        }
                        
                        if (name.equals("nome")) {
                            nome = value;
                        }

                        if (name.equals("orientador")) {
                            orientador = value;
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

        GenericDAO<Projeto> gp = new GenericDAO<>();
        Projeto p = gp.findById2(Projeto.class, Long.parseLong(id));
        
        if(drt_img != null){
            p.setImg(drt_img);
        }
        if(arquivo_projeto != null){
            p.setDocumentacao(arquivo_projeto);
        }
        p.setAssunto(nome);
        p.setOrientador(orientador);
        p.setGit(git);
        p.setDrive(drive);
        p.setDescricao(descricao.getBytes());
        p.setData(data);
        p.setSerie(serie);
        p.setInicio(inicio);
        p.setFim(fim);

        gp.saveOrUpdate(p);

        response.sendRedirect("../infile/usuario/perfil.jsp?userId=" + idUser);
    }
}
