<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
prefix="form" uri="http://www.springframework.org/tags/form"%> <%@page
contentType="text/html"%> <%@page pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>New Category</title>
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
    <link rel="stylesheet" href="/css/newCategory.css" />
  </head>
  <body>
    <div class="container">
      <%@ include file="header.jsp" %>
      <p class="title">New Category</p>
      <form:form
        action="/categories/new"
        method="post"
        modelAttribute="categoria"
      >
        <div class="mb-3">
          <form:input
            path="nombre"
            class="form-control"
            placeholder="Categories name"
            autofocus="true"
          />
          <form:errors path="nombre" />
        </div>
        <div class="mb-3">
          <form:input
            path="description"
            class="form-control"
            placeholder="Categories description"
          />
          <form:errors path="description" />
        </div>
        <div class="mb-3">
          <form:input
            path="categoryImageUrl"
            class="form-control"
            placeholder="Categories image url"
          />
          <form:errors path="categoryImageUrl" />
        </div>
        <button type="submit" class="btn btn-success create">Create</button>
      </form:form>
    </div>
    <%@ include file="footer.jsp" %>
    <script src="/js/header.js"></script>
  </body>
</html>
