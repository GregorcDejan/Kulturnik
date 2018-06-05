<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="sl">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dodaj Dogodek</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="materialize.min.css"/>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <style>

    </style>
</head>

<body>

<main class="teal lighten-5">
    <div class="navbar-fixed">
        <nav class=" teal darken-2 z-depth-3">
            <div class="nav-wrapper">
                <a href="index" class="brand-logo">Kulturnik</a>
                <a href="#" class="button-collapse" data-activates="mobile-sidenav">
                    <i class="material-icons">menu</i>
                </a>
                <ul class="right show-on-med-and-down">
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
                            <li class="collection-item avatar valign-wrapper">
                                <i class="material-icons right teal-text">person </i>


                                <form action="/events" method="get">
                                    <button class="btn-flat teal-text" name="event" value="Moji dogodki">
                  <span class="right ">
                    <% if (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen")))) {%>
                    <%=
                    String.valueOf(session.getAttribute("imeUporabnika"))
                    %>
                    <%=
                    String.valueOf(session.getAttribute("priimekUporabnika"))
                    %>
                   <% } else {%>
                       <%="Neprijavljen uporabnik "%>
                    <%}%>
                  </span>
                                    </button>
                                </form>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="add">
                                    <form action="/uredi" method="get">
                                        <button class="btn-flat teal-text" name="ime" value="dodajanje">Dodaj Dogodek
                                        </button>
                                    </form>
                                </a>

                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="vpis">
                                    <button class="btn-flat teal-text">Vpis</button>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="registracija">
                                    <button class="btn-flat teal-text">Registracija</button>
                                </a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="#!">
                                    <form action="/izpis" method="get">
                                        <button class="btn-flat teal-text">Izpis</button>
                                    </form>
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <ul id="nav-mobile" class="right hide-on-med-and-down">

                    <li class="active">
                        <a href="index">Domov</a>
                    </li>
                    <li>
                        <form action="/events" method="get">
                            <a class="dropdown-trigger" data-activates="dropdownEvents" href="#">
                                Dogodki
                                <i class="material-icons right">arrow_drop_down</i>
                            </a>
                            <ul id='dropdownEvents' class='dropdown-content'>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">
                                            Glasba
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event"
                                                value="Gledališče">Gledališče
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Razstava">
                                            Razstave
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Šport">
                                            Šport
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Kino">
                                            Kino
                                        </button>
                                    </a>
                                </li>
                            </ul>
                        </form>
                    </li>
                </ul>
                <ul class="side-nav" id="mobile-sidenav">
                    <form action="/events" method="get">
                        <li class="active">
                            <a href="index">Home</a>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Glasba">Glasba</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Gledališče">Gledališče</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Razstava">Razstave</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Šport">Šport</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Film">Kino</button>
                        </li>

                    </form>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container">
        <h2 class="center-align">
            <c:choose>
                <c:when test="${urejanjeDogodka==true}">
                    Urejanje dogodka
                </c:when>

                <c:when test="${urejanjeDogodka==false}">
                    Dodajanje dogodka
                </c:when>

            </c:choose>
        </h2>
        <form action="/dodajDogodek" method="post">
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" name="naziv" id="nazivInput" class="validate"
                           value="${urejanDogodek.naziv}">
                    <label for="nazivInput">Naziv</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" name="izvajalec" id="izvajalecInput" class="validate"
                           value="${urejanDogodek.izvajalec}">
                    <label for="izvajalecInput">Izvajalec</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" name="kraj" id="krajInput" class="validate"
                           value="${urejanDogodek.kraj}">
                    <label for="krajInput">Kraj</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" name="lokacija" id="lokacijaInput" class="validate"
                           value="${urejanDogodek.lokacija}">
                    <label for="lokacijaInput">Naslov (prostor)</label>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s8 offset-s2 ">

                    <select required name="tipDogodka" id="inputKategorija">
                        <option value="" disabled selected>Izberite kategorijo
                        </option>
                        <option value="Glasba">Glasba</option>
                        <option value="Gledališče">Gledališče</option>
                        <option value="Razstava">Razstava</option>
                        <option value="Šport">Šport</option>
                        <option value="Film">Kino</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" name="urlDogodka" id="linkInput" class="validate"
                           value="${urejanDogodek.vir}">
                    <label for="linkInput">Povezava do dogodka</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" id="datumInput" name="datum" class="datepicker"
                           value="${urejanDogodek.datum}">
                    <label for="datumInput">Datum dogodka</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="text" id="casInput" name="ura" class="timepicker"
                           value="${urejanDogodek.ura}">
                    <label for="datumInput">Čas dogodka</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <input required type="number" id="cenaInput" name="cena" value="${urejanDogodek.cena}">
                    <label for="cenaInput">Cena</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s8 offset-s2">
                    <textarea required id="opisDogodkaInput" name="opis"
                              class="materialize-textarea">${urejanDogodek.opis}</textarea>
                    <label for="opisDogodkaInput">Opis dogodka</label>
                </div>
            </div>
            <div class="row">
                <div class="file-field input-field col s8 offset-s2">
                    <div class="btn teal darken-1">
                        <span>Naloži</span>
                        <input type="file" multiple>
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" name="slika" type="text" placeholder="Naložite slike dogodka">
                    </div>
                </div>
            </div>
            <div class="row">
                <form action="/dodajDogodek" method="post">
                    <button class="btn teal darken-1 z-depth-3 col offset-l4 l4 offset-s3 s6 btn-large" type="submit"
                            name="idDogodka" value="${idD}">
                        <c:choose>
                            <c:when test="${urejanjeDogodka==true}">
                                Uredi dogodek
                            </c:when>

                            <c:when test="${urejanjeDogodka==false}">
                                Dodaj dogodek
                            </c:when>
                        </c:choose>
                    </button>
                </form>
            </div>
        </form>
    </div>
</main>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

<script>


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
        $(document).ready(function () {
            $('select').material_select();
        });
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Danes',
            clear: 'Zbriši',
            close: 'Potrdi',
            closeOnSelect: false, // Close upon selecting a date,
            container: undefined // ex. 'body' will append picker to body
        });
        $('.timepicker').pickatime({
            default: 'now', // Set default time: 'now', '1:30AM', '16:30'
            fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
            twelvehour: false, // Use AM/PM or 24-hour format
            donetext: 'Potrdi', // text for done-button
            cleartext: 'Počisti', // text for clear-button
            canceltext: 'Prekliči', // Text for cancel-button,
            container: undefined, // ex. 'body' will append picker to body
            autoclose: false, // automatic close timepicker
            ampmclickable: true, // make AM PM clickable
            aftershow: function () {
            } //Function for after opening timepicker
        });

    });

    $('#inputKategorija').val("${urejanDogodek.tip}");

</script>

</html>