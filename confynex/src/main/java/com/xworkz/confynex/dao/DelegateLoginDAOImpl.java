package com.xworkz.confynex.dao;

import com.xworkz.confynex.dao.DelegateLoginDAO;
import com.xworkz.confynex.entity.DelegateLoginEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

@Repository
public class DelegateLoginDAOImpl implements DelegateLoginDAO {

    @Autowired
    private EntityManagerFactory emf;

    @Override
    public boolean saveLogin(DelegateLoginEntity entity) {

        EntityManager em = emf.createEntityManager();

        try {
            em.getTransaction().begin();

            em.persist(entity);

            em.getTransaction().commit();

            return true;

        } catch (Exception e) {

            em.getTransaction().rollback();
            e.printStackTrace();

        } finally {

            em.close();
        }

        return false;
    }

    @Override
    public DelegateLoginEntity findByEmail(String email) {

        EntityManager em = emf.createEntityManager();

        try {

            return em.createQuery(
                            "select d from DelegateLoginEntity d where d.email=:email",
                            DelegateLoginEntity.class)
                    .setParameter("email", email)
                    .getSingleResult();

        } catch (Exception e) {

            return null;

        } finally {

            em.close();
        }
    }
}