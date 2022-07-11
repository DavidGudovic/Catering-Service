<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <div class="container-fluid">
        <!-- NAVBAR BREND -->
        <a class="navbar-brand logo" href="index.jsp">
          Lorem Catering
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- KRAJ BRENDA-->
            <!-- LEVI NAV -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.jsp">POČETNA</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">KONTAKT</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        PONUDA
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#">Slatki program</a></li>
                        <li><a class="dropdown-item" href="#">Slani program</a></li>
                    </ul>
                </li>
            </ul>
            <!-- KRAJ LEVOG NAV -->
            <!-- DESNI NAV -->
            <ul class="navbar-nav  justify-content-end">

                <% if (session.getAttribute("User") == null) {%>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">KORPA</a>
                </li>
                <li class="seperator-red"></li>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a> <!-- TODO replace TEST -->
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="registracija.jsp">Registracija</a>
                </li>

                <% } else {%>
                <li class="nav-item">
                    <a class="nav-link" href="#">KORPA</a>
                </li>
                <li class="seperator-green"></li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><%=session.getAttribute("User")%></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Authenticate?">Logout</a> <!-- TODO replace TEST -->
                </li>
                <% }%>
            </ul>
        </div>
    </div>
</nav>
