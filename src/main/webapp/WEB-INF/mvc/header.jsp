<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%><%@ taglib
uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sally Couture</title>
    <link rel="stylesheet" href="/css/header.css" />
  </head>
  <body>
    <div>
      <button
        data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasWithBothOptions"
        aria-controls="offcanvasWithBothOptions"
      >
        <img
          src="https://storage.googleapis.com/flyff-images/svg/Hamburger%20icon.svg"
          class="side-bar"
          alt="side-bar"
        />
      </button>
      <div
        class="offcanvas offcanvas-start"
        data-bs-scroll="true"
        tabindex="-1"
        id="offcanvasWithBothOptions"
        aria-labelledby="offcanvasWithBothOptionsLabel"
      >
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">
            MENU
          </h5>
          <button
            type="button"
            class="btn-close text-reset"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
        </div>
        <div class="offcanvas-body">
          <hr />
          <a href="/">Home</a>
          <hr />
          <a href="/about">About</a>
          <hr />
          <a href="/products">Catalog</a>
          <hr />
          <a href="/users/profile">User Profile</a>
          <hr />
          <a href="/shoppingCart">Shopping Cart</a>
          <hr />
        </div>
      </div>

      <a href="/" class="logo-link"
        ><img
          src="https://storage.googleapis.com/flyff-images/svg/logo_tienda%202.svg"
          alt="logo"
          class="logo"
      /></a>

      <button
        class="search searchDistanceWithOutUser"
        type="button"
        data-bs-toggle="modal"
        data-bs-target="#popupModal"
      >
        <img
          src="https://storage.googleapis.com/flyff-images/svg/Search.svg"
          alt="search"
          class="search-img"
        />
      </button>

      <div
        class="modal fade"
        id="popupModal"
        tabindex="-1"
        aria-labelledby="popupModalLabel"
        aria-hidden="true"
      >
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="popupModalLabel">
                Browse through all of our products
              </h5>
              <button
                type="button"
                class="btn-close"
                data-bs-dismiss="modal"
                aria-label="Cerrar"
              ></button>
            </div>
            <div class="modal-body">
              <form method="get" action="/products/search">
                <div class="input-group mb-3">
                  <input
                    type="text"
                    placeholder="Enter a name"
                    name="name"
                    class="form-control"
                  />
                  <span class="input-group-text color"
                    ><button type="submit" class="search-product d-inline">
                      <img
                        src="https://storage.googleapis.com/flyff-images/svg/Search.svg"
                        alt="search"
                        class="search-img"
                      /></button
                  ></span>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

      <c:choose>
        <c:when test="${empty user_id}">
          <div class="d-inline user-link">
            <div
              class="modal"
              class="modal fade"
              aria-hidden="true"
              id="exampleModalToggle3"
              aria-labelledby="exampleModalToggleLabel"
              tabindex="-1"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div id="style" class="modal-content">
                  <div class="modal-header">
                    <a
                      id="a1"
                      data-bs-target="#exampleModalToggle2"
                      data-bs-toggle="modal"
                      data-bs-dismiss="modal"
                      href="#"
                      >Registrarse</a
                    >
                    <a id="a2" href="#">Iniciar Sesión</a>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body">
                    <form method="post" action="/login" id="myFormTwoLogin">
                      <input
                        type="text"
                        placeholder="E-mail..."
                        class="size-and-margin-input"
                        name="email"
                        id="emailTwoLogin"
                      />
                      <input
                        type="password"
                        placeholder="Password..."
                        class="size-and-margin-input"
                        name="password"
                        id="passwordTwoLogin"
                      />
                      <a href="¿olvie la contraseña?"
                        >¿Olvidaste la contraseña?</a
                      >
                      <div class="modal-footer">
                        <button
                          class="btn btn-success loginbutton"
                          type="submit"
                        >
                          Iniciar Sesión
                        </button>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="modal fade"
              id="exampleModalToggle2"
              aria-hidden="true"
              aria-labelledby="exampleModalToggleLabel2"
              tabindex="-1"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div id="style2" class="modal-content">
                  <div class="modal-header">
                    <a id="a3" href="#" class="modal-title">Registrarse</a>
                    <a
                      id="a4"
                      href="#"
                      data-bs-target="#exampleModalToggle3"
                      data-bs-toggle="modal"
                      >Iniciar Sesión</a
                    >
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body">
                    <form:form
                      action="/users/new"
                      method="post"
                      modelAttribute="usuario"
                      id="myFormTwoRegister"
                    >
                      <p>
                        <form:input
                          path="nombre"
                          class="size-and-margin-input"
                          placeholder="Nombre"
                          id="nombreRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="apellido"
                          class="size-and-margin-input"
                          placeholder="Apellido"
                          id="apellidoRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="email"
                          class="size-and-margin-input"
                          placeholder="E-mail"
                          id="emailTwoRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="contraseña"
                          class="size-and-margin-input"
                          placeholder="Contraseña"
                          type="password"
                          id="passwordRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="confirmarContraseña"
                          class="size-and-margin-input"
                          placeholder="Confirmar contraseña"
                          type="password"
                          id="confirmarPasswordRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="direccion"
                          class="size-and-margin-input"
                          placeholder="Dirección"
                          id="direccionRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="telefono"
                          class="size-and-margin-input"
                          placeholder="Telefono"
                          id="telefonoRegister"
                        />
                      </p>
                      <p>
                        <form:input
                          path="identificacion"
                          class="size-and-margin-input"
                          placeholder="Identificación"
                          id="identificacionRegister"
                        />
                      </p>
                      <div class="modal-footer">
                        <input
                          type="submit"
                          value="Registrarse"
                          class="btn btn-success"
                        />
                      </div>
                    </form:form>
                  </div>
                </div>
              </div>
            </div>
            <a
              data-bs-toggle="modal"
              href="#exampleModalToggle3"
              role="button"
              id="botonDeInicioSesion"
              ><img
                src="https://storage.googleapis.com/flyff-images/svg/User.svg"
                class="user"
                alt="user"
            /></a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="d-inline user-link">
            <div class="hover-container">
              <button class="hover-button">
                <a href="/users/profile"
                  ><img
                    src="https://storage.googleapis.com/flyff-images/svg/User.svg"
                    class="user"
                    alt="user"
                /></a>
              </button>
              <div class="hover-content">
                <div>
                  <img
                    class="profile-image d-inline-block"
                    src="/img/portada1.png"
                  />
                  <a
                    href="/users/profile"
                    class="user-hover-profile d-inline-block align-top"
                    ><p>
                      ${fn:toUpperCase(fn:substring(loggedUser.nombre,0,1))}${fn:substring(loggedUser.nombre,1,-1)}
                    </p></a
                  >
                </div>

                <a href="/shoppingCart"><p>My Shopping Cart</p></a>
                <a href="/logout">Logout</a>
              </div>
            </div>
          </div>
        </c:otherwise>
      </c:choose>

      <button
        data-bs-toggle="offcanvas"
        data-bs-target="#offcanvasWithBothOptionsShoppingCart"
        aria-controls="offcanvasWithBothOptions"
        class="shopping-cart-button"
      >
        <img
          src="https://storage.googleapis.com/flyff-images/svg/Cart.svg"
          class="side-bar shopping-cart"
          alt="side-bar"
        />
      </button>
      <div
        class="offcanvas offcanvas-end"
        data-bs-scroll="true"
        tabindex="-1"
        id="offcanvasWithBothOptionsShoppingCart"
        aria-labelledby="offcanvasWithBothOptionsLabel"
      >
        <div class="offcanvas-header">
          <button
            type="button"
            class="btn-close text-reset d-inline-block"
            data-bs-dismiss="offcanvas"
            aria-label="Close"
          ></button>
          <h5
            class="offcanvas-title-shoppingCart"
            id="offcanvasWithBothOptionsLabel"
          >
            ShoppingCart
          </h5>
        </div>
        <div class="offcanvas-body-shoppingcart"></div>
        <input value="${empty user_id}" type="hidden" id="loggedUser" />
        <div class="shopping-cart-bottom">
          <h3 class="totalAmount" id="totalAmount">$${totalAmount}</h3>
          <h3 class="d-inline-block">
            <a href="/shoppingCart" id="shoppingCartLink"
              ><i
                class="fa-solid fa-cart-shopping shoppingCartIcon"
                style="color: #f5ebe0"
              ></i
            ></a>
          </h3>
        </div>
      </div>
    </div>
    <hr />
  </body>
</html>
