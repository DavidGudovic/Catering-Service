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
        <!-- <script defer src="./js/scripts.js"></script> -->
    </head>
    
    <body>
        <div class="container-md">
            <%@include file="/includes/navbar.jsp"%>
            <div class="wrapper fullpage">
                <!-- AUTOMATSKI PRIKAZ KATEGORIJA -->
                <div class="kategorije">
                    <h5 class="pola-bordera">KATEGORIJE</h5>    
                    <a href='Pocetna'><strong>Sve</strong></a></br>
                    <h5 class="bold pola-bordera">Slane</h5>                    
                    <c:forEach var="kategorija" items="${slaneKategorije}">
                        <a class="" href='Pocetna?kategorija=${kategorija.getKategorijaID()}'>
                            <strong>${kategorija.getNazivKategorije()}</strong>
                        </a>
                    </c:forEach>       
                    </br>
                    <h5 class="bold pola-bordera">Slatke</h5>                    
                    <c:forEach var="slatKategorija" items="${slatkeKategorije}">
                        <a class="" href='Pocetna?kategorija=${slatKategorija.getKategorijaID()}'>
                            <strong>${slatKategorija.getNazivKategorije()}</strong>
                        </a>
                    </c:forEach>
                </div>
                <!-- KRAJ PRIKAZA KATEGORIJA -->
                <!-- AUTOMATSKI PRIKAZ PROIZVODA -->
                <div class="proizvodiPrikaz">
                    ${msg}
                    <c:forEach var="proizvod" items="${proizvodi}">     
                        <%@include file="/includes/proizvod.jsp" %>                    
                    </c:forEach>
                   
                </div>
                <!-- KRAJ PRIKAZA PROIZVODA -->
            </div>
            <%@include file="/includes/footer.jsp"%>
        </div>

    </body>
</html>
