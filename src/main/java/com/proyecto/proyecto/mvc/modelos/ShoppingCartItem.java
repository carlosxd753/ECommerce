package com.proyecto.proyecto.mvc.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "shopping_cart_item")
@Getter
@Setter
@NoArgsConstructor
public class ShoppingCartItem extends BaseModel {
  @NotNull
  @ManyToOne
  @JoinColumn(name = "producto_id")
  private Producto product;

  @NotNull
  @ManyToOne
  @JoinColumn(name = "usuario_id")
  private Usuario usuario;

  @NotNull
  @Min(1)
  @Max(9999)
  private int quantity;

  @NotNull
  @NotBlank
  @Size(min = 1, max = 10)
  private String size;
}
