<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="sl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dodaj Dogodek</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <<<<<<< HEAD
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css" />
    =======
    <link rel="stylesheet" type="text/css" href="materialize.min.css"  />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>

    </style>
</head>

<body>
<div class="teal lighten-5">
    <div class="navbar-fixed">
        <nav class=" teal darken-2 z-depth-3">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo">Kulturnik</a>
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
                    <li>
                        <a class="dropdown-trigger" data-activates="dropdownPerson" href="#">
                            <i class="material-icons left">person</i>
                        </a>
                        <ul id='dropdownPerson' class='dropdown-content'>
                            <li>
                                <a href="events">Dodaj Dogodek</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="vpis">Vpis</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="registracija">Registracija</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#!">Moji Dogodki</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li class="active">
                        <a href="index">Domov</a>
                    </li>
                    <li>
                        <a href="events">Glasba</a>
                    </li>
                    <li>
                        <a href="events">Gledališče</a>
                    </li>
                    <li>
                        <a href="events">Razstave</a>
                    </li>
                    <li>
                        <a href="events">Športni dogodki</a>
                    </li>
                    <li>
                        <a href="events">Kino</a>
                    </li>
                </ul>
                <ul class="side-nav" id="mobile-sidenav">
                    <li class="active">
                        <a href="index">Home</a>
                    </li>
                    <li>
                        <a href="events">Glasba</a>
                    </li>
                    <li>
                        <a href="events">Gledališče</a>
                    </li>
                    <li>
                        <a href="events">Razstave</a>
                    </li>
                    <li>
                        <a href="events">Športni dogodki</a>
                    </li>
                    <li>
                        <a href="events">Kino</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container">
        <h2 class="center-align">
            Dodajanje dogodka
        </h2>
        <form action="#" method="post">
            <input type="text" placeholder="Naziv*: " />
            <input type="text" placeholder="Kraj*: " />
            <input type="text" placeholder="Naslov*: " />
            <input type="text" placeholder="Tip dogodka*: " />
            <input type="text" placeholder="Povezava na dogodek: " />
            <input type="text" placeholder="Datum*: " />
            <input type="text" placeholder="Slika: " />
            <button class="btn btn-submit" type="submit">
                <div class="valign-wrapper">Dodaj dogodek &nbsp
                    <i class="material-icons">send</i>
                </div>
            </button>
        </form>
    </div>
</div>
<<<<<<< HEAD
<div class="container">
    <h2>
        Dodajanje dogodka
    </h2>
    <form action="#" method="post">
        <input type="text" name="naziv" placeholder="Naziv*: "/>
        <input type="text" name="kraj" placeholder="Kraj*: "/>
        <input type="text" name="naslov" placeholder="Naslov*: "/>
        <input type="text" name="tipDogodka" placeholder="Tip dogodka*: "/>
        <input type="text" name="urlDogodka" placeholder="Povezava na dogodek: "/>
        <input type="text" name="datum" placeholder="Datum*: "/>
        <input type="text" name="slika" placeholder="Slika: "/>
        <input type="text" name="opis" placeholder="Opis dogodka: "/>
        <button type="submit">Dodaj dogodek</button>
    </form>
</div>
</div>
=======
>>>>>>> 4e6cf65c4c804b3294948b2e1d481d77c9ffe6a6
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/materialize.min.js"></script>
<script>
    $(document).ready(function () {
        $('.dropdown-button').dropdown({
            constrainWidth: false,
            hover: true,
            belowOrigin: true,
            alignment: 'left'
        });
        $('.button-collapse').sideNav();
    });
</script>

</html>