package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "delegate_registration")
@Data
public class DelegateEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String delegateName;

    private String delegateEmail;

    private String delegatePhone;

    private String organisation;

    @ManyToOne
    @JoinColumn(name = "coordinator_id")
    private CoordinatorEntity coordinator;
}