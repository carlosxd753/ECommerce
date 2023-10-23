package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyecto.proyecto.mvc.modelos.MetodoDePago;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.MetodoDePagoService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/metodoDePago")
public class MetodoDePagoController {
  @Autowired
  MetodoDePagoService metodoDePagoService;

  @Autowired
  UsuarioService usuarioService;

  @GetMapping("/new")
  public String showCreateMetodoDePago(Model model, @ModelAttribute("metodoDePago") MetodoDePago metodoDePago,
      HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    return "/mvc/createMetodoDePago.jsp";
  }

  @PostMapping("/new")
  public String createMetodoDePago(HttpSession session, Model model,
      @Valid @ModelAttribute("metodoDePago") MetodoDePago metodoDePago,
      BindingResult result) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    if (result.hasErrors()) {
      return "/mvc/createMetodoDePago.jsp";
    } else {
      metodoDePagoService.save(metodoDePago);
      return "redirect:/users/profile";
    }
  }
}
