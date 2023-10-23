<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%><%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>${producto.nombre}</title>
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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/css/showProduct.css" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <div class="links">
        <a href="/">Home</a>
        <span> ></span>
        <a href="/categories/${producto.categoria.id}"
          >${producto.categoria.nombre}</a
        >
        <span> ></span>
        <a href="/products/${producto.id}">${producto.nombre}</a>
      </div>
      <div>
        <div class="d-inline-block leftSide">
          <div class="all-pics d-inline-block align-top">
            <img
              src="${producto.productImageUrl}"
              alt="${producto.nombre}"
              class="d-block imagen-secundaria"
            />
            <img
              src="${producto.productImageUrlB}"
              alt="${producto.nombre}"
              class="d-block imagen-secundaria"
            />
            <img
              src="${producto.productImageUrlC}"
              alt="${producto.nombre}"
              class="d-block imagen-secundaria"
            />
          </div>
          <img
            src="${producto.productImageUrl}"
            alt="${producto.nombre}"
            class="align-top main-pic"
            id="main-pic"
          />
        </div>
        <div class="d-inline-block align-top rightSide">
          <p style="font-weight: bold">${producto.nombre}</p>
          <p>$${producto.precio}</p>
          <p class="descripcion">${producto.descripcion}</p>
          <p>Stock: ${producto.stockDisponible}</p>
          <form method="post" action="/shoppingCart/add" id="myForm">
            <div class="tallas-container">
              <label>Talla:</label>
              <c:forEach var="talla" items="${tallas}" varStatus="status">
                <div class="talla-option">
                  <input
                    type="radio"
                    name="talla"
                    value="${talla}"
                    id="talla-${talla}"
                    onchange="actualizarOtroElemento(this)"
                  />
                  <label for="talla-${talla}">${fn:toUpperCase(talla)}</label>
                </div>
              </c:forEach>
            </div>
            <div class="quantity-selector d-inline-block">
              <button
                type="button"
                class="less"
                onclick="modificarCantidadProduct(this, '-')"
              >
                <span>-</span>
              </button>
              <input
                name="cantidad"
                class="cantidad"
                id="cantidad"
                type="txt"
                value="1"
              />
              <button
                type="button"
                class="plus"
                onclick="modificarCantidadProduct(this, '+')"
              >
                <span>+</span>
              </button>
            </div>
            <input
              type="hidden"
              id="productoId"
              name="productoId"
              value="${producto.id}"
            />
            <input type="hidden" id="userId" value="${user_id}" />
            <button
              type="button"
              onclick="agregarAlCarrito('${producto.id}', obtenerTalla('${producto.id}'), obtenerCantidad('${producto.id}'), '${producto.productImageUrl}', '${producto.nombre}', '${producto.precio}')"
              class="btn btn-primary d-inline align-top addToCart"
            >
              Add to cart
            </button>
          </form>

          <button
            type="button"
            class="d-block btn btn-success buyNow"
            id="finalizarCompraButtonNow"
          >
            Buy now
          </button>

          <input type="hidden" value="${loggedUser}" id="loggedUserTwo" />

          <div
            class="modal fade"
            id="popupModalTwo"
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
                <div class="modal-body-buyNow">
                  <form:form
                    action="/pedidos/new"
                    method="post"
                    modelAttribute="pedido"
                    id="purchaseNowForm"
                  >
                    <input
                      type="hidden"
                      name="url"
                      value="/products/${producto.id}"
                    />
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
                    <fmt:formatDate
                      value="${now}"
                      pattern="yyyy-MM-dd"
                      var="currentDate"
                    />
                    <input
                      type="hidden"
                      name="productId"
                      value="${producto.id}"
                    />
                    <input
                      type="hidden"
                      name="quantity"
                      value="1"
                      id="cantidadToSend"
                    />
                    <input
                      type="hidden"
                      name="size"
                      value="${tallas[0]}"
                      id="sizeToSend"
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
                      class="btn btn-success d-block buttonBuy"
                      id="purchaseNowButton"
                    >
                      Comprar
                    </button>
                  </form:form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br />
    <%@ include file="footer.jsp" %>
    <script src="/js/showProduct.js"></script>
    <script src="/js/header.js"></script>
  </body>
</html>
