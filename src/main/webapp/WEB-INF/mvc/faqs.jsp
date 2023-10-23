<%@page contentType="text/html"%> <%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>FAQs</title>
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
    <link rel="stylesheet" href="/css/faqs.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <h1>Preguntas Frecuentes</h1>
      <div class="accordion accordion-size" id="accordionPanelsStayOpenExample">
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingOne">
            <button
              class="accordion-button"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#panelsStayOpen-collapseOne"
              aria-expanded="true"
              aria-controls="panelsStayOpen-collapseOne"
            >
              ¿Cómo puedo hacer seguimiento de mi pedido?
            </button>
          </h2>
          <div
            id="panelsStayOpen-collapseOne"
            class="accordion-collapse collapse show"
            aria-labelledby="panelsStayOpen-headingOne"
          >
            <div class="accordion-body">
              Para hacer seguimiento a su pedido debe ingresar a el correo que
              proporciono al hacer la compra o resgistarse. En este correo
              encontrara información sobre su pedido incluido el número de
              seguimiento y un enlace para realizar el seguimiento.
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingTwo">
            <button
              class="accordion-button collapsed"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#panelsStayOpen-collapseTwo"
              aria-expanded="false"
              aria-controls="panelsStayOpen-collapseTwo"
            >
              ¿Cuáles son los términos de devolución o cambio?
            </button>
          </h2>
          <div
            id="panelsStayOpen-collapseTwo"
            class="accordion-collapse collapse"
            aria-labelledby="panelsStayOpen-headingTwo"
          >
            <div class="accordion-body">
              <ul>
                <li>El producto debe estar en óptimas condiciones.</li>
                <li>
                  El producto no debe estar modificado o alterado de su estado
                  original.
                </li>
                <li>El producto debe estar en buen estado y limpio.</li>
                <li>
                  El producto no puede tener evidencia de haber sido utilizado.
                </li>
                <li>
                  El producto tiene un plazo maximo de 8 dias para cambios o
                  devoluciones.
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="accordion-item">
          <h2 class="accordion-header" id="panelsStayOpen-headingThree">
            <button
              class="accordion-button collapsed"
              type="button"
              data-bs-toggle="collapse"
              data-bs-target="#panelsStayOpen-collapseThree"
              aria-expanded="false"
              aria-controls="panelsStayOpen-collapseThree"
            >
              ¿Qué beneficios obtiene al suscribirse?
            </button>
          </h2>
          <div
            id="panelsStayOpen-collapseThree"
            class="accordion-collapse collapse"
            aria-labelledby="panelsStayOpen-headingThree"
          >
            <div class="accordion-body">
              <ul>
                <li>Descuentos de lanzamiento de colección.</li>
                <li>Notificaciones de colecciones antes de su estreno.</li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
