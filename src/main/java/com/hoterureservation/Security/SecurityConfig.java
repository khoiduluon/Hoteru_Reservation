package com.hoterureservation.Security;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
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

    @Autowired
    CustomerService customerService;

    private final PasswordEncoder passwordEncoder;

    @Autowired
    public SecurityConfig(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(username -> {
            try{
                Customer customer = customerService.findByUsername(username);
                String password = passwordEncoder.encode(customer.getPassword());
                String [] roles = {customer.getRole()};
                return User.withUsername(username).password(password).roles(roles).build();
            } catch (Exception e){
                throw new UsernameNotFoundException(username + "not found");
            }
        });
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .authorizeRequests()
                .antMatchers("/resource","/js/**","/css/**","/fonts/**","/img/**","/sass/**").permitAll()
                .antMatchers("/","/home/index").permitAll()
                .antMatchers("/room/*","/about","/contact","/blog","/blog/*").permitAll()
                .antMatchers("/login","/register").permitAll()
                .antMatchers("/booking").hasAnyRole("Admin","Customer")
                .anyRequest().authenticated();
        http
                .formLogin()
                .loginPage("/login")
                .defaultSuccessUrl("/home/index",true)
                .failureUrl("/login?error=fail")
                .and()
                .rememberMe()
                .tokenValiditySeconds((int) TimeUnit.DAYS.toSeconds(21));

        http
                .logout()
                .logoutUrl("/logout")
                .clearAuthentication(true)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID","remember-me")
                .logoutSuccessUrl("/home/index");

    }
}
