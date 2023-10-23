package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class LoginController {
  @Autowired
  UsuarioService usuarioService;

  @PostMapping("")
  public String login(@RequestParam("email") String email, @RequestParam("password") String password,
      HttpSession session, RedirectAttributes redirectAttributes) {
    Usuario user = usuarioService.login(email, password);
    if (user != null) {
      session.setAttribute("user_id", user.getId());
      return "redirect:/";
    } else {
      redirectAttributes.addFlashAttribute("authenticationError", "User or password invalid!");
    }
    return "redirect:/";
  }
}
