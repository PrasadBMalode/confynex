package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.DelegateEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class DelegateDAOImpl
        implements DelegateDAO {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public void saveDelegate(DelegateEntity delegateEntity) {

        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(delegateEntity);
            em.getTransaction().commit();

        } catch (Exception e) {
            em.getTransaction().rollback();
            e.printStackTrace();

        } finally {
            em.close();
        }
    }
}