<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>All Products</title>
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
    <link rel="stylesheet" href="/css/showProducts.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
    />
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <p class="title">All products</p>
      <div class="image-column">
        <c:forEach
          items="${currentPageImages}"
          var="producto"
          varStatus="status"
        >
          <c:if test="${status.index % 4 == 0}">
            <a href="/products/${producto.id}"
              ><img
                alt="Image ${status.index}"
                class="hover-image"
                src="${producto.productImageUrl}"
                data-original-src="${producto.productImageUrl}"
                data-hover-src="${producto.productImageUrlB}"
            /></a>
            <p class="nombre">
              <a href="/products/${producto.id}">${producto.nombre}</a>
            </p>
            <p class="precio">$ ${producto.precio}</p>
          </c:if>
        </c:forEach>
      </div>
      <div class="image-column">
        <c:forEach
          items="${currentPageImages}"
          var="producto"
          varStatus="status"
        >
          <c:if test="${status.index % 4 == 1}">
            <a href="/products/${producto.id}"
              ><img
                class="hover-image"
                src="${producto.productImageUrl}"
                data-original-src="${producto.productImageUrl}"
                data-hover-src="${producto.productImageUrlB}"
                alt="Image ${status.index}"
            /></a>
            <p class="nombre">
              <a href="/products/${producto.id}">${producto.nombre}</a>
            </p>
            <p class="precio">$ ${producto.precio}</p>
          </c:if>
        </c:forEach>
      </div>
      <div class="image-column">
        <c:forEach
          items="${currentPageImages}"
          var="producto"
          varStatus="status"
        >
          <c:if test="${status.index % 4 == 2}">
            <a href="/products/${producto.id}"
              ><img
                class="hover-image"
                src="${producto.productImageUrl}"
                data-original-src="${producto.productImageUrl}"
                data-hover-src="${producto.productImageUrlB}"
                alt="Image ${status.index}"
            /></a>
            <p class="nombre">
              <a href="/products/${producto.id}">${producto.nombre}</a>
            </p>
            <p class="precio">$ ${producto.precio}</p>
          </c:if>
        </c:forEach>
      </div>
      <div class="image-column">
        <c:forEach
          items="${currentPageImages}"
          var="producto"
          varStatus="status"
        >
          <c:if test="${status.index % 4 == 3}">
            <a href="/products/${producto.id}"
              ><img
                class="hover-image"
                src="${producto.productImageUrl}"
                data-original-src="${producto.productImageUrl}"
                data-hover-src="${producto.productImageUrlB}"
                alt="Image ${status.index}"
            /></a>

            <p class="nombre">
              <a href="/products/${producto.id}">${producto.nombre}</a>
            </p>
            <p class="precio">$ ${producto.precio}</p>
          </c:if>
        </c:forEach>
      </div>
      <div style="clear: both"></div>
      <div class="pagination justify-content-center">
        <ul class="pagination">
          <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a
              class="page-link"
              href="/products?page=${currentPage - 1}"
              aria-label="Previous"
            >
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <li class="page-item ${currentPage == pageNumber ? 'active' : ''}">
              <a class="page-link" href="/products?page=${pageNumber}"
                >${pageNumber}</a
              >
            </li>
          </c:forEach>
          <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a
              class="page-link"
              href="/products?page=${currentPage + 1}"
              aria-label="Next"
            >
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </div>
      <c:if test="${loggedUser.vendedor}">
        <a
          href="/products/new"
          class="d-inline-block new-product btn btn-success"
          >New Product</a
        >
      </c:if>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/showProducts.js"></script>
    <script src="/js/header.js"></script>
  </body>
</html>
