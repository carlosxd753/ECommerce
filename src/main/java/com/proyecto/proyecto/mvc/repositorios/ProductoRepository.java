package com.proyecto.proyecto.mvc.repositorios;

import java.util.List;

import com.proyecto.proyecto.mvc.modelos.Producto;

public interface ProductoRepository extends BaseRepository<Producto> {
  List<Producto> findAllByNombreContaining(String nombre);
}
