package com.proyecto.proyecto.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proyecto.proyecto.mvc.modelos.Categoria;
import com.proyecto.proyecto.mvc.modelos.Pedido;
import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.CategoriaService;
import com.proyecto.proyecto.mvc.servicios.ProductoService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@RequestMapping("/products")
@Controller
public class ProductosController {
  @Autowired
  UsuarioService usuarioService;

  @Autowired
  ProductoService productoService;

  @Autowired
  CategoriaService categoriaService;

  @GetMapping("")
  public String showProducts(Model model, @RequestParam(defaultValue = "1") int page,
      @ModelAttribute("usuario") Usuario usuario, HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);

    }
    List<Producto> productos = productoService.findAll();
    // model.addAttribute("productos", productos);
    int itemsPerPage = 12;
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, productos.size());

    List<Producto> currentPageImages = productos.subList(startIndex, endIndex);
    int totalPages = (int) Math.ceil((double) productos.size() / itemsPerPage);

    model.addAttribute("currentPageImages", currentPageImages);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    return "/mvc/showProducts.jsp";
  }

  @GetMapping("/new")
  public String showCreateProduct(@ModelAttribute("usuario") Usuario usuario,
      @ModelAttribute("producto") Producto producto, Model model, HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
      if (!loggedUser.isVendedor()) {
        return "redirect:/";
      }
    } else {
      return "redirect:/";
    }
    List<Categoria> categorias = categoriaService.findAll();
    model.addAttribute("categorias", categorias);
    return "/mvc/newProduct.jsp";
  }

  @PostMapping("/new")
  public String createProduct(Model model, @Valid @ModelAttribute("producto") Producto producto, BindingResult result,
      HttpSession session) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    if (result.hasErrors()) {
      return "/mvc/newProduct.jsp";
    } else {
      productoService.save(producto);
      return "redirect:/products";
    }
  }

  @GetMapping("/{productId}")
  public String showProduct(Model model, @PathVariable("productId") Long productId,
      @ModelAttribute("usuario") Usuario usuario, HttpSession session, @ModelAttribute("pedido") Pedido pedido) {
    Producto producto = productoService.findById(productId);
    String[] tallas = producto.getTallas().split(",");
    for (int i = 0; i < tallas.length; i++) {
      tallas[i] = tallas[i].trim();
    }
    model.addAttribute("tallas", tallas);
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);

    }
    model.addAttribute("producto", producto);
    return "/mvc/showProduct.jsp";
  }

  @GetMapping("/search")
  public String searchProducts(@ModelAttribute("usuario") Usuario usuario, Model model,
      @RequestParam(defaultValue = "1") int page, @RequestParam String name) {
    List<Producto> productos = productoService.findAllByNombreContaining(name);
    int itemsPerPage = 12;
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, productos.size());

    List<Producto> currentPageImages = productos.subList(startIndex, endIndex);
    int totalPages = (int) Math.ceil((double) productos.size() / itemsPerPage);

    model.addAttribute("currentPageImages", currentPageImages);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    return "/mvc/showProducts.jsp";
  }
}
