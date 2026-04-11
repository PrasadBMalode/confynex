package com.xworkz.confynex.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HostDTO {

    private Integer hostId;

    @NotBlank(message = "Name is required")
    @Pattern(regexp = "^[A-Za-z\\s]{3,}$", message = "Name must contain only letters (minimum 3)")
    private String hostName;

    @NotBlank(message = "company Name is required")
    @Pattern(regexp = "^[A-Za-z\\s]{4,}$", message = "Company Name must contain minimum 4 letters")
    private String companyName;

    @NotBlank(message = "Email is required")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@gmail\\.com$", message = "Email must be Gmail address")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^[6-9][0-9]{9}$", message = "Phone must start with 6,7,8,9 and be 10 digits")
    private String phNumber;

    @NotBlank(message = "Title is required")
    @Pattern(regexp = "^[A-Za-z\\s]{3,}$", message = "Title must contain only letters (minimum 3)")
    private String title;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date conferenceDate;

    @NotBlank(message = "Venue  is required")
    @Pattern(regexp = "^[A-Za-z\\s]{4,}$", message = "Venue must contain minimum 4 letters")
    private String venue;

    @NotBlank(message = "Password is required")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{8,12}$",
            message = "Password must be 8-12 chars with uppercase, lowercase, number & special char")
    private String password;


    @NotBlank(message = "Confirm password is required")
    private String confirmPassword;


}
