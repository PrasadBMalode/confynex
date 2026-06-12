package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.CoordinatorsEmailEntity;
import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

@Repository
public class HostDAOImpl implements HostDAO {

    @Autowired
    EntityManagerFactory entityManagerFactory;


    @Override
    public HostEntity checkExistUserByEmail(String email) {

        EntityManager entityManager =
                entityManagerFactory.createEntityManager();

        try {

            Query query =
                    entityManager.createNamedQuery("findByEmail");

            query.setParameter("byEmail", email);

            List<HostEntity> list =
                    query.getResultList();

            if (list != null && !list.isEmpty()) {

                return list.get(0);
            }

        } catch (Exception e) {

            e.printStackTrace();

        } finally {

            entityManager.close();
        }

        return null;
    }

    @Override
    public HostEntity hostSaveDB(HostEntity hostEntity) {

        EntityManager entityManager = entityManagerFactory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(hostEntity);
            transaction.commit();
            return hostEntity;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        } finally {
            entityManager.close();
        }
    }

    @Override
    public boolean coordinatorEmails(CoordinatorsEmailEntity coordinatorEntity) {

        EntityManager entityManager =
                entityManagerFactory.createEntityManager();

        EntityTransaction transaction =
                entityManager.getTransaction();

        try {

            transaction.begin();

            entityManager.persist(coordinatorEntity);

            transaction.commit();

            return true;

        } catch (Exception e) {

            if (transaction.isActive()) {
                transaction.rollback();
            }

            e.printStackTrace();

            return false;

        } finally {

            entityManager.close();
        }
    }


    @Override
    public HostEntity getLatestConference() {

        EntityManager em = entityManagerFactory.createEntityManager();

        try {

            return em.createQuery(
                            "SELECT h FROM HostEntity h ORDER BY h.hostId DESC",
                            HostEntity.class)
                    .setMaxResults(1)
                    .getSingleResult();

        } catch (Exception e) {

            e.printStackTrace();
            return null;

        } finally {

            em.close();
        }
    }
}
