document.addEventListener("DOMContentLoaded", function () {
  const submitButton = document.getElementById("purchaseNowButton");
  const form = document.getElementById("purchaseNowForm");
  submitButton.addEventListener("click", async function (event) {
    event.preventDefault();
    await swal("Success", "Orden realizada!", "success");
    localStorage.removeItem("carrito");
    form.submit();
  });
});

const finalizarCompraButton = document.getElementById("finalizarCompraButton");
const popupModalThree = new bootstrap.Modal(
  document.getElementById("popupModalThree")
);

finalizarCompraButton.addEventListener("click", function () {
  var tbody = document.getElementById("miTbody"); 

  if (tbody.rows.length === 0) {
    swal(
      "Error",
      "Necesitas agregar productos a tu carrito antes de finalizar compra!",
      "error"
    );
  } else {
    popupModalThree.show();
  }
});
