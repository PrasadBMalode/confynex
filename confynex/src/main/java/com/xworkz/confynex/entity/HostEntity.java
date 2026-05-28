package com.xworkz.confynex.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "host_tb")
@NamedQuery(name = "findByEmail",query = "select nq from HostEntity nq where nq.email=:byEmail")

public class HostEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer hostId;

    private String full_name;
    private String company_name;
    private String email;
    private String phone;
    private String conference_title;
    private Date conference_date;
    private String venue;
    private String password;
    private Integer loginAttempts;
    private Boolean accountLocked=false;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "delegate_file_id")
    @ToString.Exclude
    private FileEntity fileEntity;
}
