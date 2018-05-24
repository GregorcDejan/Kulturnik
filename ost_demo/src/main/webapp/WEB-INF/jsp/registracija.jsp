<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registracija</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" type="text/css" media="screen" href="css/style.css" />
    <script src="main.js"></script>
</head>

<body>
<div class="teal lighten-5">
    <div class="navbar-fixed">
        <nav class=" teal darken-2 z-depth-3">
            <div class="nav-wrapper">
                <a href="index.html" class="brand-logo">Kulturnik</a>
                <a href="#" class="button-collapse" data-activates="mobile-sidenav">
                    <i class="material-icons">menu</i>
                </a>
                <ul class="right show-on-med-and-down">
                    <li>
                        <a href="search.html">
                            <i class="material-icons">search</i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="material-icons">place</i>
                        </a>
                    </li>
                    <li class="active">
                        <a class="dropdown-trigger" data-activates="dropdownPerson" href="#">
                            <i class="material-icons left">person</i>
                        </a>
                        <ul id='dropdownPerson' class='dropdown-content'>
                            <li>
                                <a href="add.html">Dodaj Dogodek</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#!">Vpis</a>
                            </li>
                            <li class="divider"></li>
                            <li class="active">
                                <a href="#!">Registracija</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#!">Moji Dogodki</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li>
                        <a href="index.html">Domov</a>
                    </li>
                    <li>
                        <a href="events.html">Glasba</a>
                    </li>
                    <li>
                        <a href="events.html">Gledališče</a>
                    </li>
                    <li>
                        <a href="events.html">Razstave</a>
                    </li>
                    <li>
                        <a href="events.html">Športni dogodki</a>
                    </li>
                    <li>
                        <a href="events.html">Kino</a>
                    </li>
                </ul>
                <ul class="side-nav" id="mobile-sidenav">
                    <li>
                        <a href="index.html">Home</a>
                    </li>
                    <li>
                        <a href="events.html">Glasba</a>
                    </li>
                    <li>
                        <a href="events.html">Gledališče</a>
                    </li>
                    <li>
                        <a href="events.html">Razstave</a>
                    </li>
                    <li>
                        <a href="events.html">Športni dogodki</a>
                    </li>
                    <li>
                        <a href="events.html">Kino</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container">
        <h2 class="center-align">
            Registracija
        </h2>
        <form action="#" method="post">
            <input type="text" placeholder="Ime*: " />
            <input type="text" placeholder="Priimek*: " />
            <input type="text" placeholder="E-mail*: " />
            <input type="text" placeholder="Geslo*: " />
            <input type="text" placeholder="Datum Rojstva" />
            <input type="text" placeholder="Telefon" />
            <button class="btn btn-submit large" type="submit">
                <div class="valign-wrapper">Registriraj se
                </div>
            </button>
        </form>
    </div>
</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>

<script>
    // Every page needs this dingy //
    $(document).ready(function () {
        $('.dropdown-button').dropdown({
            constrainWidth: false,
            hover: true,
            belowOrigin: true,
            alignment: 'left'
        });
        // Navbar //
        $('.button-collapse').sideNav();
        $('.dropdown-trigger').dropdown({
            constrainWidth: false,
            hover: true
        });

        // Page Specific //

        // Carousel //
        $('.carousel.carousel-slider').carousel({
            fullWidth: true,
            noWrap: true
        });



    });
</script>

</html>