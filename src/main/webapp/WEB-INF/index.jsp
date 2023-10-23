<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sally Couture</title>
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
    <link rel="stylesheet" href="/css/index.css" />
  </head>
  <body>
    <div class="container">
      <%@ include file="mvc/header.jsp" %>
      <div
        id="carouselExampleIndicators"
        class="carousel slide"
        data-bs-ride="carousel"
      >
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Slide 1"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="1"
            aria-label="Slide 2"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselExampleIndicators"
            data-bs-slide-to="2"
            aria-label="Slide 3"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="/img/carrusel1.png" class="d-block w-100" alt="..." />
          </div>
          <div class="carousel-item">
            <img src="/img/carrusel2.png" class="d-block w-100" alt="..." />
          </div>
          <div class="carousel-item">
            <img src="/img/carrusel3.png" class="d-block w-100" alt="..." />
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExampleIndicators"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
      <div>
        <p class="productos-paragraph">Productos</p>
        <div class="portada-pic">
          <div class="image-column">
            <a href="/products/1"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1.png';"
                alt="portada1"
            /></a>
            <p class="nombre">
              <a href="/products/1">Elvis The King Tee - Chaser</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/products/2"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_2.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_2_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_2.png';"
                alt="portada2"
            /></a>
            <p class="nombre">
              <a href="/products/2">First Rodeo Sweater</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/products/3"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_3.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_3_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_3.png';"
                alt="portada3"
            /></a>
            <p class="nombre">
              <a href="/products/3">Marsha Top - For Love & Lemons</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/products/4"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_b.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_b.png';"
                alt="portada4"
            /></a>
            <p class="nombre">
              <a href="/products/4">Blazer blue office</a>
            </p>
          </div>
        </div>
        <a href="/products" class="view-more">View more</a>
      </div>
      <div>
        <p class="productos-paragraph">Categorias</p>
        <div class="portada-pic">
          <div class="image-column">
            <a href="/categories/2"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/tshirt/tshirt_1.png';"
                alt="portada1"
            /></a>
            <p class="nombre">
              <a href="/categories/2">T-Shirt</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/categories/3"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_b.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_a.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/blazers/blazer_1_b.png';"
                alt="portada4"
            /></a>
            <p class="nombre">
              <a href="/categories/3">Blazer</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/categories/4"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/pantalones/pantalon_1_a.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/pantalones/pantalon_1_b.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/pantalones/pantalon_1_a.png';"
                alt="portada4"
            /></a>
            <p class="nombre">
              <a href="/categories/4">Pantalones</a>
            </p>
          </div>
          <div class="image-column">
            <a href="/categories/5"
              ><img
                src="https://storage.googleapis.com/flyff-images/ecommerce/vestidos/vestido_12_a.png"
                onmouseover="this.src='https://storage.googleapis.com/flyff-images/ecommerce/vestidos/vestido_12_b.png';"
                onmouseout="this.src='https://storage.googleapis.com/flyff-images/ecommerce/vestidos/vestido_12_a.png';"
                alt="portada4"
            /></a>
            <p class="nombre">
              <a href="/categories/5">Vestidos</a>
            </p>
          </div>
        </div>
        <a href="/categories" class="view-more">View more</a>
      </div>
      <div class="subscribe">
        <p>Get the latest offers every week</p>
        <form method="post" action="/subscribers/new" id="subscribeform">
          <input name="email" id="subscriberEmail" />
          <button type="button" id="subscribebutton">Subscribe</button>
        </form>
      </div>
    </div>
    <%@ include file="mvc/footer.jsp" %>
    <script src="/js/index.js"></script>
    <script src="/js/header.js"></script>
  </body>
</html>
