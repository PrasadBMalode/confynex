package com.xworkz.confynex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CoordinatorDTO {

    private Long id;

    private String timestamp;

    @NotBlank(message = "Full Name is required")
    @Pattern(regexp = "^[A-Za-z\\\\s.'-]{3,}$", message = "Full Name must contain only letters (minimum 3)")
    private String fullName;

    @NotBlank(message = "Email is required")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@gmail\\.com$", message = "Email must be a valid Gmail address")
    private String email;

    @NotBlank(message = "Organisation Name is required")
    @Pattern(regexp = "^[A-Za-z\\s]{3,}$", message = "Organisation Name must contain minimum 3 letters")
    private String organisationName;

    @NotBlank(message = "Phone Number is required")
    @Pattern(regexp = "^[6-9][0-9]{9}$", message = "Phone number must be 10 digits and start with 6,7,8 or 9")
    private String phoneNumber;

    @NotBlank(message = "Designation is required")
    @Pattern(regexp = "^[A-Za-z0-9\\s.&()-]{2,}$", message = "Invalid designation")
    private String designation;

   // @NotBlank(message = "LinkedIn URL is required")
    @Pattern(regexp = "^(https?:\\/\\/)?(www\\.)?linkedin\\.com\\/.*$", message = "Enter a valid LinkedIn URL")
    private String linkedInUrl;

    private MultipartFile excelFile;

    private String excelFileUrl;
}