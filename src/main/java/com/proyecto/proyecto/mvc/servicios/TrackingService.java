package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Tracking;
import com.proyecto.proyecto.mvc.repositorios.TrackingRepository;

@Service
public class TrackingService extends BaseService<Tracking> {
  public TrackingService(TrackingRepository repository) {
    super(repository);
  }
}
