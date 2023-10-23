<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>About</title>
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
    <link
      href="https: //fonts.googleapis.com/css2? family= Neuton:wght@300 & family= Short+Stack & display=swap"
      rel="stylesheet"
    />
    <link
      href="https: //fonts.googleapis.com/css2? family= Neuton:wght@300 & family= Raleway:wght@300 & family= Short+Stack & display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="/css/about.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <div class="content">
        <h2>Acerca de nosotros</h2>
        <a id="style" href="#">Inicio</a>
        <p>¡Bienvenidos a Sally Couture!</p>
        <p>
          Soy Sally, la mente creativa detrás de esta marca de moda sostenible.
          Mi viaje en el mundo de la moda comenzó con una pasión por la
          elegancia atemporal y un profundo respeto por nuestro planeta. Creo
          firmemente que la moda puede ser hermosa y ética al mismo tiempo, y es
          ese compromiso con la sostenibilidad lo que guía cada paso de mi
          proceso creativo.
        </p>
        <p>
          Cada prenda que uses, ya sea un vestido para una ocasión especial o
          una prenda cotidiana, está impregnada con mi amor por la moda y mi
          preocupación por el medio ambiente. En Sally Couture, no solo
          encontrarás diseños únicos y elegantes, sino que también descubrirás
          la historia detrás de cada prenda, desde los materiales sostenibles
          utilizados hasta el proceso de fabricación ético. Mi objetivo es no
          solo vestirte con estilo, sino también inspirarte a unirte al
          movimiento de la moda sostenible y, al mismo tiempo, empoderarte como
          mujer o niña para que te sientas segura y consciente de las elecciones
          que haces en tu vida diaria. Gracias por unirte a mí en este
          emocionante viaje hacia un futuro de moda consciente, hermosa y
          empoderada.
        </p>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
