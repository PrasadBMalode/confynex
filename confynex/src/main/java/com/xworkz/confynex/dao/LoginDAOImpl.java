package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class LoginDAOImpl implements LoginDAO {

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public HostEntity findByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {

            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("findByEmail");
            query.setParameter("byEmail", email);
            HostEntity singleResult = (HostEntity) query.getSingleResult();
            return singleResult;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }finally {
            entityManager.close();
        }
    }
}
