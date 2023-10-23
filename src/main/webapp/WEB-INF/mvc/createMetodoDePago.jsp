<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <link rel="stylesheet" href="/css/createMetodoDePago.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <h1 class="title">New Payment Method</h1>
      <form:form
        method="post"
        action="/metodoDePago/new"
        modelAttribute="metodoDePago"
      >
        <form:input path="emisorDePagos" type="hidden" value="${user_id}" />
        <div class="mb-3">
          <form:label path="tipoDePago">Tipo de Pago: </form:label>
          <form:select path="tipoDePago" class="form-select">
            <form:option value="Visa">Visa</form:option>
            <form:option value="MasterCard">MasterCard</form:option>
            <form:option value="AmericanExpress">AmericanExpress</form:option>
          </form:select>
          <form:errors path="tipoDePago" />
        </div>
        <div class="mb-3">
          <form:input
            path="numeroDeTarjeta"
            placeholder="Numero de Tarjeta"
            class="form-control"
          />
          <form:errors path="numeroDeTarjeta" />
        </div>
        <div class="mb-3">
          <form:input
            path="fechaDeVencimiento"
            id="dateInput"
            class="form-control"
            placeholder="Fecha de Vencimiento: MM/YYYY"
          />
          <form:errors path="fechaDeVencimiento" />
        </div>
        <div class="mb-3">
          <form:input path="cvv" placeholder="CVV" class="form-control" />
          <form:errors path="cvv" />
        </div>
        <button type="submit" class="btn btn-success create">
          Crear Metodo De Pago
        </button>
      </form:form>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/createMetodoDePago.js"></script>
    <script src="/js/header.js"></script>
  </body>
</html>
