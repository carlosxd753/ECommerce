package com.proyecto.proyecto.mvc.servicios;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Producto;
import com.proyecto.proyecto.mvc.repositorios.ProductoRepository;

@Service
public class ProductoService extends BaseService<Producto> {
  @Autowired
  ProductoRepository productoRepository;

  public ProductoService(ProductoRepository productoRepository) {
    super(productoRepository);
  }

  public List<Producto> findAllByNombreContaining(String nombre) {
    return productoRepository.findAllByNombreContaining(nombre);
  }
}
