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

        <script src="js/bootstrap.min.js"></script>
        <script src="js/scripts.js"></script>
    </head>
    <body>
        <div class="container-md">
            <%@include file="includes/navbar.jsp"%>
            <section>
                <div class=" profil">
                    <div class="profil-linkovi">
                        <img src="./img/svg/posluzaonik-cropped.svg" alt="Posluzaonik"/>
                        <h2><a class="profil-link" href="Profil?User=${User}&View=Profil">Informacije</a></h2>
                        <h2><a class="profil-link" href="Profil?User=${User}&View=Korpa">Korpa</a></h2>
                        <h2><a class="profil-link" href="Istorija">Istorija</a></h2>
                        <h2><a class="profil-link" href="Profil?User=${User}&View=Izbrisi">Izbriši profil</a></h2>
                        <img src="./img/svg/tacna-cropped.svg" alt="ruka"/>
                    </div>
                        <!-- PRIKAZ NARUDZBINA -->
                    <div class="istorija-prikaz">
                        <c:forEach var="narudzbina" items="${requestScope.Narudzbine}">
                            <%@include file="includes/narudzbina.jsp"%>
                        </c:forEach>
                    </div>
                        <!-- KRAJ NARUDZBINA -->
                </div>
            </section>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>
