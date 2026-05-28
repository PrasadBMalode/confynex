package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class HostSignInDAOImpl implements HostSignInDAO {

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public HostEntity findByEmailSignIn(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        try {
            Query query = entityManager.createNamedQuery("findByEmail");
            query.setParameter("byEmail", email);

            return (HostEntity) query.getSingleResult();

        } catch (Exception e) {
            System.out.println(e.getMessage());
            return null;

        } finally {
            entityManager.close();
        }
    }

    @Override
    public void updateUser(HostEntity user) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(user);
            transaction.commit();
        } catch (Exception e) {
            transaction.rollback();
        } finally {
            entityManager.close();
        }
    }
}
