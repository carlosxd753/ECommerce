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
import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.CategoriaService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
@RequestMapping("/categories")
public class CategoriasController {
  @Autowired
  CategoriaService categoriaService;

  @Autowired
  UsuarioService usuarioService;

  @GetMapping("")
  public String showCategories(Model model, @RequestParam(defaultValue = "1") int page,
      @ModelAttribute("usuario") Usuario usuario, HttpSession session) {
    List<Categoria> categorias = categoriaService.findAll();
    model.addAttribute("categorias", categorias);
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);

    }
    List<Categoria> categories = categoriaService.findAll();
    // model.addAttribute("productos", productos);
    int itemsPerPage = 12;
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, categories.size());

    List<Categoria> currentPageImages = categories.subList(startIndex, endIndex);
    int totalPages = (int) Math.ceil((double) categories.size() / itemsPerPage);

    model.addAttribute("currentPageImages", currentPageImages);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    return "/mvc/showCategories.jsp";
  }

  @GetMapping("/new")
  public String viewCreateCategory(@ModelAttribute("usuario") Usuario usuario,
      @ModelAttribute("categoria") Categoria categoria, HttpSession session, Model model) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
      if (!loggedUser.isVendedor()) {
        return "redirect:/";
      }
    } else {
      return "redirect:/";
    }
    return "/mvc/newCategory.jsp";
  }

  @PostMapping("/new")
  public String createCategory(Model model, HttpSession session,
      @Valid @ModelAttribute("categoria") Categoria categoria, BindingResult result) {
    if (session.getAttribute("user_id") != null) {
      Usuario loggedUser = usuarioService.findById((Long) session.getAttribute("user_id"));
      model.addAttribute("loggedUser", loggedUser);
    } else {
      return "redirect:/";
    }
    if (result.hasErrors()) {
      return "/mvc/newCategory.jsp";
    } else {
      categoriaService.save(categoria);
      return "redirect:/categories";
    }
  }

  @GetMapping("/{categoryId}")
  public String showProductsFromCategory(Model model, @RequestParam(defaultValue = "1") int page,
      @PathVariable("categoryId") Long categoryId,
      @ModelAttribute("usuario") Usuario usuario) {
    Categoria categoria = categoriaService.findById(categoryId);
    List<Producto> productosDeLaCategoria = categoria.getProductos();
    model.addAttribute("category", categoria);
    model.addAttribute("productosDeLaCategoria", productosDeLaCategoria);
    int itemsPerPage = 12;
    int startIndex = (page - 1) * itemsPerPage;
    int endIndex = Math.min(startIndex + itemsPerPage, productosDeLaCategoria.size());

    List<Producto> currentPageImages = productosDeLaCategoria.subList(startIndex, endIndex);
    int totalPages = (int) Math.ceil((double) productosDeLaCategoria.size() / itemsPerPage);

    model.addAttribute("currentPageImages", currentPageImages);
    model.addAttribute("currentPage", page);
    model.addAttribute("totalPages", totalPages);
    return "/mvc/showProductsFromCategory.jsp";
  }
}
