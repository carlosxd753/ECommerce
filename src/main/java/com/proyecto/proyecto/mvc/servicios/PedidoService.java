package com.proyecto.proyecto.mvc.servicios;

import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Pedido;
import com.proyecto.proyecto.mvc.repositorios.PedidoRepository;

@Service
public class PedidoService extends BaseService<Pedido> {
  public PedidoService(PedidoRepository repository) {
    super(repository);
  }
}
