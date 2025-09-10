package config;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {

    private static final String PERSISTENCE_UNIT_NAME = "my-persistence-unit";
    private static EntityManagerFactory emf;

    public static EntityManagerFactory getEntityManagerFactory() {
        if (emf == null) {
            emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        }
        return emf;
    }

    public static void shutdown() {
        if (emf != null) {
            emf.close();
        }
    }
}