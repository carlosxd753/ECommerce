package com.proyecto.proyecto.mvc.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "subscribers")
@Getter
@Setter
@NoArgsConstructor
public class Subscribers extends BaseModel {
  @Email
  @NotBlank
  @NotNull
  private String subscribedEmail;
}
