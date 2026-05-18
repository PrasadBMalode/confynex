package com.xworkz.confynex.entity;

import javax.persistence.*;

@Entity
@Table(name = "coordinatorEmails_tb")
public class coordinatorsEmailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String email;

    public coordinatorsEmailEntity() {
    }

    public coordinatorsEmailEntity(String email) {
        this.email = email;
    }

    public Long getId() {
        return id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

}
