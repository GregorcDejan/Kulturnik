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
                                    <button class="btn-flat teal-text">Dodaj Dogodek</button>
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
                                    <button class="btn-flat teal-text">Moji Dogodki</button>
                                </a>
                            </li>
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
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">
                                            Gledališče
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">
                                            Razstave
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">
                                            Šport
                                        </button>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="#">
                                        <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">
                                            Kino
                                        </button>
                                    </a>
                                </li>
                            </ul>
                    </li>
                    </form>
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
                            <button class="btn-flat" type="submit" name="event" value="Glasba">Gledališče</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Glasba">Razstave</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Glasba">Šport</button>
                        </li>
                        <li>
                            <button class="btn-flat" type="submit" name="event" value="Glasba">Kino</button>
                        </li>
                    </form>
                </ul>
            </div>
        </nav>
    </div>
    <div class="container">
        <div class="row">
            <div class="col m4">
                <div class="card-panel teal medium">
          <span class="white-text">I am a very simple card. I am good at containing small bits of information.
          I am convenient because I require little markup to use effectively. I am similar to what is called a panel in other frameworks.
          </span>
                </div>
            </div>
            <div class="col m8">
                <div class="row">
                    <div class="col m12"><h4>Dogodki uporabnika</h4></div>
                    <hr>
                            <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <!-- Začetek ENE Karte-->
                    <div class="col s12 m6 l4">
                        <div class="card hoverable medium">
                            <div class="card-image waves-effect waves-block">
                                <img class="activator responsive-image" src="/lib/slike/hammerfall.jpg">
                            </div>
                            <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">HammerFall Rock of Ages!
                <i class="material-icons right">expand_less</i>
              </span>
                                <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
                                    <a href="">Več...</a>
                                </p>
                            </div>
                            <div class="card-reveal">
              <span class="card-title grey-text text-darken-4">
                <i class="material-icons right">expand_more</i>HammerFall Rock of Ages!</span>
                                <p>Lokacija: Vienna
                                    <br/> Cena: 25€
                                    <br/> Izvajalec: HammerFall
                                    <br/> Organizator: Rock of Ages
                                    <br/>
                                <p class="">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Labore velit nihil consectetur temporibus quae
                                    praesentium, soluta ratione ex dolorum unde illo sequi laudantium doloribus veniam ab ad aperiam vero at.
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum libero ut sunt tenetur doloribus consequuntur
                                    nesciunt nemo, laboriosam fuga. Nihil optio reiciendis sed officiis sit sapiente incidunt eligendi quidem
                                    excepturi?
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
                    <!-- Konec ENE Karte-->
                    <ul class="pagination">
                        <li class="disabled"><a href="#!"><i class="material-icons">chevron_left</i></a></li>
                        <li class="active"><a href="#!">1</a></li>
                        <li class="waves-effect"><a href="#!">2</a></li>
                        <li class="waves-effect"><a href="#!">3</a></li>
                        <li class="waves-effect"><a href="#!">4</a></li>
                        <li class="waves-effect"><a href="#!">5</a></li>
                        <li class="waves-effect"><a href="#!"><i class="material-icons">chevron_right</i></a></li>
                    </ul>
                </div>
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