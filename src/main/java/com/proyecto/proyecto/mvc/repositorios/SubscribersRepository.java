package com.proyecto.proyecto.mvc.repositorios;

import com.proyecto.proyecto.mvc.modelos.Subscribers;

public interface SubscribersRepository extends BaseRepository<Subscribers> {
  Subscribers findBySubscribedEmail(String email);
}
