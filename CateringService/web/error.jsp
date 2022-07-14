<%-- 
    Document   : nedozvoljenPristup
    Created on : Jul 14, 2022, 9:56:09 AM
    Author     : dgudo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
            <div class="forbidden">
                <p> 403 Access Forbidden<br>Nemate pristup ovoj stranici!</p>           
            </div>
            <%@include file="includes/footer.jsp"%>
        </div>
    </body>
</html>

</html>
