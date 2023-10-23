package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.DireccionDeEnvio;
import com.proyecto.proyecto.mvc.repositorios.DireccionDeEnvioRepository;

@Service
public class DireccionDeEnvioService extends BaseService<DireccionDeEnvio> {
  public DireccionDeEnvioService(DireccionDeEnvioRepository repository) {
    super(repository);
  }
}
