package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "coordinatorEmails_tb")
@Data
public class CoordinatorsEmailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String email;
    @ManyToOne
    @JoinColumn(name = "hostId")
    private HostEntity host;
}