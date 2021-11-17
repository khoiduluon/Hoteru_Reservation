package com.hoterureservation.Security;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
import com.hoterureservation.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.concurrent.TimeUnit;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//    @Autowired
//    CustomerService customerService;

    @Autowired
    UserService userService;

    //    private final PasswordEncoder passwordEncoder;
//
//    @Autowired
//    public SecurityConfig(PasswordEncoder passwordEncoder) {
//        this.passwordEncoder = passwordEncoder;
//    }
    @Autowired
    private LoginSuccessHandler loginSuccessHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/resource", "/js/**", "/css/**", "/fonts/**", "/img/**", "/sass/**").permitAll()
                .antMatchers("/", "/home/index").permitAll()
                .antMatchers("/room/*", "/about", "/contact", "/blog", "/blog/*").permitAll()
                .antMatchers("/login", "/register", "/forgot-password").permitAll()
                .antMatchers("/booking").hasAnyRole("Admin", "Customer")
                .anyRequest().authenticated();
        http
                .formLogin()
                .loginPage("/login")
                .successHandler(loginSuccessHandler)
                .failureUrl("/login?error=fail")
                .and()
                .rememberMe()
                .tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(21));

        http
                .logout()
                .logoutUrl("/logout")
                .clearAuthentication(true)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID", "remember-me")
                .logoutSuccessUrl("/home/index");
        http
                .oauth2Login()
                .loginPage("/login")
                .defaultSuccessUrl("/oauth2/login/success", true)
                .failureUrl("/login?error=fail")
                .authorizationEndpoint()
                .baseUri("/oauth2/authorization");
    }
}
