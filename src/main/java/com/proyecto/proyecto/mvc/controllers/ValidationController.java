package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyecto.proyecto.mvc.modelos.Subscribers;
import com.proyecto.proyecto.mvc.servicios.SubscribersService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

@Controller
@RequestMapping("/validation")
public class ValidationController {
  @Autowired
  SubscribersService subscribersService;

  @Autowired
  UsuarioService usuarioService;

  @PostMapping("/subscribedEmail")
  public ResponseEntity<Boolean> newSubscription(@RequestParam("email") String email) {
    Subscribers isSubscribed = subscribersService.findBySubscribedEmail(email);
    if (isSubscribed == null) {
      Subscribers newSubscriber = new Subscribers();
      newSubscriber.setSubscribedEmail(email);
      subscribersService.save(newSubscriber);
      return ResponseEntity.ok(false);
    } else {
      return ResponseEntity.ok(true);
    }
  }

  @PostMapping("/login")
  public ResponseEntity<Boolean> checkIfCorrectLoginInfo(@RequestParam("email") String email,
      @RequestParam("password") String password) {
    return ResponseEntity.ok(usuarioService.loginValidation(email, password));
  }

  @PostMapping("/email")
  public ResponseEntity<Boolean> checkIfEmailUsed(@RequestParam("email") String name) {
    return ResponseEntity.ok(usuarioService.existsByEmail(name));
  }
}
