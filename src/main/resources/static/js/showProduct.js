document.getElementById("myForm").addEventListener("submit", function (event) {
  event.preventDefault();

  var listOfRadios = document.getElementsByName("talla");
  var talla;
  var cantidad = document.getElementById("cantidad").value;
  var productoId = document.getElementById("productoId").value;
  console.log(listOfRadios);
  var checked = false;

  for (i = 0; i < listOfRadios.length; i++) {
    if (listOfRadios[i].checked) {
      talla = listOfRadios[i].value;
      checked = true;
    }
  }

  let loggedUserThree = document.getElementById("loggedUserTwo");
  console.log("MEOW", loggedUserThree);

  if (!loggedUserThree) {
    swal("Error", "Select a size!", "error");
  } else if (!loggedUserThree) {
    swal("Error", "Logueate para poder agregar productos al carrito", "error");
  } else {
    $.ajax({
      type: "POST",
      url: "/shoppingCart/add",
      data: {
        talla: talla,
        cantidad: cantidad,
        productoId: productoId,
      },
      dataType: "json",
      success: function (response) {
        if (response) {
          swal("Success", "Added to your shopping cart", "success");
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

const imagenPrincipal = document.getElementById("main-pic");
const imagenesSecundarias = document.querySelectorAll(".imagen-secundaria");

imagenesSecundarias.forEach((imagenSecundaria) => {
  imagenSecundaria.addEventListener("click", () => {
    const nuevaSrc = imagenSecundaria.getAttribute("src");
    imagenPrincipal.setAttribute("src", nuevaSrc);
  });
});

function actualizarOtroElemento(radioSeleccionado) {
  const valorSeleccionado = radioSeleccionado.value;
  document.getElementById("sizeToSend").value = valorSeleccionado;
}

const myQuantity = document.getElementById("cantidad");
myQuantity.addEventListener("input", function () {
  document.getElementById("cantidadToSend").value = myQuantity.value;
});

function cantidadParaEnviar() {
  const miInput = document.getElementById("cantidad");
  const nuevoValor = miInput.value;
  const cantidadToSend = document.getElementById("cantidadToSend").value;

  return nuevoValor;
}

document.addEventListener("DOMContentLoaded", function () {
  const submitButton = document.getElementById("purchaseNowButton");
  const form = document.getElementById("purchaseNowForm");
  submitButton.addEventListener("click", async function (event) {
    event.preventDefault();
    await swal("Success", "Purchased product!", "success");
    form.submit();
  });
});

const finalizarCompraButton = document.getElementById(
  "finalizarCompraButtonNow"
);
const popupModalTwo = new bootstrap.Modal(
  document.getElementById("popupModalTwo")
);
let loggedUserTwo = document.getElementById("loggedUserTwo").value;
finalizarCompraButton.addEventListener("click", function () {
  if (!loggedUserTwo) {
    swal("Error", "Debes loguearte para poder comprar!", "error");
  } else {
    popupModalTwo.show();
  }
});
