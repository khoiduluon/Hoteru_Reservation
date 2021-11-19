package com.hoterureservation.Security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hoterureservation.entities.Customer;
import com.hoterureservation.services.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

@Component
public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Autowired
    CustomerService customerService;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication authentication) throws ServletException, IOException {

//        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = ((UserDetails)principal).getUsername();
        Customer customer = customerService.findByUsername(username);
        String redirectURL = request.getContextPath();

        if (customer.getRole().equals("Customer")) {
            redirectURL = "/home/index";
        } else if (customer.getRole().equals("Admin")) {
            redirectURL = "/admin/index";
        }
        response.sendRedirect(redirectURL);

    }

}