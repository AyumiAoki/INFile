package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class ConnectionFactory {

    private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("infile_sqlPU");

    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

}
