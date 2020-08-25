package model.dao;

import javax.persistence.EntityManager;
import util.ConnectionFactory;

public class GenericDAO<T extends BaseEntity> {
    
    public T findById(Class<T> clazz, Long id) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        return manager.find(clazz, id);
    }

    public void saveOrUpdate(T obj) {
        EntityManager manager = ConnectionFactory.getEntityManager();
        try {
            manager.getTransaction().begin();
            if (obj.getId() == null) {
                manager.persist(obj);
            } else {
                manager.merge(obj);
            }
            manager.getTransaction().commit();
        } catch (Exception e) {
            manager.getTransaction().rollback();
        }
    }

    private final static EntityManager manager = ConnectionFactory.getEntityManager();

    public T findById2(Class<T> clazz, Long id) {
        if (manager.getTransaction().isActive()) {
            return manager.find(clazz, id);
        } else {
            manager.getTransaction().begin();
            return manager.find(clazz, id);
        }
    }

    public void remove(T t) {
        if (manager.getTransaction().isActive()) {
            manager.merge(t);
            manager.remove(t);
            manager.getTransaction().commit();
        }else{
            manager.getTransaction().begin();
            manager.merge(t);
            manager.remove(t);
            manager.getTransaction().commit();
        }
    }

}
