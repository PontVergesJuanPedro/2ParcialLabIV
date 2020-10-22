<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" href="/docs/4.1/assets/img/favicons/favicon.ico">

        <title>Menu</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.1/examples/dashboard/">

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

        <!-- Custom styles for this template -->
        <link href="./css/dashboard.css" rel="stylesheet">
    </head>

    <body>
        <%@include file="nav.jsp" %>
        <div class="container-fluid">
            <div class="row">
                <%@include file="sidenav.jsp" %>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="col-12 mt-2">
                        <h1 class="h2 border-bottom">Creacion, elminaci�n y modificaci�n de rubros</h1>
                    </div>
                    <div class="row mt-4">
                        <div class="col-4">
                            <div class="list-group" id="list-tab" role="tablist">
                                <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Crear</a>
                                <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Modificar</a>
                                <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Eliminar</a>
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="tab-content" id="nav-tabContent">
                                <div class="tab-pane fade show active" id="list-home" role="tabpanel" aria-labelledby="list-home-list">
                                    <form id="formAltaRubro" method="POST" action="ABMRubrosServlet">
                                        <div class="form-group mt-4">
                                            <label for="nombreRubro">Nombre</label>
                                            <input type="text" class="form-control" id="nombreRubro" name="nombreRubro">
                                        </div>
                                        <div class="form-group">
                                            <label for="descripcionRubro">Descripci�n</label>
                                            <textarea class="form-control" aria-label="With textarea" name="descripcionRubro"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary" name="opcion" value="crear">Crear Rubro</button>
                                        <c:if test="${not empty mensaje}">
                                            <div class="alert alert-success mt-4" role="alert">
                                                <p>${mensaje}</p> 
                                            </div>
                                        </c:if>
                                        <c:if test="${not empty error}">
                                            <div class="alert alert-danger mt-4" role="danger">
                                                <p>${error}</p> 
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                                <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
                                    <form id="formLogin" method="POST" action="ABMRubrosServlet">
                                        <div class="form-group">
                                            <label for="exampleFormControlSelect2">Rubro</label>
                                            <select class="form-control" id="exampleFormControlSelect2">
                                                <c:forEach items="${rubro}" var="rubro">
                                                    <option value="${rubro}">${rubro}</option>
                                                </c:forEach> 
                                            </select>
                                        </div>
                                        <div class="form-group mt-4">
                                            <label for="usuario">Nombre</label>
                                            <input type="text" class="form-control" id="usuario" name="nombreRubro" value="">
                                        </div>
                                        <div class="form-group">
                                            <label for="contrasena">Descripci�n</label>
                                            <textarea class="form-control" aria-label="With textarea" value="" name="descripcionRubro"></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary" name="opcion" value="modificar">Modificar Rubro</button>
                                        <c:if test="${not empty errorLogin}">
                                            <div class="alert alert-warning mt-4" role="alert">
                                                <p>Error: ${errorLogin}</p> 
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                                <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list">
                                    <form id="formLogin" method="POST" action="ABMRubrosServlet">
                                        <h5>Rubros</h5>
                                        <select class="form-control" id="exampleFormControlSelect2" name="rubroEliminar">
                                            <c:forEach items="${rubro}" var="rubro">
                                                <option value="${rubro.id}">${rubro}</option>
                                            </c:forEach> 
                                        </select>
                                        <button class="btn btn-danger mt-3" name="opcion" value="eliminar">Eliminar</button>
                                        <c:if test="${not empty mensajeEliminar}">
                                            <div class="alert alert-warning mt-4" role="alert">
                                                <p>${mensajeEliminar}</p> 
                                            </div>
                                        </c:if>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>

        <!-- Icons -->
        <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
        <script>
            feather.replace()
        </script>
    </body>
</html>