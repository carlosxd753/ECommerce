<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %><%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User Profile</title>
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
    <link rel="stylesheet" href="/css/userProfile.css" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <div class="card" id="perfilDeUsuario">
        <div class="card-header">
          <h1>Perfil de Usuario</h1>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <h5>Información Personal</h5>
              <ul class="list-group">
                <li class="list-group-item">
                  <strong>Nombre: </strong>${loggedUser.nombre}
                </li>
                <li class="list-group-item">
                  <strong>Apellido: </strong>${loggedUser.apellido}
                </li>
                <li class="list-group-item">
                  <strong>Email: </strong>${loggedUser.email}
                </li>
                <li class="list-group-item">
                  <strong>Dirección: </strong>${loggedUser.direccion}
                </li>
                <li class="list-group-item">
                  <strong>Teléfono: </strong>${loggedUser.telefono}
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <h4>My Shipping Addresses</h4>
      <table class="table table-striped table-light">
        <thead>
          <tr>
            <th>Dirección</th>
            <th>Pais</th>
            <th>Ciudad</th>
            <th>Codigo Postal</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach
            var="direccionDeEnvio"
            items="${loggedUser.misDireccionesDeEnvio}"
          >
            <tr>
              <td>${direccionDeEnvio.direccion}</td>
              <td>${direccionDeEnvio.pais}</td>
              <td>${direccionDeEnvio.ciudad}</td>
              <td>${direccionDeEnvio.codigoPostal}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
      <p>${direccionDeEnvio.direccion}</p>
      <a
        href="/direccionDeEnvio/new"
        class="btn btn-success margin-bottom-button"
        >Create new shipping address</a
      >
      <h4>My Payment Methods</h4>
      <table class="table table-striped table-light">
        <thead>
          <tr>
            <th>Tipo de Pago</th>
            <th>Numero de Tarjeta</th>
            <th>Fecha de Vencimiento</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="metodoDePago" items="${loggedUser.misMetodosDePago}">
            <p>
              ${metodoDePago.tipoDePago} ${metodoDePago.numeroDeTarjeta}
              ${metodoDePago.fechaDeVencimiento}
            </p>
            <tr>
              <td>${metodoDePago.tipoDePago}</td>
              <td>${metodoDePago.numeroDeTarjeta}</td>
              <td>${metodoDePago.fechaDeVencimiento}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>

      <a href="/metodoDePago/new" class="btn btn-success margin-bottom-button"
        >Create new payment method</a
      >
      <h4>My Orders</h4>
      <div class="tabla-con-scroll">
        <table class="table table-striped table-light">
          <thead>
            <tr>
              <th>Pedido</th>
              <th>Producto</th>
              <th>Talla</th>
              <th>Cantidad</th>
              <th>Precio</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="pedido" items="${loggedUser.misPedidos}">
              <c:forEach var="detalleDePedido" items="${detallesDeMisPedidos}">
                <c:if test="${detalleDePedido.pedido.id eq pedido.id}">
                  <tr>
                    <td>${pedido.id}</td>
                    <td>${detalleDePedido.producto.nombre}</td>
                    <td>${fn:toUpperCase(detalleDePedido.size)}</td>
                    <td>${detalleDePedido.quantity}</td>
                    <td>Total Price: $${pedido.totalDelPedido}</td>
                  </tr>
                </c:if>
              </c:forEach>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
