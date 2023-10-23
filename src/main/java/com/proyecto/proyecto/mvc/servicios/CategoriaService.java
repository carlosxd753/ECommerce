package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Categoria;
import com.proyecto.proyecto.mvc.repositorios.CategoriaRepository;

@Service
public class CategoriaService extends BaseService<Categoria> {
  public CategoriaService(CategoriaRepository repository) {
    super(repository);
  }
}
