<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="./css/dashboard.css" rel="stylesheet">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="nav.jsp" %>
        <main role="main">
            <div class="container-fluid mt-4">
                <div class="row">
                    <div class="col mt-4">
                        <h2 class="text-center">Bienvenidos a la Red Vecinal</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col mt-4">
                        <h5>Nuestros rubros:</h5>
                    </div>
                </div>
            </div>
            <div class="container mt-4">
                <div class="row">
                    <c:forEach items="${lista}" var="rubro">
                        <div class="col-4 mt-4">
                            <div class="card" style="width: 18rem;">
                                <div class="card-body">
                                    <h5 class="card-title">${rubro.nombre}</h5>
                                    <p class="card-text">${rubro.descripcion}</p>
                                    <a href="/ProyectoFinal/ComerciosServlet?id=${rubro.id}" class="btn btn-primary">Visitar</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </main>
    </body>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</html>
