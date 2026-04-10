package com.xworkz.confynex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HostDTO {

    private Integer hostId;
    private String hostName;
    private String companyName;
    private String email;
    private Long PhNUmber;
    private String title;
    private Date conferenceDate;
    private String venue;


}
