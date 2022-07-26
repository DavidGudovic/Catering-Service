<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ketering Služba</title>
        <link rel="icon" href="./img/svg/minilogo.svg" type="image/icon type">
        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="./css/customStyles.css"/>
        <script src="js/html2pdf.js"></script>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>     
        <script src="js/scripts.js"></script>

    </head>
    <body>
        <div class="container-md">
            <%@include file="includes/navbar.jsp"%>
            <div class="administracija fullpage">
                <div class="administracija-linkovi">
                    <c:if test="${UserRola == 1}">  
                        <h2 class="administracija-rola">Admin panel</h2>
                        <br>
                        <span class="pola-bordera"></span>
                        <a class="administracija-link" href="Administracija?Zahtev=Korisnici">Korisnici</a>
                    </c:if>
                    <c:if test="${UserRola == 2}">  
                        <h2 class="administracija-rola">Menadžer</h2>
                        <br>
                        <span class="pola-bordera"></span>
                    </c:if>
                    <a class="administracija-link" href="Administracija?Zahtev=Narudzbine">Narudžbine</a>
                    <a class="administracija-link" href="Administracija?Zahtev=Proizvodi">Proizvodi</a>
                    <a class="administracija-link" href="Administracija?Zahtev=Izvestaji">Izveštaji</a>
                    </br>
                    <span class="pola-bordera"></span>                    
                </div>    

                <!-- Prikaz panela -->
                <c:if test = "${param.Zahtev == 'Narudzbine'}">
                    <%@include file="includes/upravljanjeNarudzbinama.jsp"%>
                </c:if>
                <c:if test = "${param.Zahtev == 'Proizvodi'}">
                    <%@include file="includes/upravljanjeProizvodima.jsp"%>
                </c:if>
                <c:if test = "${param.Zahtev == 'Kategorije'}">
                    <%@include file="includes/kategorije.jsp"%>
                </c:if>
                <c:if test = "${param.Zahtev == 'Izvestaji'}">
                    <%@include file="includes/izvestaji.jsp"%>
                </c:if>
                <c:if test = "${param.Zahtev == 'Korisnici'}">
                    <%@include file="includes/korisnici.jsp"%>
                </c:if>
            </div>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>
