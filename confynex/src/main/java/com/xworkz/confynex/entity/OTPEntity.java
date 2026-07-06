package com.xworkz.confynex.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "otp_table")
@Data

public class OTPEntity {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String email;
    private String otp;
    private long expiryTime;
    private int attempts;

}

