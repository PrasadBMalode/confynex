package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "coordinator_registration")
@Data
public class CoordinatorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String timestamp;

    private String fullName;

    private String email;

    private String phone;

    private String company;

    private String designation;
}