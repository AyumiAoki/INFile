package model.dao;

import java.util.List;
import javax.persistence.EntityManager;
import model.bean.Usuario;
import org.hibernate.Query;
import util.ConnectionFactory;

/**
 *
 * @author rivail
 */
public class UsuarioDAO {

    public Long login(String email, String senha) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Usuario user;
        try {
            manager.getTransaction().begin();
            query = (Query) manager.createQuery("from Usuario user where user.email =:email OR user.matricula =:email")
                    .setParameter("email", email);
            user = (Usuario) query.getSingleResult();
            manager.getTransaction().commit();
            if (user.getSenha().equals(senha)) {
                return user.getId();
            } else {
                return new Long(-1);
            }
        } catch (Exception e) {
            manager.getTransaction().rollback();
            return null;
        }
    }

    public boolean verificarCadastro(String email, String matricula) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Usuario user;
        try {
            manager.getTransaction().begin();
            query = (Query) manager.createQuery("from Usuario user where user.email =:email OR user.matricula =:matricula")
                    .setParameter("email", email).setParameter("matricula", matricula);
            user = (Usuario) query.getSingleResult();
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            return false; // não cadastrado
        }
        // cadastrado
        return true;
    }

    public List<Usuario> getUsers(String matricula) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        List<Usuario> users = null;
        try {
            users = manager.createQuery("FROM Usuario p where p.matricula !=:matricula")
                    .setParameter("matricula", matricula).getResultList();
        } catch (Exception e) {
            System.err.println(e);
        } finally {
            manager.close();
        }
        return users;
    }
}
