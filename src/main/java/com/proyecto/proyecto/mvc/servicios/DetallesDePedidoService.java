package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.DetallesDePedido;
import com.proyecto.proyecto.mvc.repositorios.DetallesDePedidoRepository;

@Service
public class DetallesDePedidoService extends BaseService<DetallesDePedido> {
  public DetallesDePedidoService(DetallesDePedidoRepository repository) {
    super(repository);
  }
}
