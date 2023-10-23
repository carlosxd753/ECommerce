package com.proyecto.proyecto.mvc.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
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
@Table(name = "detalles_de_pedido")
@Getter
@Setter
@NoArgsConstructor
public class DetallesDePedido extends BaseModel {
  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "pedido_id")
  private Pedido pedido;

  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "producto_id")
  private Producto producto;

  @Min(1)
  @Max(9999)
  private Integer quantity;

  @NotBlank
  @Size(min = 1, max = 10)
  private String size;
}
