package com.hoterureservation.services;

import java.util.Properties;

import com.hoterureservation.entities.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    CustomerService customerService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        try{
            Customer customer = customerService.findByUsername(username);
            if(customer == null){
                throw new UsernameNotFoundException(username);
            }
            String password = passwordEncoder.encode(customer.getPassword());
            String [] roles = {customer.getRole()};
            return User.withUsername(username).password(password).roles(roles).build();
        } catch (Exception e){
            throw new UsernameNotFoundException(username + "not found");
        }
    }


    public void loginFromOAuth2(OAuth2AuthenticationToken oauth2){
        String email = oauth2.getPrincipal().getAttribute("name");
        String password = Long.toHexString(System.currentTimeMillis());

        UserDetails user = User.withUsername(email).password(passwordEncoder.encode(password)).roles("Customer").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(user,null,user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    public void sendMmail(String to, String text){
        try {
			Properties props =  new Properties();
			props.setProperty("mail.smtp.auth", "true");
			props.setProperty("mail.smtp.starttls.enable", "true");
			props.setProperty("mail.smtp.host", "smtp.gmail.com");
			props.setProperty("mail.smtp.port", "587");
			String username = "doanhuynhlongngan161200@gmail.com";
			String password = "longngan161200";
			Session session = Session.getInstance(props, new Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username, password);
				}
			});
			MimeMessage message = new MimeMessage(session);				
		    message.setFrom(new InternetAddress(username));
		    message.setRecipients(Message.RecipientType.TO,to);
		    message.setSubject("DHLN Entertaiment", "utf-8");
		    message.setText(text, "utf-8", "html");
		    message.setReplyTo(message.getFrom());
		    Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
