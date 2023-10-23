function modificarCantidadProduct(button, operacion) {
  const cantidadInput = button.parentNode.querySelector(".cantidad");
  const cantidadActual = parseInt(cantidadInput.value);
  let cantidadToSend = document.getElementById("cantidadToSend");

  if (operacion === "-") {
    if (cantidadActual > 1) {
      cantidadInput.value = cantidadActual - 1;
      cantidadToSend.value = cantidadInput.value;
    }
  } else if (operacion === "+") {
    cantidadInput.value = cantidadActual + 1;
    cantidadToSend.value = cantidadInput.value;
  }
}

function modificarCantidadShoppingCartItem(button, operacion) {
  const cantidadInput = button.parentNode.querySelector("#cantidad");
  const cantidadActual = parseInt(cantidadInput.innerText);
  let cantidadToSend = document.getElementById("cantidadToSend");

  if (operacion === "-") {
    if (cantidadActual > 1) {
      cantidadInput.innerText = cantidadActual - 1;
      cantidadToSend.innerText = cantidadInput.innerText;
    }
  } else if (operacion === "+") {
    cantidadInput.innerText = cantidadActual + 1;
    cantidadToSend.innerText = cantidadInput.innerText;
  }
}

function modificarCantidadShoppingCart(button, operacion) {
  const cantidadInput = button.parentNode.querySelector(".cantidad");
  const precioIndivual =
    button.parentNode.querySelector(".precioIndividual").value;
  const cantidadActual = parseInt(cantidadInput.value);
  var totalAmount = document.getElementById("totalAmount").innerText;

  if (operacion === "-") {
    if (cantidadActual > 1) {
      cantidadInput.value = cantidadActual - 1;
      document.getElementById("totalAmount").innerText =
        "$" +
        (parseInt(totalAmount.split("$")[1]) - parseInt(precioIndivual)) +
        ".0";
    }
  } else if (operacion === "+") {
    cantidadInput.value = cantidadActual + 1;
    document.getElementById("totalAmount").innerText =
      "$" +
      (parseInt(totalAmount.split("$")[1]) + parseInt(precioIndivual)) +
      ".0";
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const firstRadio = document.querySelector('input[name="talla"]');
  if (firstRadio) {
    firstRadio.checked = true;
  }
});

function agregarAlCarrito(
  productoId,
  talla,
  cantidad,
  imagenUrl,
  nombre,
  precio
) {
  const usuarioId = document.getElementById("userId").value;
  const carrito = JSON.parse(localStorage.getItem("carrito")) || {};
  var oldQuantity = "0";
  if (carrito.hasOwnProperty(productoId)) {
    // Si el producto ya está en el carrito, verifica si existe la talla
    if (carrito[productoId][talla]) {
      oldQuantity = carrito[productoId][talla].cantidad;
    }
  }
  console.log(oldQuantity);
  $.ajax({
    type: "POST",
    url: "/shoppingCart/add",
    data: {
      usuarioId: usuarioId,
      productoId: productoId,
      addQuantity: cantidad,
      size: talla,
      oldQuantity: oldQuantity,
    },
    dataType: "json",
    success: function (cartItemId) {
      if (cartItemId) {
        const carrito = JSON.parse(localStorage.getItem("carrito")) || {};

        if (!carrito.hasOwnProperty("orden")) {
          carrito.orden = [];
        }

        if (!carrito.hasOwnProperty(productoId)) {
          carrito[productoId] = {
            imagenUrl,
            nombre,
            precio,
            orden: carrito.orden.length,
            [talla]: { talla, cantidad, cartItemId },
          };
          carrito.orden.push(productoId);
        } else if (carrito.hasOwnProperty(productoId)) {
          // Si el producto ya está en el carrito, verifica si existe la talla
          if (carrito[productoId][talla]) {
            carrito[productoId][talla].cantidad =
              parseInt(carrito[productoId][talla].cantidad) +
              parseInt(cantidad);
          } else {
            carrito[productoId][talla] = { talla, cantidad, cartItemId };
          }
        } else {
          // Si el producto no está en el carrito, agrégalo con la talla seleccionada
          carrito[productoId] = {
            imagenUrl,
            nombre,
            precio,
            [talla]: { talla, cantidad, cartItemId },
          };
        }

        localStorage.setItem("carrito", JSON.stringify(carrito));
        swal("Success", "Added to your shopping cart", "success");
      } else {
      }
    },
    error: function () {
      swal(
        "Error",
        "Necesitas loguearte para poder agregar al carrito!",
        "error"
      );
    },
  });
}

function obtenerCantidad() {
  const cantidadInput = document.getElementById("cantidad");
  return cantidadInput.value;
}

function obtenerTalla() {
  const tallasRadios = document.getElementsByName("talla");
  for (const radio of tallasRadios) {
    if (radio.checked) {
      return radio.value;
    }
  }
  return null; // O manejar caso de error
}

function mostrarCarrito() {
  const carrito = JSON.parse(localStorage.getItem("carrito")) || {};
  const carritoContainer = document.querySelector(
    ".offcanvas-body-shoppingcart"
  );
  const totalContainer = document.querySelector(".totalAmount");
  console.log("MEOW");
  console.log(totalContainer);

  carritoContainer.innerHTML = "<hr/>"; // Limpia el contenido previo

  const carritoItems = [];
  let total = 0;

  if (carrito.hasOwnProperty("orden")) {
    carrito.orden.forEach((productoId) => {
      const producto = carrito[productoId];
      const imagenUrl = producto.imagenUrl;
      const nombre = producto.nombre;
      const precio = producto.precio;

      for (const talla in producto) {
        if (
          talla !== "imagenUrl" &&
          talla !== "nombre" &&
          talla !== "precio" &&
          talla !== "orden" &&
          talla !== "cartItemId"
        ) {
          const item = producto[talla];

          const subtotal = precio * item.cantidad;
          total += subtotal;

          const itemDiv = document.createElement("div");
          itemDiv.className = "carrito-item";

          itemDiv.innerHTML = `
              
              <img src="${imagenUrl}" class="shoppingCartImage d-inline-block align-top" alt="Producto">
              <div class="d-inline-block shoppingCartItemDescription">
                <p class="productDetails">${nombre}</p>
                <p class="productDetails">Size: ${talla.toUpperCase()}</p>
                <p class="productPrice">$${precio}</p>
                <div class="quantity-selector d-inline-block">
                    <button class="less" onclick="modificarCantidad('${productoId}', '${talla}', '-')">-</button>
                    <input class="cantidad" value="${
                      item.cantidad
                    }" onchange="actualizarCantidad('${productoId}', '${talla}', this.value,'${
            item.cartItemId
          }')">
                    <button class="plus" onclick="modificarCantidad('${productoId}', '${talla}', '+')">+</button>
                  </div>
                <button class="btn btn-danger" onclick="eliminarDelCarrito('${productoId}', '${talla}',${
            item.cartItemId
          })">Eliminar</button>
              </div>
              <hr/>
          `;

          carritoItems.push(itemDiv);
        }
      }
    });
  }

  for (let i = 0; i < carritoItems.length; i++) {
    carritoContainer.appendChild(carritoItems[i]);
  }

  totalContainer.textContent = `$${total.toFixed(1)}`;
}

function modificarCantidad(productoId, talla, operacion) {
  const carrito = JSON.parse(localStorage.getItem("carrito")) || {};

  if (carrito.hasOwnProperty(productoId)) {
    const item = carrito[productoId][talla];
    if (operacion === "-") {
      item.cantidad = Math.max(1, item.cantidad - 1);
    } else if (operacion === "+") {
      item.cantidad = parseInt(item.cantidad) + 1;
    }

    localStorage.setItem("carrito", JSON.stringify(carrito));
    mostrarCarrito(); // Actualiza la vista del carrito
  }
}

function actualizarCantidad(productoId, talla, nuevaCantidad, itemCartId) {
  const carrito = JSON.parse(localStorage.getItem("carrito")) || {};

  if (carrito.hasOwnProperty(productoId)) {
    const item = carrito[productoId][talla];
    item.cantidad = parseInt(nuevaCantidad);

    localStorage.setItem("carrito", JSON.stringify(carrito));
    mostrarCarrito(); // Actualiza la vista del carrito
    $.ajax({
      type: "POST",
      url: "/shoppingCart/update",
      data: {
        itemCartId: itemCartId,
        nuevaCantidad: nuevaCantidad,
      },
      dataType: "json",
      success: function (response) {},
      error: function () {
        swal("Error", "Error at the moment of checking name!", "error");
      },
    });
  }
}

function eliminarDelCarrito(productoId, talla, itemCartId) {
  const carrito = JSON.parse(localStorage.getItem("carrito")) || {};

  if (carrito.hasOwnProperty(productoId)) {
    if (talla === "imagenUrl") {
      delete carrito[productoId];
    } else {
      delete carrito[productoId][talla];
    }

    if (Object.keys(carrito[productoId]).length === 4) {
      // Si solo queda la imagenUrl, elimina el producto del carrito
      delete carrito[productoId];
      // También elimina el producto de la lista de orden
      const ordenIndex = carrito.orden.indexOf(productoId);
      if (ordenIndex !== -1) {
        carrito.orden.splice(ordenIndex, 1);
      }
    }

    localStorage.setItem("carrito", JSON.stringify(carrito));
    mostrarCarrito(); // Actualiza la vista del carrito
    $.ajax({
      type: "POST",
      url: "/shoppingCart/delete",
      data: {
        itemCartId: itemCartId,
      },
      dataType: "json",
      success: function (response) {
        if (response) {
          console.log("MEOW");
        }
      },
      error: function () {
        swal("Error", "Error at the moment of checking name!", "error");
      },
    });
  }
}

document.addEventListener("DOMContentLoaded", function () {
  const offcanvasElement = document.getElementById(
    "offcanvasWithBothOptionsShoppingCart"
  );
  const offcanvasShoppingCart = new bootstrap.Offcanvas(offcanvasElement);

  offcanvasElement.addEventListener("shown.bs.offcanvas", function () {
    mostrarCarrito();
  });
});

// TEST FOR USER
function showTooltip() {
  const tooltip = document.querySelector(".hover-tooltip");
  tooltip.style.display = "block";
}

function hideTooltip() {
  const tooltip = document.querySelector(".hover-tooltip");
  tooltip.style.display = "none";
}

document
  .getElementById("myFormTwoLogin")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    var emailInput = document.getElementById("emailTwoLogin");
    var emailValue = emailInput.value.trim();

    var passwordInput = document.getElementById("passwordTwoLogin");
    var passwordValue = passwordInput.value.trim();

    $.ajax({
      type: "POST",
      url: "/validation/login",
      data: { email: emailValue, password: passwordValue },
      dataType: "json",
      success: function (response) {
        if (!response) {
          swal("Error", "Incorrect mail or password!", "error");
        } else {
          event.target.submit();
        }
      },
      error: function () {
        swal("Error", "Error at the moment of checking name!", "error");
      },
    });
  });

document
  .getElementById("myFormTwoRegister")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    let count = 0;

    var nombreInput = document.getElementById("nombreRegister");
    var nombreValue = nombreInput.value.trim();

    var apellidoInput = document.getElementById("apellidoRegister");
    var apellidoValue = apellidoInput.value.trim();

    var passwordInput = document.getElementById("passwordRegister");
    var passwordValue = passwordInput.value.trim();

    var confirmPasswordInput = document.getElementById(
      "confirmarPasswordRegister"
    );
    var confirmPasswordValue = confirmPasswordInput.value.trim();

    var direccionInput = document.getElementById("direccionRegister");
    var direccionValue = direccionInput.value.trim();

    var telefonoInput = document.getElementById("telefonoRegister");
    var telefonoValue = telefonoInput.value.trim();

    var identificacionInput = document.getElementById("identificacionRegister");
    var identificacionValue = identificacionInput.value.trim();

    var emailInput = document.getElementById("emailTwoRegister");
    var emailValue = emailInput.value.trim();

    const globalValidation = (
      nombre,
      apellido,
      password,
      confirmPassword,
      direccion,
      telefono,
      identificacion
    ) => {
      if (nombre.length < 1 || nombre.length > 20) {
        let parrafoExistente = document.querySelector("#nombreValidation");
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "nombreValidation";
          parrafo.textContent = "El nombre debe tener 1-20 caracteres.";
          nombreInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const nombreValidationParaEliminar =
          document.getElementById("nombreValidation");
        if (nombreValidationParaEliminar) {
          nombreValidationParaEliminar.parentNode.removeChild(
            nombreValidationParaEliminar
          );
        }
        count++;
      }

      if (apellido.length < 1 || apellido.length > 20) {
        let parrafoExistente = document.querySelector("#apellidoValidation");
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "apellidoValidation";
          parrafo.textContent = "El apellido debe tener 1-20 caracteres.";
          apellidoInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const apellidoValidationParaEliminar =
          document.getElementById("apellidoValidation");
        if (apellidoValidationParaEliminar) {
          apellidoValidationParaEliminar.parentNode.removeChild(
            apellidoValidationParaEliminar
          );
        }
        count++;
      }

      if (direccion.length < 5 || direccion.length > 50) {
        let parrafoExistente = document.querySelector("#direccionValidation");
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "direccionValidation";
          parrafo.textContent = "La direccion debe tener 5-50 caracteres.";
          direccionInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const direccionValidationParaEliminar = document.getElementById(
          "direccionValidation"
        );
        if (direccionValidationParaEliminar) {
          direccionValidationParaEliminar.parentNode.removeChild(
            direccionValidationParaEliminar
          );
        }
        count++;
      }

      if (identificacion.length < 6 || identificacion.length > 15) {
        let parrafoExistente = document.querySelector(
          "#identificacionValidation"
        );
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "identificacionValidation";
          parrafo.textContent = "La identificacion debe tener 6-15 caracteres.";
          identificacionInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const identificacionValidationParaEliminar = document.getElementById(
          "identificacionValidation"
        );
        if (identificacionValidationParaEliminar) {
          identificacionValidationParaEliminar.parentNode.removeChild(
            identificacionValidationParaEliminar
          );
        }
        count++;
      }

      if (telefono.length < 9 || telefono.length > 15) {
        let parrafoExistente = document.querySelector("#telefonoValidation");
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "telefonoValidation";
          parrafo.textContent = "El telefono debe tener 9-15 caracteres.";
          telefonoInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const telefonoValidationParaEliminar =
          document.getElementById("telefonoValidation");
        if (telefonoValidationParaEliminar) {
          telefonoValidationParaEliminar.parentNode.removeChild(
            telefonoValidationParaEliminar
          );
        }
        count++;
      }

      if (password.length < 8 || password.length > 100) {
        let parrafoExistente = document.querySelector("#passwordValidation");
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "passwordValidation";
          parrafo.textContent = "La contraseña debe tener 8-100 caracteres.";
          passwordInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const passwordValidationParaEliminar =
          document.getElementById("passwordValidation");
        if (passwordValidationParaEliminar) {
          passwordValidationParaEliminar.parentNode.removeChild(
            passwordValidationParaEliminar
          );
        }
        count++;
      }

      if (password != confirmPassword) {
        let parrafoExistente = document.querySelector(
          "#confirmPasswordValidation"
        );
        if (!parrafoExistente) {
          const parrafo = document.createElement("p");
          parrafo.classList.add("validation");
          parrafo.id = "confirmPasswordValidation";
          parrafo.textContent = "Las contraseñas no coinciden!";
          confirmPasswordInput.insertAdjacentElement("afterend", parrafo);
        }
      } else {
        const confirmPasswordValidationParaEliminar = document.getElementById(
          "confirmPasswordValidation"
        );
        if (confirmPasswordValidationParaEliminar) {
          confirmPasswordValidationParaEliminar.parentNode.removeChild(
            confirmPasswordValidationParaEliminar
          );
        }
        count++;
      }
    };

    globalValidation(
      nombreValue,
      apellidoValue,
      passwordValue,
      confirmPasswordValue,
      direccionValue,
      telefonoValue,
      identificacionValue
    );

    const validateEmail = (email) => {
      return String(email)
        .toLowerCase()
        .match(
          /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        );
    };

    if (!validateEmail(emailValue)) {
      const parrafoExistente = document.querySelector("#emailValidation");
      if (!parrafoExistente) {
        const parrafo = document.createElement("p");
        parrafo.classList.add("validation");
        parrafo.id = "emailValidation";
        parrafo.textContent = "Este no es un correo valido!";
        emailInput.insertAdjacentElement("afterend", parrafo);
      }
    } else {
      const emailValidationParaEliminar =
        document.getElementById("emailValidation");
      if (emailValidationParaEliminar) {
        emailValidationParaEliminar.parentNode.removeChild(
          emailValidationParaEliminar
        );
      }
      count++;
    }
    console.log(count);
    if (count == 8) {
      $.ajax({
        type: "POST",
        url: "/validation/email",
        data: { email: emailValue },
        dataType: "json",
        success: function (response) {
          if (response) {
            swal("Error", "El correo ya ha sido utilizado!", "error");
          } else {
            event.target.submit();
          }
        },
        error: function () {
          swal("Error", "Error at the moment of checking name!", "error");
        },
      });
    }
  });

// Obtén una referencia al elemento <a> por su ID
var shoppingCartLink = document.getElementById("shoppingCartLink");
let loggedUser = document.getElementById("loggedUser").value;
// Agrega un controlador de eventos clic al elemento <a>
shoppingCartLink.addEventListener("click", function (event) {
  // Coloca aquí tu condición, por ejemplo:
  if (loggedUser) {
    // Previene la navegación a la URL especificada en el href
    event.preventDefault();
    swal(
      "Error",
      "Debes loguearte para poder usar carrito de compras",
      "error"
    );
  }
});
