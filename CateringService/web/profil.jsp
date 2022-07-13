<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h2><a class="profil-link" href="Profil">Informacije</a></h2>
                        <h2><a class="profil-link" href="Profil">Korpa</a></h2>
                        <h2><a class="profil-link" href="Profil">Istorija</a></h2>
                        <h2><a class="profil-link" href="Profil">Izbriši profil</a></h2>
                        <img src="./img/svg/tacna-cropped.svg" alt="ruka"/>
                    </div>
                    <div class="profil-prikaz">
                        <form class="forma-prikaz" action="Profil" method="post">  
                            <strong>VAŠ PROFIL</strong><br>
                            <label for="korisnickoIme"><strong>Korisničko ime</strong></label> 

                            <input type="text" name="korisnickoIme" id="korisnickoIme" value="${User}" disabled/></br>

                            <label for="ime"><strong>Ime</strong></label> 

                            <input class="input-prikaz" type="text" name="ime" id="ime" required/></br>

                            <label for="prezime"><strong>Prezime</strong></label> 

                            <input class="input-prikaz" type="text" name="prezime" id="prezime" required/></br>

                            <label for="password"><strong>Password</strong></label> 

                            <input class="input-prikaz" type="password" name="password" id="password" value="aaaaaaaa"/></br>

                            <label for="adresa"><strong>Adresa</strong></label> 

                            <input class="input-prikaz" type="text" name="adresa" id="adresa" required/></br>
                            <div class="prikaz-button">
                                <input class="btn btn-primary " type="submit" value="Izmeni podatke">                                 
                            </div>
                        </form>
                    </div>
            </section>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>