package com.proyecto.proyecto.mvc.modelos;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "categorias")
@Getter
@Setter
@NoArgsConstructor
public class Categoria extends BaseModel {
  @NotNull
  @NotBlank
  @Size(min = 3, max = 30)
  private String nombre;

  @NotNull
  @NotBlank
  @Size(min = 5, max = 250)
  private String description;

  @NotNull
  @NotBlank
  @Size(min = 1, max = 200)
  private String categoryImageUrl;

  @OneToMany(mappedBy = "categoria")
  private List<Producto> productos = new ArrayList<>();
}
