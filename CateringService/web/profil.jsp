<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ketering Služba</title>

        <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="./css/customStyles.css"/>

        <script src="js/bootstrap.min.js"></script>
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
                        <h2><a class="profil-link" href="Profil?User=${User}&View=Istorija">Istorija</a></h2>
                        <h2><a class="profil-link" href="Profil?User=${User}&View=Izbrisi">Izbriši profil</a></h2>
                        <img src="./img/svg/tacna-cropped.svg" alt="ruka"/>
                    </div>
                    <c:if test = "${param.View == 'Profil'}">
                        <%@include file="includes/profilInfo.jsp"%>
                    </c:if>
                    <c:if test = "${param.View == 'Korpa'}">
                        <%@include file="includes/korpa.jsp"%>
                    </c:if>
                    <c:if test = "${param.View == 'Istorija'}">
                        <%@include file="includes/istorija.jsp"%>
                    </c:if>
                    <c:if test = "${param.View == 'Izbrisi'}">
                        <%@include file="includes/izbrisi.jsp"%>
                    </c:if>
            </section>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>