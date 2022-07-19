<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light nav-boja sticky-top">
    <div class="container-fluid">

        <a class="navbar-brand logo" href="Pocetna">
            <%@include file="../img/svg/lorem.svg"%>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- LEVI NAV -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Pocetna">POČETNA</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        PONUDA
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="Pocetna?program=slatki">Slatki program</a></li>
                        <li><a class="dropdown-item" href="Pocetna?program=slani">Slani program</a></li>
                    </ul>
                </li>
                <c:if test="${UserRola < 3}">
                    <li class="nav-item">
                        <a class="nav-link" href="Administracija?Zahtev=Narudzbine">Administracija</a>
                    </li>
                </c:if>

            </ul>
            <!-- KRAJ LEVOG NAV -->
            <!-- DESNI NAV -->
            <ul class="navbar-nav  justify-content-end">

                <c:if test = "${User == null}">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Dobrodošli, Ulogujte se!</a>
                    </li>
                    <li class="seperator-red"></li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="registracija.jsp">Registracija</a>
                    </li>
                </c:if>

                <c:if test = "${User != null}">
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Poeni: ${sessionScope.Poeni}</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Profil?User=${User}&View=Korpa"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg></a>                     
                    </li>
                    <c:if test="${Narudzbina != null}">
                        <li class="nav-item">
                            <p class="brojac">${Narudzbina.getStavkeNarudzbine().size()}</p>
                        </li>
                    </c:if>  

                    <li class="seperator-green"></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownProfil" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            ${User}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownProfil">
                            <li><a class="dropdown-item" href="Profil?User=${User}&View=Profil">Profil</a></li>
                            <li><a class="dropdown-item" href="Istorija?Zahtev=Pregled"">Narudžbine</a></li>
                            <li><a class="dropdown-item" href="Authenticate">Logout</a></li>
                        </ul>
                    </li>               
                </c:if>

            </ul>
        </div>
    </div>
</nav>
