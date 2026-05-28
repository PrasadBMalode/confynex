package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.Transactional;

@Repository
@Transactional
public class CoordinatorDAOImpl implements CoordinatorDAO {

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void saveDelegate(CoordinatorEntity coordinatorEntity) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            entityManager.persist(coordinatorEntity);

            entityManager.getTransaction().commit();

            System.out.println("Coordinator Saved");

        } catch (Exception e) {

            entityManager.getTransaction().rollback();

            e.printStackTrace();

        } finally {

            entityManager.close();
        }
    }
}