<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>User Profile</title>
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
    <div class="container pb-3">
      <%@ include file="header.jsp" %>
      <div class="card">
        <div class="card-header">
          <h1>Perfil de Usuario</h1>
        </div>
        <div class="card-body">
          <div class="row">
            <div class="col-md-6">
              <h5>Información Personal</h5>
              <ul class="list-group">
                <li class="list-group-item">
                  <strong>Nombre: </strong>${usuario.nombre}
                </li>
                <li class="list-group-item">
                  <strong>Apellido: </strong>${usuario.apellido}
                </li>
                <li class="list-group-item">
                  <strong>Email: </strong>${usuario.email}
                </li>
                <li class="list-group-item">
                  <strong>Dirección: </strong>${usuario.direccion}
                </li>
                <li class="list-group-item">
                  <strong>Teléfono: </strong>${usuario.telefono}
                </li>
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
