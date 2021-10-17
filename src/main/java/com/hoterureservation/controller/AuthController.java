package com.hoterureservation.controller;


import com.hoterureservation.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

    @Autowired
    UserService userService;

    @RequestMapping("/oauth2/login/success")
    public String Oauth(OAuth2AuthenticationToken oauth2){
        userService.loginFromOAuth2(oauth2);
        return "forward:/home/index";
    }
}
