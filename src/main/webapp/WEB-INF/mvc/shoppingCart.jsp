<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>My Shopping Cart</title>
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
      integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js"
      integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/shoppingCart.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <h3 style="text-align: center">My Shopping Cart</h3>
      <div id="tablecontainer" class="table-margin-top">
        <table class="table">
          <thead>
            <theader>
              <th scope="col">Producto</th>
              <th scope="col">Precio</th>
              <th scope="col">Cantidad</th>
              <th scope="col">Subtotal</th>
              <th scope="col"></th>
            </theader>
          </thead>

          <tbody
            class="styletbody"
            data-bs-spy="scroll"
            data-bs-target="#-example"
            id="miTbody"
          >
            <c:forEach
              var="shoppingCartItem"
              items="${loggedUserShoppingCartItems}"
            >
              <tr>
                <th>${shoppingCartItem.product.nombre}</th>
                <td>$${shoppingCartItem.product.precio}</td>
                <td>
                  <button
                    class="stylebuttons"
                    onclick="modificarCantidadShoppingCartItem(this, '-')"
                  >
                    -
                  </button>
                  <span id="cantidad">${shoppingCartItem.quantity}</span>
                  <button
                    class="stylebuttons"
                    onclick="modificarCantidadShoppingCartItem(this, '+')"
                  >
                    +
                  </button>
                </td>
                <td>
                  $${shoppingCartItem.quantity *
                  shoppingCartItem.product.precio}
                </td>
                <td>
                  <button class="styletrash">
                    <img class="styletrash" src="img/trash.png" alt="trash" />
                  </button>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <div class="section">
        <input id="width" type="text" placeholder="Código de descuento" />
        <button class="stylebutton">Aplicar</button>
      </div>
      <div class="section" id="margin">
        <button
          type="button"
          id="finalizarCompraButton"
          class="stylebutton buyNow"
        >
          Finalizar Compra
        </button>
      </div>

      <div
        class="modal fade"
        id="popupModalThree"
        tabindex="-1"
        aria-labelledby="popupModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="popupModalLabel">
                Payment Information
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Cerrar"
              ></button>
            </div>
            <div class="modal-body-buyNowShoppingCart">
              <c:choose>
                <c:when test="${user_id eq null}">
                  <h1>Vas a poner datos here</h1>
                </c:when>
                <c:otherwise>
                  <form:form
                    action="/shoppingCart/buy"
                    method="post"
                    modelAttribute="pedido"
                    id="purchaseNowForm"
                  >
                    <form:input
                      type="hidden"
                      path="comprador"
                      value="${user_id}"
                    />
                    <form:input
                      type="hidden"
                      path="estadoDelPedido"
                      value="Pagado"
                    />
                    <h6>Shipping Address</h6>
                    <form:select path="direccionDeEnvio">
                      <c:forEach
                        var="direccionDeEnvioDelUsuario"
                        items="${loggedUser.misDireccionesDeEnvio}"
                      >
                        <option
                          label="${direccionDeEnvioDelUsuario.direccion}"
                          value="${direccionDeEnvioDelUsuario.id}"
                        ></option>
                      </c:forEach>
                    </form:select>
                    <a href="/direccionDeEnvio/new" class="d-block"
                      >Crear nueva direccion de envio</a
                    >
                    <h6 class="payment-margin">Payment Method</h6>
                    <select>
                      <c:forEach
                        var="metodoDePago"
                        items="${loggedUser.misMetodosDePago}"
                      >
                        <option
                          label="${metodoDePago.tipoDePago} ${metodoDePago.numeroDeTarjeta} ${metodoDePago.fechaDeVencimiento}"
                          value="${metodoDePago.id}"
                        ></option>
                      </c:forEach>
                    </select>
                    <a href="/metodoDePago/new" class="d-block"
                      >Crear nuevo metodo de pago</a
                    >
                    <button
                      type="button"
                      id="purchaseNowButton"
                      class="btn btn-success d-block buttonBuy"
                    >
                      Comprar
                    </button>
                  </form:form>
                </c:otherwise>
              </c:choose>
            </div>
          </div>
        </div>
      </div>
      <div id="otherbutton">
        <button class="stylebutton" id="padding">Elegir más productos</button>
      </div>
      <div class="styletotal">
        <p>Total: $${total}</p>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
    <script src="/js/shoppingCart.js"></script>
  </body>
</html>
