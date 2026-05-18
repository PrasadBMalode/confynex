package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "coordinatorEmails_tb")
@Data
public class coordinatorsEmailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;

    @ManyToOne
    @JoinColumn(name = "hostId")
    private HostEntity host;

}
