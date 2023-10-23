package com.proyecto.proyecto.mvc.modelos;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "productos")
@Getter
@Setter
@NoArgsConstructor
public class Producto extends BaseModel {

  @NotNull
  @NotBlank
  @Size(min = 3, max = 60)
  private String nombre;

  @DecimalMin(value = "00.01")
  @DecimalMax(value = "5000.00")
  @NotNull
  private double precio;

  @Size(min = 5, max = 250)
  @NotNull
  @NotBlank
  private String descripcion;

  @Size(min = 1, max = 200)
  @NotNull
  @NotBlank
  private String tallas;

  @Size(min = 3, max = 60)
  @NotNull
  @NotBlank
  private String color;

  @NotNull
  @Min(0)
  @Max(10000)
  private Integer stockDisponible;

  @NotNull
  @NotBlank
  @Size(min = 1, max = 200)
  private String productImageUrl;

  @NotNull
  @NotBlank
  @Size(min = 1, max = 200)
  private String productImageUrlB;

  @NotNull
  @NotBlank
  @Size(min = 1, max = 200)
  private String productImageUrlC;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "detalles_de_pedido", joinColumns = @JoinColumn(name = "producto_id"), inverseJoinColumns = @JoinColumn(name = "pedido_id"))
  private List<Pedido> requeridosEnPedido;

  @NotNull
  @ManyToOne
  @JoinColumn(name = "categoria_id")
  private Categoria categoria;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "shopping_cart_item", joinColumns = @JoinColumn(name = "producto_id"), inverseJoinColumns = @JoinColumn(name = "usuario_id"))
  private List<Usuario> listaDeUsuarios = new ArrayList<>();
}
