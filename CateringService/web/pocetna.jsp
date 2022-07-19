<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ketering Služba</title>

        <link rel="icon" href="./img/svg/minilogo.svg" type="image/icon type">

        <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="./css/customStyles.css"/>

        <script src="js/bootstrap.min.js"></script>    
    </head>

    <body>
        <div class="container-md">
            <%@include file="/includes/navbar.jsp"%>
            <div class="wrapper fullpage">
                <!-- AUTOMATSKI PRIKAZ KATEGORIJA -->
                <div class="kategorije">
                    <h5 class="pola-bordera">KATEGORIJE</h5>    
                    <a href='Pocetna'><strong>Sve</strong></a></br>
                    <a href="Pocetna?program=slani" class="program pola-bordera">Slani program</a>                    
                    <c:forEach var="kategorija" items="${slaneKategorije}">
                        <a class="" href='Pocetna?kategorija=${kategorija.getKategorijaID()}'>
                            <strong>${kategorija.getNazivKategorije()}</strong>
                        </a>
                    </c:forEach>       
                    </br>
                    <a href="Pocetna?program=slatki" class="program pola-bordera">Slatki program</a>                    
                    <c:forEach var="slatKategorija" items="${slatkeKategorije}">
                        <a class="" href='Pocetna?kategorija=${slatKategorija.getKategorijaID()}'>
                            <strong>${slatKategorija.getNazivKategorije()}</strong>
                        </a>
                    </c:forEach>
                </div>
                <!-- KRAJ PRIKAZA KATEGORIJA -->

                <div class="proizvodiPrikaz">
                    ${msg}
                    <!-- AUTOMATSKI PRIKAZ PROIZVODA -->
                    <c:forEach var="proizvod" items="${proizvodi}">     
                        <%@include file="/includes/proizvod.jsp" %>                    
                    </c:forEach>
                    <!-- KRAJ PRIKAZA PROIZVODA -->
                </div>

            </div>
            <%@include file="/includes/footer.jsp"%>
        </div>

    </body>
</html>
