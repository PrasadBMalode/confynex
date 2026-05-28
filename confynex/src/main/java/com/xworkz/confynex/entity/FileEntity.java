package com.xworkz.confynex.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Data
@Table(name = "file_tb")
public class FileEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userFileId;

    private String excelFile;
    private String contentType;
    private Long size;
    private String path;

    @OneToOne(mappedBy = "fileEntity")
    @ToString.Exclude
    private HostEntity host;

}



