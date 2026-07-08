package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.HostEntity;
import com.xworkz.confynex.entity.OTPEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

@Repository
public class OTPDAOImpl implements OTPDAO{

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public HostEntity checkingExistUserInDBByEmail(String email) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("findByEmail");
            query.setParameter("byEmail",email);
            HostEntity singleResult =(HostEntity) query.getSingleResult();
            return singleResult;

        }catch (Exception e){
            System.out.println("Error in 'checkingExistUserInDBByEmail' method "+e.getMessage());
            return null;
        }
    }

    @Override
    public void saveOtp(OTPEntity otpEntity) {
        EntityManager em = entityManagerFactory.createEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // If OTP already exists → update
            Query query = em.createQuery("SELECT o FROM OtpEntity o WHERE o.email=:email");
            query.setParameter("email", otpEntity.getEmail());

            OTPEntity existing = null;
            try {
                existing = (OTPEntity) query.getSingleResult();
            } catch (Exception ignored) {}

            if (existing != null) {
                existing.setOtp(otpEntity.getOtp());
                existing.setExpiryTime(otpEntity.getExpiryTime());
                existing.setAttempts(0);
                em.merge(existing);
            } else {
                em.persist(otpEntity);
            }

            tx.commit();
        } finally {
            em.close();
        }


    }

    @Override
    public OTPEntity findByEmail(String email) {

        EntityManager em = entityManagerFactory.createEntityManager();
        try {
            Query query = em.createQuery("SELECT o FROM OtpEntity o WHERE o.email=:email");
            query.setParameter("email", email);
            return (OTPEntity) query.getSingleResult();
        } catch (Exception e) {
            return null;
        } finally {
            em.close();
        }
    }
}
