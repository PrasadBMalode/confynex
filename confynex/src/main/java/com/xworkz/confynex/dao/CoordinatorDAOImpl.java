package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class CoordinatorDAOImpl
        implements CoordinatorDAO {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public void saveCoordinator(CoordinatorEntity coordinatorEntity) {

        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            System.out.println("Persisting Coordinator");

            em.persist(coordinatorEntity);

            em.flush();

            System.out.println("Generated ID = " +
                    coordinatorEntity.getId());
            em.getTransaction().commit();
            System.out.println("Coordinator Saved");

        } catch (Exception e) {

            System.out.println("Coordinator Save Failed");

            e.printStackTrace();

            em.getTransaction().rollback();
        } finally {
            em.close();
        }
    }
}