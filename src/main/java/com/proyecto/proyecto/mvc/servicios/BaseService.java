package com.proyecto.proyecto.mvc.servicios;

import java.util.List;
import java.util.Optional;

import com.proyecto.proyecto.mvc.repositorios.BaseRepository;

public abstract class BaseService<T> {
  private BaseRepository<T> repositorioBase;

  public BaseService(BaseRepository<T> repositorioBase) {
    this.repositorioBase = repositorioBase;
  }

  public List<T> findAll() {
    return repositorioBase.findAll();
  }

  public T save(T objeto) {
    return repositorioBase.save(objeto);
  }

  public T findById(Long id) {
    Optional<T> optional = repositorioBase.findById(id);
    if (optional.isPresent()) {
      return optional.get();
    } else {
      return null;
    }
  }

  public T update(T objeto) {
    return repositorioBase.save(objeto);
  }

  public void deleteById(Long id) {
    repositorioBase.deleteById(id);
  }
}
