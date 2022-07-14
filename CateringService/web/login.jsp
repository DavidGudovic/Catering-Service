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
                <div class="container login-cent">     
                    <form class="login-form" action="Authenticate" method="post">     
                        <strong class="bold"> LOGIN </strong>
                        <input type="text" placeholder="Korisnicko ime" name="loginKorisnicko" required></br>
                        <input type="password" placeholder="Password" name="password" required></br>
                        <input class="btn btn-info btn-login" type="submit" value="Uloguj se!">
                        <p class="${msgTip}">${msg}</p>
                       </form>  
                </div>
            </section>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>

