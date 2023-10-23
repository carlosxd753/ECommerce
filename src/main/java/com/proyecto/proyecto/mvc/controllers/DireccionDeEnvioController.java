package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyecto.proyecto.mvc.modelos.DireccionDeEnvio;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.DireccionDeEnvioService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RequestMapping("/direccionDeEnvio")
@Controller
public class DireccionDeEnvioController {
  @Autowired
  DireccionDeEnvioService direccionDeEnvioService;

  @Autowired
  UsuarioService usuarioService;

  @GetMapping("/new")
  public String viewCreateDireccionDeEnvio(Model model,
      @ModelAttribute("direccionDeEnvio") DireccionDeEnvio direccionDeEnvio,
      HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    return "/mvc/createShippingAddress.jsp";
  }

  @PostMapping("/new")
  public String createDireccionDeEnvio(Model model,
      @Valid @ModelAttribute("direccionDeEnvio") DireccionDeEnvio direccionDeEnvio,
      BindingResult result, HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
    if (result.hasErrors()) {
      return "/mvc/createShippingAddress.jsp";
    } else {
      if (loggedUser.getMisDireccionesDeEnvio().size() == 0) {
        direccionDeEnvio.setDireccionPrincipal(true);
      }
      direccionDeEnvioService.save(direccionDeEnvio);
      return "redirect:/users/profile";
    }
  }
}
