package model.dao;

import javax.persistence.EntityManager;
import model.bean.Projeto;
import org.hibernate.Query;
import util.ConnectionFactory;

/**
 *
 * @author rivail
 */
public class ProjetoDAO {

    public Long getIdByName(String nome) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        Query query;
        Projeto projeto;
        try {
            manager.getTransaction().begin();
            query = (Query) manager.createQuery("from Projeto p where p.assunto =:nome")
                    .setParameter("nome", nome);
            projeto = (Projeto) query.getSingleResult();
            manager.getTransaction().commit();
            return projeto.getId();
        } catch (Exception e) {
            manager.getTransaction().rollback();
            return null;
        }
    }
}
