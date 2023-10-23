<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>New Product</title>
    <link rel="icon" type="image/x-icon" href="/img/favicon.ico" />
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
    <link rel="stylesheet" href="/css/newProduct.css" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <form:form action="/products/new" method="post" modelAttribute="producto">
        <div class="mb-3">
          <form:input
            path="nombre"
            autofocus="true"
            class="form-control"
            placeholder="Product name"
          />
          <form:errors path="nombre" />
        </div>
        <div class="mb-3">
          <form:input
            path="descripcion"
            class="form-control"
            placeholder="Product description"
          />
          <form:errors path="descripcion" />
        </div>
        <div class="mb-3">
          <form:label path="precio" class="form-label"
            >Product price</form:label
          >
          <form:input
            path="precio"
            type="number"
            step="any"
            class="form-control"
            placeholder="Product price"
          />
          <form:errors path="precio" />
        </div>
        <div class="mb-3">
          <form:input
            path="tallas"
            class="form-control"
            placeholder="Product sizes"
          />
          <form:errors path="tallas" />
        </div>
        <div class="mb-3">
          <form:input
            path="color"
            class="form-control"
            placeholder="Product color"
          />
          <form:errors path="color" />
        </div>
        <div class="mb-3">
          <form:input
            path="stockDisponible"
            class="form-control"
            placeholder="Product available stock"
          />
          <form:errors path="stockDisponible" />
        </div>
        <div class="mb-3">
          <form:input
            path="productImageUrl"
            class="form-control"
            placeholder="Product image url"
          />
          <form:errors path="productImageUrl" />
        </div>
        <div class="mb-3">
          <form:input
            path="productImageUrlB"
            class="form-control"
            placeholder="Product image url B"
          />
          <form:errors path="productImageUrlB" />
        </div>
        <div class="mb-3">
          <form:input
            path="productImageUrlC"
            class="form-control"
            placeholder="Product image url C"
          />
          <form:errors path="productImageUrlC" />
        </div>
        <div class="mb-3">
          <form:label path="categoria" class="form-label"
            >Product's category</form:label
          >
          <form:select path="categoria" class="form-select">
            <c:forEach var="categ" items="${categorias}">
              <form:option value="${categ.id}" label="${categ.nombre}" />
            </c:forEach>
          </form:select>
          <form:errors path="categoria" />
        </div>
        <button type="submit" class="btn btn-success create">Create</button>
      </form:form>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
