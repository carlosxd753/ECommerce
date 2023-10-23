<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create Shipping Address</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
      crossorigin="anonymous"
    />
    <script
      src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
      integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
      integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
      crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="/css/createShippingAddress.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <h1 class="title">New Shipping Address</h1>
      <form:form
        method="post"
        action="/direccionDeEnvio/new"
        modelAttribute="direccionDeEnvio"
      >
        <form:input
          path="direccionesDeUsuario"
          type="hidden"
          value="${user_id}"
        />
        <div class="mb-3">
          <form:input
            path="pais"
            autofocus="true"
            class="form-control"
            placeholder="Pais"
          />
          <form:errors path="pais" />
        </div>
        <div class="mb-3">
          <form:input path="ciudad" class="form-control" placeholder="Ciudad" />
          <form:errors path="ciudad" />
        </div>
        <div class="mb-3">
          <form:input
            path="codigoPostal"
            class="form-control"
            placeholder="Codigo Postal"
          />
          <form:errors path="codigoPostal" />
        </div>
        <div class="mb-3">
          <form:input
            path="direccion"
            class="form-control"
            placeholder="Direccion"
          />
          <form:errors path="direccion" />
        </div>
        <button type="submit" class="btn btn-success create">
          Crear Direccion De Envio
        </button>
      </form:form>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
