<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="sl">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registracija</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="materialize.min.css"/>
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <script src="main.js"></script>
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

                            <%  }  else { %>
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
        <h2 class="center-align">
            Registracija
        </h2>
        <div class="row">
            <div class="col s10 offset-s1 l8 offset-l2">
                <form action="/dodajanjeOsebe" method="post">
                    <div class="input-field col s12 l6">
                        <input required id="first_name" type="text" class="validate" name="ime">
                        <label for="first_name">Ime</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="last_name" type="text" class="validate" name="priimek">
                        <label for="last_name">Priimek</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="geslo" type="password" class="validate" name="geslo" onkeyup="preveriGesli()">
                        <label for="geslo">Geslo</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="gesloPotrdi" type="password" class="validate" onkeyup="preveriGesli()">
                        <label for="gesloPotrdi">Potrdite Geslo</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="email" type="email" class="validate" name="email" onkeyup="preveriPosti()">
                        <label for="email" data-error="" data-success="">E-mail</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="emailPotrdi" type="email" class="validate" onkeyup="preveriPosti()">
                        <label for="emailPotrdi" data-error="" data-success="">Potrdite E-mail</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input required id="datumRojstva" type="text" class="datepicker validate" name="datumRojstva">
                        <label for="datumRojstva">Datum Rojstva</label>
                    </div>
                    <div class="input-field col s12 l6">
                        <input id="telefon" type="text" class="" name="telefonska">
                        <label for="telefon">Telefon</label>
                    </div>
                    <div id="warningDiv" class="col s12 center-align red-text text-lighten-2"></div>
                    <button id="registrirajSe" class="btn col teal darken-1 z-depth-3 offset-l3 l6 s10 offset-s1 btn-large" type="submit">
                        Registriraj se
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

<script>

    function preveriGesli() {
        if($('#geslo').val() == $('#gesloPotrdi').val())
        {
            $('#warningDiv').html("");
            $('#registrirajSe').attr("disabled", false);
        }
        else
        {
            $('#warningDiv').html("Gesli se ne ujemata");
            $('#registrirajSe').attr("disabled", true);
        }
    }
    function preveriPosti() {
        if($('#email').val() == $('#emailPotrdi').val())
        {
            $('#warningDiv').html("");
            $('#registrirajSe').attr("disabled", false);
        }
        else
        {
            $('#warningDiv').html("E-pošti se ne ujemata");
            $('#registrirajSe').attr("disabled", true);
        }
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
            selectYears: 200, // Creates a dropdown of 15 years to control year,
            today: 'Today',
            clear: 'Clear',
            close: 'Ok',
            closeOnSelect: false, // Close upon selecting a date,
            container: undefined // ex. 'body' will append picker to body


        })
        Materialize.updateTextFields();
    });
</script>

</html>