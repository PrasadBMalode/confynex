package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

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
    private String organisationName;
    private String phoneNumber;
    private String designation;
    private String linkedInUrl;
    private String excelFileUrl;

    @OneToMany(mappedBy = "coordinator", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<DelegateEntity> delegates;
}