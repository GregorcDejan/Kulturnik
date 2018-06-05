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
                                  <% if (Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen"))))
                                  {%>
                                  <%=
                                  String.valueOf(session.getAttribute("imeUporabnika"))
                                  %>
                                  <%=
                                  String.valueOf(session.getAttribute("priimekUporabnika"))
                                  %>
                                 <% } else
                                 {%>
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
                                <li class="active">
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
                        <li>
                            <a href="index">Home</a>
                        </li>

                        <li class="active">
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
            ${Kategorija}

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
                                <input type="range" id="najCena" min=${najnizjaCena} max=${najvisjaCena} value="100" name="cenaDogodka"
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
                            <form action="/uredi" method="get">
                                <button class="btn valign-wrapper right blue lighten-1 waves-effect" name="ime"
                                        value="${d.id}">
                                    <div class="valign-wrapper"> Več
                                        <i class="material-icons right">add_circle</i>
                                    </div>
                                </button>
                            </form>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Konec ENE Karte-->
            </c:forEach>
        </div>

        <!-- Konec Vrstice-->
        <ul class="pagination right">
            <li class="disabled">
                <a href="#!">
                    <i class="material-icons">chevron_left</i>
                </a>
            </li>
            <li class="active teal darken-2">
                <a href="#!">1</a>
            </li>
            <li class="waves-effect">
                <a href="#!">2</a>
            </li>
            <li class="waves-effect">
                <a href="#!">3</a>
            </li>
            <li class="waves-effect">
                <a href="#!">4</a>
            </li>
            <li class="waves-effect">
                <a href="#!">5</a>
            </li>
            <li class="waves-effect">
                <a href="#!">
                    <i class="material-icons">chevron_right</i>
                </a>
            </li>
        </ul>
    </div>
</main>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

<script>
    function showNapredno() {
        $('#naprednoShowHide').toggle(500, 'linear');
        if(document.getElementById('naprednoShow').innerText === 'remove')
        {
            document.getElementById('naprednoShow').innerText = 'add';
        }
        else if(document.getElementById('naprednoShow').innerText === 'add')
        {
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
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 15, // Creates a dropdown of 15 years to control year,
            today: 'Danes',
            clear: 'Počisti',
            close: 'Vredu',
            closeOnSelect: false, // Close upon selecting a date,
            container: undefined // ex. 'body' will append picker to body


        })
        $(document).ready(function () {
            $('select').material_select();
        });

        $('#naprednoShowHide').hide();

    });
</script>

</html>