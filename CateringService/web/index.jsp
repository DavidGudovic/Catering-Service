<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ketering Služba</title>

        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="./css/customStyles.css"/>

        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="container-md">
            <%@include file="/includes/navbar.jsp"%>
            <div class="wrapper fullpage">
                <div class="kategorije">

                </div>
                <div class="proizvodiPrikaz">
                    ${msg}
                    <c:forEach var="proizvod" items="${proizvodi}">
                        <div class="card proizvod">
                            <img src="./img/svg/minilogo.svg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${proizvod.getNazivProizvoda()}</h5>
                                <p class="card-text">${proizvod.getOpis()}</p>
                                <a href="#" class="btn btn-primary">Dodaj u korpu!</a>
                            </div>
                        </div>
                        <div class="card proizvod">
                            <img src="./img/svg/minilogo.svg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${proizvod.getNazivProizvoda()}</h5>
                                <p class="card-text">${proizvod.getOpis()}</p>
                                <a href="#" class="btn btn-primary">Dodaj u korpu!</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <%@include file="/includes/footer.jsp"%>
        </div>
    </body>
</html>
