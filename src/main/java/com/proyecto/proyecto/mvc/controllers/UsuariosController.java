package com.proyecto.proyecto.mvc.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proyecto.proyecto.mvc.modelos.DetallesDePedido;
import com.proyecto.proyecto.mvc.modelos.Pedido;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.DetallesDePedidoService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;
import com.proyecto.proyecto.mvc.utils.Utils;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/users")
public class UsuariosController {

  @Autowired
  private UsuarioService usuarioService;

  @Autowired
  DetallesDePedidoService detallesDePedidoService;

  @PostMapping("/new")
  public String createUser(@Valid @ModelAttribute("usuario") Usuario usuario, BindingResult result,
      HttpSession session) {
    if (!usuario.getContraseña().equals(usuario.getConfirmarContraseña())) {
      FieldError error = new FieldError("confirmPassword", "confirmPassword", "The passwords doesnt match!");
      result.addError(error);
    }

    if (result.hasErrors()) {
      return "index.jsp";
    } else {
      usuario.setContraseña(Utils.encryptPassword(usuario.getContraseña()));
      usuarioService.save(usuario);
      session.setAttribute("user_id", usuario.getId());
      return "redirect:/";
    }
  }

  @GetMapping("/profile")
  public String showUserProfile(Model model, HttpSession session) {
    if (session.getAttribute("user_id") == null) {
      return "redirect:/";
    }
    Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
    List<DetallesDePedido> todosLosDetallesDePedidos = detallesDePedidoService.findAll();
    List<Long> idsDePedidos = new ArrayList<>();
    List<DetallesDePedido> detallesDeMisPedidos = new ArrayList<>();
    for (Pedido pedido : loggedUser.getMisPedidos()) {
      idsDePedidos.add(pedido.getId());
    }
    for (DetallesDePedido detallesDePedido : todosLosDetallesDePedidos) {
      if (idsDePedidos.contains(detallesDePedido.getProducto().getId())) {
        detallesDeMisPedidos.add(detallesDePedido);
      }
    }
    model.addAttribute("detallesDeMisPedidos", detallesDeMisPedidos);
    model.addAttribute("loggedUser", loggedUser);
    return "/mvc/userProfile.jsp";
  }

  @GetMapping("/me")
  public String getUsuario(HttpSession session, Model model) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("usuario", loggedUser);
      return "mvc/user.jsp";
    } else {
      return "redirect:/";
    }
  }

}
