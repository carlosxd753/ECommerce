package com.proyecto.proyecto.mvc.modelos;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "trackings")
@Getter
@Setter
@NoArgsConstructor
public class Tracking extends BaseModel {
  @NotNull
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date fechaDeEnvio;

  @NotNull
  @DateTimeFormat(pattern = "yyyy-MM-dd")
  private Date fechaDeEntrega;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 20)
  private String estadoActual;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 20)
  private String localizacion;

  @NotNull
  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "pedido_id")
  private Pedido pedidoParaEntregar;
}
