package com.proyecto.proyecto.mvc.modelos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "pedidos")
@Getter
@Setter
@NoArgsConstructor
public class Pedido extends BaseModel {

  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date fechaYHoraDelPedido;

  @NotNull
  @NotBlank
  @Size(min = 2, max = 20)
  private String estadoDelPedido;

  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "direccion_de_envio_id")
  private DireccionDeEnvio direccionDeEnvio;

  @DecimalMin("00.00")
  @DecimalMax("99999.99")
  private float totalDelPedido;

  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "usuario_id")
  private Usuario comprador;

  @ManyToMany(fetch = FetchType.LAZY)
  @JoinTable(name = "detalles_de_pedido", joinColumns = @JoinColumn(name = "pedido_id"), inverseJoinColumns = @JoinColumn(name = "producto_id"))
  private List<Producto> listaDeProductos = new ArrayList<>();

  @OneToOne(mappedBy = "pedidoParaEntregar", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
  private Tracking tracking;
}
