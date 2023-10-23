package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.MetodoDePago;
import com.proyecto.proyecto.mvc.repositorios.MetodoDePagoRepository;

@Service
public class MetodoDePagoService extends BaseService<MetodoDePago> {
  public MetodoDePagoService(MetodoDePagoRepository repository) {
    super(repository);
  }
}
