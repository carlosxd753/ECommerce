package com.proyecto.proyecto.mvc.modelos;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "direcciones_de_envio")
@Getter
@Setter
@NoArgsConstructor
public class DireccionDeEnvio extends BaseModel {
  private boolean direccionPrincipal;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 15)
  private String pais;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 15)
  private String ciudad;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 15)
  private String codigoPostal;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 100)
  private String direccion;

  // @NotNull
  @OneToMany(mappedBy = "direccionDeEnvio", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
  private List<Pedido> productosParaEnviar;

  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "usuario_id")
  private Usuario direccionesDeUsuario;
}
