package com.proyecto.proyecto.mvc.modelos;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "usuarios")
@Getter
@Setter
@NoArgsConstructor
public class Usuario extends BaseModel {

  @NotBlank
  @Size(min = 1, max = 20)
  @NotNull
  private String nombre;

  @NotBlank
  @Size(min = 1, max = 20)
  @NotNull
  private String apellido;

  @Email
  @NotNull
  @NotBlank
  @Size(min = 3, max = 40)
  @Column(unique = true)
  private String email;

  @NotBlank
  @Size(min = 8, max = 100)
  @NotNull
  private String contraseña;

  @Transient
  private String confirmarContraseña;

  @NotBlank
  @Size(min = 5, max = 50)
  @NotNull
  private String direccion;

  @NotBlank
  @Size(min = 6, max = 15)
  @NotNull
  @Column(unique = true)
  private String identificacion;

  @NotBlank
  @Size(min = 9, max = 15)
  @NotNull
  private String telefono;

  private boolean vendedor;

  @OneToMany(mappedBy = "comprador", fetch = FetchType.LAZY)
  private List<Pedido> misPedidos;

  @OneToMany(mappedBy = "emisorDePagos", fetch = FetchType.LAZY)
  private List<MetodoDePago> misMetodosDePago;

  @OneToMany(mappedBy = "direccionesDeUsuario", fetch = FetchType.LAZY)
  private List<DireccionDeEnvio> misDireccionesDeEnvio;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "shopping_cart_item", joinColumns = @JoinColumn(name = "usuario_id"), inverseJoinColumns = @JoinColumn(name = "producto_id"))
  private List<Producto> listaDeProductos = new ArrayList<>();
}
