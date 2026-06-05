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
            System.out.println("Saving Delegate");

            System.out.println(delegateEntity.getDelegateName());

            em.persist(delegateEntity);

            em.flush();

            System.out.println("Delegate Saved");
            em.getTransaction().commit();

        } catch (Exception e) {

            System.out.println("Delegate Save Failed");

            e.printStackTrace();

            em.getTransaction().rollback();
        }finally {
            em.close();
        }
    }
}