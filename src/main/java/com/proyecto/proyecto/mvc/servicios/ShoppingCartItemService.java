package com.proyecto.proyecto.mvc.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.modelos.ShoppingCartItem;
import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.repositorios.ShoppingCartItemRepository;

@Service
public class ShoppingCartItemService extends BaseService<ShoppingCartItem> {
  @Autowired
  ShoppingCartItemRepository shoppingCartItemRepository;

  public ShoppingCartItemService(ShoppingCartItemRepository repository) {
    super(repository);
  }

  public ShoppingCartItem findByQuantityAndSizeAndProduct(int quantity, String size, Producto product) {
    return shoppingCartItemRepository.findByQuantityAndSizeAndProduct(quantity, size, product);
  }

  public List<ShoppingCartItem> findByUsuario(Usuario usuario) {
    return shoppingCartItemRepository.findByUsuario(usuario);
  }
}
