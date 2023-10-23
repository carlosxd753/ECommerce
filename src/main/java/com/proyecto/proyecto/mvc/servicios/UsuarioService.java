package com.proyecto.proyecto.mvc.servicios;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proyecto.proyecto.mvc.modelos.Usuario;
import com.proyecto.proyecto.mvc.repositorios.UsuarioRepository;

@Service
public class UsuarioService extends BaseService<Usuario> {
  @Autowired
  UsuarioRepository usuarioRepository;

  public UsuarioService(UsuarioRepository usuarioRepository) {
    super(usuarioRepository);
  }

  public Usuario login(String email, String password) {
    Usuario user = usuarioRepository.findByEmail(email);
    if (user != null) {
      boolean validPassword = authenticate(user, password);
      if (!validPassword) {
        return null;
      }
    }
    return user;
  }

  public boolean loginValidation(String email, String password) {
    Usuario user = usuarioRepository.findByEmail(email);
    if (user != null) {
      boolean validPassword = authenticate(user, password);
      if (!validPassword) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  private boolean authenticate(Usuario user, String password) {
    return BCrypt.checkpw(password, user.getContraseña());
  }

  public boolean existsByEmail(String email) {
    return usuarioRepository.existsByEmail(email);
  }

  public Usuario findByEmail(String email) {
    return usuarioRepository.findByEmail(email);
  }
}
