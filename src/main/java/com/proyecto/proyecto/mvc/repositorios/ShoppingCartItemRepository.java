package com.proyecto.proyecto.mvc.repositorios;

import java.util.List;

import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.ShoppingCartItem;
import com.proyecto.proyecto.mvc.modelos.Usuario;

public interface ShoppingCartItemRepository extends BaseRepository<ShoppingCartItem> {
  ShoppingCartItem findByQuantityAndSizeAndProduct(int quantity, String size, Producto product);

  List<ShoppingCartItem> findByUsuario(Usuario usuario);
}
