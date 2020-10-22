<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <div class="row">
        <nav class="navbar navbar-dark fixed-top bg-dark flex-md-nowrap p-0 shadow ">
            <a class="navbar-brand col-sm-3 col-md-2 mr-0" href="/ProyectoFinal/LoginServlet">Red Vecinal</a>
            <ul class="navbar-nav px-3">
                <div class="my-2 my-lg-0">
                    <c:if test="${sessionScope.usuario == null}">
                        <a href="/ProyectoFinal/login.jsp">Iniciar Sesion</a>
                    </c:if>
                    <c:if test="${sessionScope.usuario != null}">
                        <a href="/ProyectoFinal/LogoutServlet">Cerrar Sesion</a>
                    </c:if>
                </div>
            </ul>
        </nav>
    </div>
</div>