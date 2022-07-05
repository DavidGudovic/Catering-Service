<nav class="navbar navbar-light bg-light">
    <!-- LEFT NAV -->
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Po?etna</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                Dropdown
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#">Slatki program</a></li>
                <li><a class="dropdown-item" href="#">Slani program</a></li>                               
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Kontakt</a>
        </li>
    </ul>
    <!-- RIGHT NAV -->
    <ul class="nav justify-content-end">
        <!-- if(!session) -->
        <li class="nav-item">
            <a class="nav-link disabled">Korpa</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Login</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Registracija</a>
        </li>
        <!-- if(session && !korpa.isEmpty) 
         Korpa
         Profil -->    
    </ul>
</nav> 
