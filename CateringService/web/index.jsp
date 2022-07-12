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
                <div class="kategorije">
                    <h5>Kategorije</h5>
                    <a class="pola-bordera" href='Pocetna'><strong>Sve</strong></a>
                    <c:forEach var="kategorija" items="${kategorije}">
                        <a class="pola-bordera" href='Pocetna?kategorija=${kategorija.getKategorijaID()}'><strong>${kategorija.getNazivKategorije()}</strong></a>
                            </c:forEach>
                </div>
                <div class="proizvodiPrikaz">
                    ${msg}
                    <c:forEach var="proizvod" items="${proizvodi}">     
                        <%@include file="/includes/proizvod.jsp" %>                    
                    </c:forEach>

                </div>
            </div>
            <%@include file="/includes/footer.jsp"%>
        </div>

    </body>
</html>
