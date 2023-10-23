package com.proyecto.proyecto.mvc.utils;

import org.mindrot.jbcrypt.BCrypt;

public class Utils {
  public static String encryptPassword(String password) {
    String encryptedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
    return encryptedPassword;
  }
}
