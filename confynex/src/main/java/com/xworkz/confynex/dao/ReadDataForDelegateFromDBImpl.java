package com.xworkz.confynex.dao;

import com.xworkz.confynex.entity.CoordinatorEntity;
import com.xworkz.confynex.entity.HostEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;
import java.util.List;

@Repository
public class ReadDataForDelegateFromDBImpl implements ReadDataForDelegateFromDB {

    @Autowired
    EntityManagerFactory entityManagerFactory;

    @Override
    public List<HostEntity> readHostFromDB() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("readHostAllData");
            List<HostEntity> resultList =(List<HostEntity>) query.getResultList();
            return resultList;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            entityManager.close();
        }

        return List.of();
    }

    @Override
    public List<CoordinatorEntity> readCoordinatorFromDB() {
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        try {
            EntityTransaction transaction = entityManager.getTransaction();
            transaction.begin();
            Query query = entityManager.createNamedQuery("readCoordinatorAllData");
            List<CoordinatorEntity> resultList =(List<CoordinatorEntity>) query.getResultList();
            return resultList;
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            entityManager.close();
        }
        return List.of();
    }
}
