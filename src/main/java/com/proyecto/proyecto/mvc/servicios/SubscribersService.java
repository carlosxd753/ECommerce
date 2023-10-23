package com.proyecto.proyecto.mvc.servicios;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Subscribers;
import com.proyecto.proyecto.mvc.repositorios.SubscribersRepository;

@Service
public class SubscribersService extends BaseService<Subscribers> {
  @Autowired
  SubscribersRepository subscribersRepository;

  public SubscribersService(SubscribersRepository repository) {
    super(repository);
  }

  public Subscribers findBySubscribedEmail(String email) {
    return subscribersRepository.findBySubscribedEmail(email);
  }
}
