package com.proyecto.proyecto.mvc.repositorios;

import com.proyecto.proyecto.mvc.modelos.Usuario;

public interface UsuarioRepository extends BaseRepository<Usuario> {
  Usuario findByEmail(String email);

  boolean existsByEmail(String email);
}
