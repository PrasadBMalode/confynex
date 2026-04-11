package com.xworkz.confynex.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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

    private String hostName;
    private String companyName;
    private String email;
    private String phNumber;
    private String title;
    private Date conferenceDate;
    private String venue;
    private String password;

}
