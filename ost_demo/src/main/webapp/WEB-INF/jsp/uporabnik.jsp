<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kulturnik</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection"/>
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css">
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
                        <a href="search">
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
                                    <button class="btn-flat teal-text">Izpis</button>
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
                        <form action="events" method="get">
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
                                                value="Gledališče">
                                            Gledališče
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
                    <form action="events" method="get">
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
    <div class="row">
        <div class="col offset-m2 m8">
            <h1 class="center-align">
                <c:forEach items="${uporabnik}" var="u">
                    ${u.ime} ${u.priimek}
                </c:forEach>
            </h1>
            <hr>
        </div>
        <div class="row">
            <div class="col offset-s1 s10">
                <div class="row">
                    <div class="col m3">
                        <div class="card-panel teal lighten-4 z-depth-1 medium center-align">
                            <div class="row">
                                <img class="responsive-img z-depth-0 circle col offset-s1 s10 offset-l3 l6"
                                     src="lib/slike/lepotec.jpg" alt=""> <form action="registracija"> <button class="btn-floating btn btn-flat black-text" name="urejanjeProfila" value="true"><i
                                    class="material-icons right small black-text">settings</i></button> </form>
                                <hr class="col offset-s1 s10">
                            </div>
                            <c:forEach items="${uporabnik}" var="u">
                            <span class="flow-text">
                                    ${u.ime} ${u.priimek}  <br>
                                    ${u.email} <br>
                                    ${u.telefonska} <br>
                                    ${u.datumRojstva} <br>
                                    Dodani dogodki: ${stDogodkovUporabnika}
                            </span>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="col m9">
                        <div class="row">
                            <h2 class="center-align">
                                Dodani dogodki:
                            </h2>
                            <c:forEach items="${dogodki}" var="d">
                                <!-- Začetek Vrstice-->


                                <!-- Začetek ENE Karte-->
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
                                    <span class="">Lokacija: ${d.lokacija} <a
                                            class="btn-floating btn right waves-effect waves-light teal"><i
                                            class="material-icons">edit</i></a>
                                      <br/>
                                    </span>
                                                <a href="${d.vir}">Več...</a>
                                            </p>
                                        </div>
                                        <div class="card-reveal">
                                            <span class="card-title grey-text text-darken-4">
                                                <i class="material-icons right">expand_more</i>${d.naziv}</span>
                                            <p>Lokacija: ${d.lokacija}
                                                <br/> Cena: ${d.cena}
                                                    ${d.opis}
                                                <a href=""></a>
                                                <button class="btn valign-wrapper right teal lighten-3 lighten-1 waves-effect">
                                                    <div class="valign-wrapper"> Več
                                                        <i class="material-icons right">add_circle</i>
                                                    </div>
                                                </button>
                                            </p>
                                        </div>
                                    </div>
                                </div>


                                <!-- Konec ENE Karte-->
                            </c:forEach>
                        </div>
                    </div>
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

            </div>
        </div>
    </div>
</main>
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


    });
</script>

</html>