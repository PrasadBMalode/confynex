package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;

@Repository
public class CoordinatorDAOImpl implements CoordinatorDAO {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public boolean saveCoordinator(
            CoordinatorEntity coordinatorEntity) {

        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            System.out.println("Persisting Coordinator...");
            em.persist(coordinatorEntity);
            em.flush();

            System.out.println("Generated ID = " + coordinatorEntity.getId());
            em.getTransaction().commit();
            System.out.println("Coordinator Saved Successfully");
            return true;

        } catch (Exception e) {
            System.out.println("Coordinator Save Failed");
            e.printStackTrace();
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            return false;

        } finally {
            em.close();
        }
    }

    @Override
    public CoordinatorEntity checkExistCoordinatorByEmail(String email) {
        EntityManager em = emf.createEntityManager();

        try {
            return em.createQuery("SELECT c FROM CoordinatorEntity c WHERE c.email = :email", CoordinatorEntity.class).setParameter("email", email).getSingleResult();

        } catch (NoResultException e) {
            return null;

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        } finally {
            em.close();
        }
    }
}