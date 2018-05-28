<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="sl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dogodek</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css" />



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
                        <form action="/events" method="get"><button type="submit">Glasba</button><input type="hidden" value="Glasba" name="tip"/></form>
                    </li>
                    <li>
                        <form action="/events" method="get"><button type="submit">Gledališče</button><input type="hidden" value="Gledališče" name="tip"/></form>
                    </li>
                    <li>
                        <form action="/events" method="get"><button type="submit">Razstava</button><input type="hidden" value="Razstava" name="tip"/></form>
                    </li>
                    <li>
                        <form action="/events" method="get"><button type="submit">Šport</button><input type="hidden" value="Šport" name="tip"/></form>
                    </li>
                    <li>
                        <form action="/events" method="get"><button type="submit">Kino</button><input type="hidden" value="Kino" name="tip"/></form>
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
            ${Kategorija}
        </h2>
        <hr/>
        <div class="row">
            <form class="col s12">
                <div class="row ">
                    <div class="input-field col offset-l3 l6 offset-m2 m8 offset-s1 s10 valign-wrapper center-align">
                        <i class="material-icons prefix">search</i>
                        <input id="eventsSearchNaziv" type="text" class="validate" placeholder="Naziv">
                        <input id="eventsSearchKraj" type="text" class="validate" placeholder="Kraj">
                        <input id="eventsSearchKategorija" type="text" class="validate" placeholder="Kategorija">
                        <button class="btn-flat">
                            <i class="material-icons suffix" type="submit">keyboard_return</i>
                        </button>

                    </div>
                </div>
                <div class="filtri">
                    <div class="row">
                        <h4>Napredno</h4>
                        <div class="col m3">
                            <input type="text" class="datepicker" placeholder="Datum Pričetka">
                            <input type="text" class="datepicker" placeholder="Datum Konca">
                        </div>
                        <div class="col m3">
                            <p class="range-field">
                                <label for="zacCena">Min Cena</label>
                                <input type="range" id="zacCena" min="0" max="1000" />
                            </p>
                            <p class="range-field">
                                <label for="najCena">Max Cena</label>
                                <input type="range" id="najCena" min="0" max="1000" />
                            </p>
                        </div>
                        <div class="col m3">
                            <p>Pretekli dogodki</p>
                            <div class="switch">
                                <label>
                                    Ne
                                    <input type="checkbox">
                                    <span class="lever"></span>
                                    Da
                                </label>

                            </div>
                            <div class="input-field">
                                <select multiple>
                                    <option value="" disabled selected>Kategorija</option>
                                    <option value="1">Glasba</option>
                                    <option value="2">Gledališče</option>
                                    <option value="3">Razstave</option>
                                    <option value="4">Športni Dogodki</option>
                                    <option value="5">Kino</option>
                                </select>
                                <label>Izberite Kategorijo</label>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>





    <!-- Začetek Vrstice-->
    <div class="row">
        <!-- Začetek ENE Karte-->
        <c:forEach items="${dogodki}" var="dogodek">
        <div class="col s12 m6 l4">
            <div class="card hoverable">
                <div class="card-image waves-effect waves-block">
                    <img class="activator responsive-image" src="${dogodek.slikaURL}" height="300" width="300">
                </div>
                <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">${dogodek.naziv}
                <i class="material-icons right">expand_less</i>
              </span>
                    <p>
                <span class="">Lokacija: ${dogodek.kraj}
                  <br/>
                </span>
                        <a href="">Več...</a>
                    </p>
                </div>
                <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>${dogodek.naziv}</span>
                    <p>Lokacija: ${dogodek.kraj}
                        <br/> Cena: ${dogodek.cena}
                        <br/> Naslov: ${dogodek.naslov}
                        
                        <br/>
                    <p class="">${dogodek.opis}
                        <a href=""></a>
                    </p>
                    <button class="btn valign-wrapper right blue lighten-1 waves-effect">
                        <div class="valign-wrapper"> Več &nbsp
                            <i class="material-icons">add_circle</i>
                        </div>
                    </button>
                    </p>
                </div>
            </div>
        </div>
        </c:forEach>
        <!-- Konec ENE Karte-->



    </div>
    <!-- Konec Vrstice-->
</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

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


        // Pickdate //
        $('.datepicker').pickadate({
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false, // Close upon selecting a date,
            container: undefined // ex. 'body' will append picker to body


        })
        // Select list //
        $('select').material_select();
    });
</script>

</html>