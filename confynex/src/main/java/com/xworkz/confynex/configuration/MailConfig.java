package com.xworkz.confynex.configuration;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.env.Environment;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.JavaMailSender;

import java.io.IOException;
import java.util.Properties;

@Configuration
@ComponentScan(basePackages = "com.xworkz.confynex")
@PropertySource("classpath:mail.properties")
public class MailConfig {

    @Autowired
    private Environment environment;

    @Bean
    public JavaMailSender getJavaMailSender() throws IOException {

        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        mailSender.setHost(environment.getProperty("mail.host"));

        mailSender.setPort(Integer.parseInt(environment.getProperty("mail.port")));

        mailSender.setUsername(environment.getProperty("mail.username"));

        mailSender.setPassword(environment.getProperty("mail.password"));

        Properties props = mailSender.getJavaMailProperties();

        props.put("mail.smtp.auth", environment.getProperty("mail.smtp.auth"));

        props.put("mail.smtp.starttls.enable", environment.getProperty("mail.smtp.starttls.enable"));

        return mailSender;
    }
}
