package com.xworkz.confynex.dto;

import com.xworkz.confynex.entity.FileEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

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
    private String full_name;

    @NotBlank(message = "company Name is required")
    @Pattern(regexp = "^[A-Za-z\\s]{4,}$", message = "Company Name must contain minimum 4 letters")
    private String company_name;

    @NotBlank(message = "Email is required")
    @Pattern(regexp = "^[a-zA-Z0-9._%+-]+@gmail\\.com$", message = "Email must be Gmail address")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^[6-9][0-9]{9}$", message = "Phone must start with 6,7,8,9 and be 10 digits")
    private String phone;

    @NotBlank(message = "Title is required")
    @Pattern(regexp = "^[A-Za-z\\s]{3,}$", message = "Title must contain only letters (minimum 3)")
    private String conference_title;

    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date conference_date;

    @NotBlank(message = "Venue  is required")
    @Pattern(regexp = "^[A-Za-z0-9,./\\s-]{4,}$", message = "Venue must contain minimum 4 letters")
    private String venue;

    @NotBlank(message = "Password is required")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&]).{8,12}$",
            message = "Password must be 8-12 chars with uppercase, lowercase, number & special char")
    private String password;


    @NotBlank(message = "Confirm password is required")
    private String confirm_password;

    private MultipartFile excelFile;

    private FileEntity fileEntity;


}
