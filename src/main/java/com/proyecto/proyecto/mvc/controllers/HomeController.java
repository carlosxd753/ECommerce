package com.proyecto.proyecto.mvc.controllers;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.proyecto.proyecto.mvc.modelos.DetallesDePedido;
import com.proyecto.proyecto.mvc.modelos.Pedido;
import com.proyecto.proyecto.mvc.modelos.ShoppingCartItem;
import com.proyecto.proyecto.mvc.modelos.Tracking;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.DetallesDePedidoService;
import com.proyecto.proyecto.mvc.servicios.PedidoService;
import com.proyecto.proyecto.mvc.servicios.ProductoService;
import com.proyecto.proyecto.mvc.servicios.ShoppingCartItemService;
import com.proyecto.proyecto.mvc.servicios.TrackingService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {
  @Autowired
  UsuarioService usuarioService;

  @Autowired
  ShoppingCartItemService shoppingCartItemService;

  @Autowired
  DetallesDePedidoService detallesDePedidoService;

  @Autowired
  PedidoService pedidoService;

  @Autowired
  TrackingService trackingService;

  @Autowired
  ProductoService productoService;

  @GetMapping("/")
  public String home(@ModelAttribute("usuario") Usuario usuario, HttpSession session, Model model) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);

    }
    return "index.jsp";
  }

  @GetMapping("/about")
  public String about(@ModelAttribute("usuario") Usuario usuario) {
    return "/mvc/about.jsp";
  }

  @GetMapping("/faq")
  public String facts(@ModelAttribute("usuario") Usuario usuario) {
    return "/mvc/faqs.jsp";
  }

  @GetMapping("/shoppingCart")
  public String showShoppingCart(@ModelAttribute("usuario") Usuario usuario, @ModelAttribute("pedido") Pedido pedido,
      HttpSession session, Model model) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      List<ShoppingCartItem> loggedUserShoppingCartItems = shoppingCartItemService.findByUsuario(loggedUser);
      float total = 0;
      for (ShoppingCartItem item : loggedUserShoppingCartItems) {
        total += item.getQuantity() * item.getProduct().getPrecio();
      }
      model.addAttribute("total", total);
      model.addAttribute("loggedUser", loggedUser);
      model.addAttribute("loggedUserShoppingCartItems", loggedUserShoppingCartItems);
    }
    return "/mvc/shoppingCart.jsp";
  }

  @PostMapping("/shoppingCart/buy")
  public String buyShoppingCart(Model model, @Valid @ModelAttribute("pedido") Pedido pedido, BindingResult result,
      HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    if (result.hasErrors()) {
      return "/mvc/shoppingCart.jsp";
    } else {
      float totalDelPedido = 0;
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      List<ShoppingCartItem> shoppingCartItems = shoppingCartItemService.findByUsuario(loggedUser);
      pedido.setFechaYHoraDelPedido(new Date());
      pedidoService.save(pedido);
      for (ShoppingCartItem itemToBuy : shoppingCartItems) {
        DetallesDePedido detalleDePedido = new DetallesDePedido();
        detalleDePedido.setQuantity(itemToBuy.getQuantity());
        detalleDePedido.setSize(itemToBuy.getSize());
        detalleDePedido.setPedido(pedido);
        detalleDePedido.setProducto(itemToBuy.getProduct());
        detallesDePedidoService.save(detalleDePedido);
        itemToBuy.getProduct()
            .setStockDisponible(itemToBuy.getProduct().getStockDisponible() - itemToBuy.getQuantity());
        productoService.save(itemToBuy.getProduct());
        totalDelPedido += itemToBuy.getQuantity() * (float) itemToBuy.getProduct().getPrecio();
      }
      pedido.setTotalDelPedido(totalDelPedido);
      pedidoService.save(pedido);
      Calendar c = Calendar.getInstance();
      c.setTime(new Date());
      c.add(Calendar.DATE, 2);
      Tracking tracking = new Tracking();
      tracking.setFechaDeEnvio(c.getTime());
      c.add(Calendar.DATE, 5);
      tracking.setFechaDeEntrega(c.getTime());
      tracking.setEstadoActual("Por Enviar");
      tracking.setLocalizacion("Bogota, Colombia");
      tracking.setPedidoParaEntregar(pedido);
      trackingService.save(tracking);
      for (ShoppingCartItem itemToBuy : shoppingCartItems) {
        shoppingCartItemService.deleteById(itemToBuy.getId());
      }
      return "redirect:/";
    }
  }
}
