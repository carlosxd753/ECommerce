package com.proyecto.proyecto.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.ShoppingCartItem;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.servicios.ProductoService;
import com.proyecto.proyecto.mvc.servicios.ShoppingCartItemService;
import com.proyecto.proyecto.mvc.servicios.UsuarioService;

@RequestMapping("/shoppingCart")
@RestController
public class ShoppingCartController {
  @Autowired
  UsuarioService usuarioService;

  @Autowired
  ProductoService productoService;

  @Autowired
  ShoppingCartItemService shoppingCartItemService;

  @PostMapping("/add")
  public ResponseEntity<Long> newShoppingCartItem(@RequestParam("usuarioId") String usuarioId,
      @RequestParam("productoId") String productoId, @RequestParam("oldQuantity") String oldQuantity,
      @RequestParam("size") String size, @RequestParam("addQuantity") String addQuantity) {

    Usuario comprador = usuarioService.findById(Long.parseLong(usuarioId));
    Producto productoAComprar = productoService.findById(Long.parseLong(productoId));
    ShoppingCartItem findIfShoppingCartItemExists = shoppingCartItemService
        .findByQuantityAndSizeAndProduct(Integer.parseInt(oldQuantity), size, productoAComprar);
    if (findIfShoppingCartItemExists != null) {
      findIfShoppingCartItemExists
          .setQuantity(findIfShoppingCartItemExists.getQuantity() + Integer.parseInt(addQuantity));
      shoppingCartItemService.save(findIfShoppingCartItemExists);
      return ResponseEntity.ok(findIfShoppingCartItemExists.getId());
    } else {
      ShoppingCartItem shoppingCartItem = new ShoppingCartItem();
      shoppingCartItem.setUsuario(comprador);
      shoppingCartItem.setProduct(productoAComprar);
      shoppingCartItem.setQuantity(Integer.parseInt(addQuantity));
      shoppingCartItem.setSize(size);
      shoppingCartItemService.save(shoppingCartItem);
      return ResponseEntity.ok(shoppingCartItem.getId());
    }

  }

  @PostMapping("/delete")
  public ResponseEntity<Boolean> deleteShoppingCartItem(@RequestParam("itemCartId") String itemCartId) {
    shoppingCartItemService.deleteById(Long.parseLong(itemCartId));
    return ResponseEntity.ok(true);
  }

  @PostMapping("/update")
  public ResponseEntity<Boolean> updateShoppingCartItem(@RequestParam("itemCartId") String itemCartId,
      @RequestParam("nuevaCantidad") String nuevaCantidad) {
    ShoppingCartItem shoppingCartItemToUpdate = shoppingCartItemService.findById(Long.parseLong(itemCartId));
    shoppingCartItemToUpdate.setQuantity(Integer.parseInt(nuevaCantidad));
    shoppingCartItemService.save(shoppingCartItemToUpdate);
    return ResponseEntity.ok(true);
  }
}
