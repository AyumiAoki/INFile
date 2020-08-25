package model.dao;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import model.bean.AutorProjeto;
import model.bean.Projeto;
import model.bean.Usuario;
import org.hibernate.Query;
import util.ConnectionFactory;

/**
 *
 * @author rivail
 */
public class AutorProjetoDAO {

    public List<AutorProjeto> getAutorProjeto(String matricula) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        List<AutorProjeto> autorProjeto = null;
        try {
            autorProjeto = manager.createQuery("FROM AutorProjeto p where p.matUsuario =:matricula")
                    .setParameter("matricula", matricula).getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return autorProjeto;
    }

    public List<Projeto> getProjetos(String matricula) {
        List<Projeto> projetos = new ArrayList<>();
        List<AutorProjeto> listAp = getAutorProjeto(matricula);

        for (AutorProjeto a : listAp) {
            EntityManager manager = ConnectionFactory.getEntityManager();
            Query query;
            Projeto projeto;
            try {
                manager.getTransaction().begin();
                query = (Query) manager.createQuery("from Projeto p where p.id =:idPro")
                        .setParameter("idPro", a.getIdProjeto());
                projeto = (Projeto) query.getSingleResult();
                manager.getTransaction().commit();
                projetos.add(projeto);
            } catch (Exception e) {
                manager.getTransaction().rollback();
                return null;
            }
        }
        return projetos;
    }

    public List<AutorProjeto> getIdAutores(Long idProjeto) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        List<AutorProjeto> autoresId = null;
        try {
            autoresId = manager.createQuery("FROM AutorProjeto p where p.idProjeto =:id")
                    .setParameter("id", idProjeto).getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return autoresId;
    }

    public List<Usuario> getAutores(Long idProjeto) {
        List<Usuario> autores = new ArrayList<>();
        List<AutorProjeto> autoresId = getIdAutores(idProjeto);

        for (AutorProjeto a : autoresId) {
            EntityManager manager = ConnectionFactory.getEntityManager();
            Query query;
            Usuario u = new Usuario();
            try {
                manager.getTransaction().begin();
                query = (Query) manager.createQuery("from Usuario p where p.matricula =:mat")
                        .setParameter("mat", a.getMatUsuario());
                u = (Usuario) query.getSingleResult();
                manager.getTransaction().commit();
                autores.add(u);
            } catch (Exception e) {
                manager.getTransaction().rollback();
                return null;
            }
        }
        return autores;
    }

    public Projeto getProjeto(Long idProjeto) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Projeto projeto;
        try {
            manager.getTransaction().begin();
            query = (Query) manager.createQuery("from Projeto p where p.id =:idPro")
                    .setParameter("idPro", idProjeto);
            projeto = (Projeto) query.getSingleResult();
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            return null;
        }
        return projeto;
    }

    public List<Projeto> getProjetosBySerie(String serie) {
        List<Projeto> projetos = new ArrayList<>();
        EntityManager manager = ConnectionFactory.getEntityManager();
        try {
            projetos = manager.createQuery("FROM Projeto p where p.serie =:serie")
                    .setParameter("serie", serie).getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return projetos;
    }
    
    public List<Projeto> getAllProjeto() {
        List<Projeto> projetos = new ArrayList<>();
        EntityManager manager = ConnectionFactory.getEntityManager();
        try {
            projetos = manager.createQuery("FROM Projeto").getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return projetos;
    }
}
