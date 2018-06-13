<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="sl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Dogodek</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css"/>
</head>
<body class="teal lighten-5">


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
                        <a href="map">
                            <i class="material-icons">place</i>
                        </a>
                    </li>
                    <li>
                        <a class="dropdown-trigger" data-activates="dropdownPerson" href="#">
                            <i class="material-icons left">person</i>
                        </a>
                        <ul id='dropdownPerson' class='dropdown-content'>
                            <% if (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))))
                            { %>
                            <li class="collection-item avatar valign-wrapper">
                                <i class="material-icons right teal-text">person </i>
                                <form action="/events" method="get">
                                    <button class="btn-flat teal-text" name="event" value="Moji dogodki">
                                <span class="right ">
                                    <%=
                                    String.valueOf(session.getAttribute("imeUporabnika"))
                                    %>
                                  <%=
                                  String.valueOf(session.getAttribute("priimekUporabnika"))
                                  %>
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
                                <a href="#!">
                                    <form action="/izpis" method="get">
                                        <button class="btn-flat teal-text">Izpis</button>
                                    </form>
                                </a>
                            </li>

                            <% } else
                            { %>
                            <li class="collection-item avatar valign-wrapper">
                                <i class="material-icons right teal-text">person </i>
                                <span class="right ">

                                     <%="Neprijavljen uporabnik"%>

                                </span>

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
                            <%}%>
                        </ul>
                    </li>
                </ul>
                <ul id="nav-mobile" class="right hide-on-med-and-down">

                    <li>
                        <a href="index">Domov</a>
                    </li>
                    <li class="active">
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
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Film">
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

        <c:choose>
            <c:when test="${lokacijaDogodka!=null}">
                <h2 class="center-align">Dogodki na lokaciji ${lokacijaDogodka}</h2>
            </c:when>
        </c:choose>
        <h2 class="center-align">
            ${Kategorija}
            <span class="right">
                <form action="/downXML " method="get" target="_blank" class="right">
                     <button class="btn waves-effect waves-light btn-flat btn-floating" type="submit">
                        <i class="material-icons black-text">import_export</i>
                     </button>
                </form>
                <form action="/parseXML" class="right">
                    <button class="btn waves-effect waves-light btn-flat btn-floating" name="event"
                            value="${Kategorija}">
                         <i class="material-icons black-text">refresh</i>
                    </button>
                </form>

            </span>
        </h2>
        <hr/>
        <!-- Zaèetek searcha OSNOVNO-->
        <div class="row">
            <form class="col s12" action="/filter" method="get">
                <div class="row ">
                    <div class="input-field col offset-xl2 xl8 offset-m1 m10 s12 valign-wrapper center-align">
                        <i class="material-icons prefix">search</i>
                        <input id="eventsSearchNaziv" type="text" class="validate" placeholder="Naziv"
                               name="nazivDogodka">
                        <input id="eventsSearchKraj" type="text" class="validate" placeholder="Kraj" name="krajDogodka">
                        <input type="hidden" name="lokacijaDogodka" value="${lokacijaDogodka}">
                        <button class="btn-flat" type="submit" name="event" value="${Kategorija}">
                            <i class="material-icons suffix">keyboard_return</i>
                        </button>

                    </div>
                </div>

                <!-- Zaèetek searcha NAPREDNO-->
                <div id="naprednoRow" class="row center-align">
                    <h5 class="offset-s1 left-align">Dodatno
                        <button class="btn btn-flat btn-floating" type="button">
                            <i id="naprednoShow" onclick="showNapredno()" class="material-icons black-text">add</i>
                        </button>
                    </h5>
                    <span id="naprednoShowHide">
                        <div class="offset-s2 offset-l1 col l3 s8">
                            <input type="text" class="datepicker" placeholder="Datum Pričetka" name="datumDogodka">
                        </div>
                        <div class="col l4 offset-s1 s5">
                            <p class="range-field">
                                <label id="najCenaLabel" for="najCena">Max Cena: ${najvisjaCena}</label>
                                <input type="range" id="najCena" min=${najnizjaCena} max=${najvisjaCena} value="100"
                                       name="cenaDogodka"
                                       oninput="displayContent()"/>
                            </p>
                        </div>
                        <div class="col l3 s5">
                            <select name="inputKategorija" id="inputKategorija">
                                <option name="sort" value="" disabled selected>Sortiraj po</option>
                                <option name="sort" value="najcenejsi">Najcenejši naprej</option>
                                <option name="sort" value="najdrazji">Najdražji naprej</option>
                                <option name="sort" value="poImenu1">Po imenu A-Z</option>
                                <option name="sort" value="poImenu2">Po imenu Z-A</option>
                            </select>
                        </div>
                    </span>
                </div>

            </form>

        </div>
        <div class="row">
            <c:forEach items="${dogodki}" var="d">
                <!-- Zaèetek Vrstice-->


                <!-- Zaèetek ENE Karte-->
                <div class="col s12 m6 l4">
                    <div class="card hoverable medium">
                        <div class="card-image waves-effect waves-block">
                            <img class="activator responsive-image" src="${d.slikaURL}">
                        </div>
                        <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">${d.naziv}
                <i class="material-icons right">expand_less</i>
              </span>
                            <p>
                <span class="">Lokacija: ${d.lokacija}
                  <br/>
                </span>
                                <a href="${d.vir}">Več...</a>
                            </p>
                        </div>
                        <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>${d.naziv}</span>
                            <p>Kraj: ${d.kraj}<br/>
                                Ura: ${d.ura}<br/>
                                Izvajalec: ${d.izvajalec}<br/>
                                Lokacija: ${d.lokacija}<br/>
                                Cena: ${d.cena} €<br/>
                                Datum: ${d.datum}<br/>


                            </p>
                            <p class="">${d.opis}
                                <a href=""></a>
                            </p>
                            <form action="/naslov " method="get">

                                <button class="btn valign-wrapper right blue lighten-1 waves-effect" name="ID"
                                        value="${d.id}">
                                    <div class="valign-wrapper"> Prikaži na zemljevidu
                                        <i class="material-icons right">add_circle</i>
                                    </div>
                                </button>
                            </form>

                        </div>
                    </div>
                </div>

                <!-- Konec ENE Karte-->
            </c:forEach>
        </div>

        <!-- Konec Vrstice-->

    </div>
</main>
<footer class="page-footer teal lighten-3">
    <div class="container">
        <div class="row">
            <div class="col l6 s12">
                <h5 class="white-text">Kulturnik</h5>
                <p class="grey-text text-lighten-4">Brought to you by a team of enthusiastic students of information
                    technologies</p>
                <p class="grey-text text-lighten-4"><a class="grey-text text-lighten-4" href="https://github.com/WiiTheThird/Kulturnik">Visit Kulturnik on GitHub</a></p>
            </div>
            <div class="col l6 s12">
                <ul>
                    <li class="grey-text text-lighten-3"><h5>Brought to you by</h5></li>
                    <li class="grey-text text-lighten-3">Fakulteta za Elektrotehniko Računalništvo in Informatiko</li>
                    <li class="grey-text text-lighten-3">Univerza v Mariboru</li>
                    <li class="grey-text text-lighten-3">Praktikum I</li>
                </ul>
            </div>

        </div>
    </div>
    <div class="footer-copyright">
        <div class="container">
            © 2018 Copyright Praktikum Powerhouse
            <a class="grey-text text-lighten-4 right" href="index">Kulturnik</a>
        </div>
    </div>
</footer>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

<script>
    function showNapredno() {
        $('#naprednoShowHide').toggle(500, 'linear');
        if (document.getElementById('naprednoShow').innerText === 'remove') {
            document.getElementById('naprednoShow').innerText = 'add';
        }
        else if (document.getElementById('naprednoShow').innerText === 'add') {
            document.getElementById('naprednoShow').innerText = 'remove';
        }
    }


    function displayContent() {
        document.getElementById('najCenaLabel').innerHTML = 'Max Cena: ' + document.getElementById("najCena").value;
    }
</script>
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
            selectMonths: true,
            selectYears: 15,
            today: 'Danes',
            clear: 'Počisti',
            close: 'Vredu',
            closeOnSelect: false,
            container: undefined


        })
        $(document).ready(function () {
            $('select').material_select();
        });

        $('#naprednoShowHide').hide();
        Materialize.updateTextFields();
    });
</script>

</html>