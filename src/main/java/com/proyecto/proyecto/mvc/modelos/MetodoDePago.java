package com.proyecto.proyecto.mvc.modelos;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "metodos_de_pago")
@Getter
@Setter
@NoArgsConstructor
public class MetodoDePago extends BaseModel {
  @NotNull
  @NotBlank
  @Size(min = 3, max = 20)
  private String tipoDePago;

  @NotNull
  @NotBlank
  @Size(min = 16, max = 16)
  private String numeroDeTarjeta;

  @NotNull
  @NotBlank
  @Size(min = 7, max = 7)
  private String fechaDeVencimiento;

  @NotNull
  @NotBlank
  @Size(min = 3, max = 3)
  private String cvv;

  @NotNull
  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "usuario_id")
  private Usuario emisorDePagos;
}
