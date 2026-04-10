package com.xworkz.confynex.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@ComponentScan("com.xworkz.confynex")
@EnableWebMvc
public class WebConfiguration {
    public WebConfiguration(){
        System.out.println("Configurring...");
    }

    @Bean
    public ViewResolver viewResolver() {
        return new InternalResourceViewResolver("/", ".jsp");
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean localContainerEntityManagerFactoryBean() {
        LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
        factoryBean.setPackagesToScan("com.xworkz.xworkz_Prasad_Modules.entity");
        factoryBean.setJpaVendorAdapter(new HibernateJpaVendorAdapter());
        factoryBean.setDataSource(dataSource());
        factoryBean.setJpaProperties(properties());

        return factoryBean;
    }

    public DataSource dataSource(){
        DriverManagerDataSource dataSource=new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/confynex_db");
        dataSource.setUsername("root");
        dataSource.setPassword("Prasad@123");

        return dataSource;
    }
    public Properties properties(){
        Properties properties=new Properties();
        properties.setProperty("hibernate.hbm2ddl.auto","update");

        return properties;
    }

}
