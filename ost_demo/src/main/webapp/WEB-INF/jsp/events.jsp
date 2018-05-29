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

          <li>
            <a href="index">Domov</a>
          </li>
          <li class="active">
            <form action="events" method="get">
              <a class="dropdown-trigger" data-activates="dropdownEvents" href="#">
                Dogodki
                <i class="material-icons right">arrow_drop_down</i>
              </a>
              <ul id='dropdownEvents' class='dropdown-content'>
                <li class="active">
                  <a href="#">
                    <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Glasba</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">
                    <button class="btn-flat teal-text" type="submit" name="event" value="Gledališče">Gledališèe</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">
                    <button class="btn-flat teal-text" type="submit" name="event" value="Razstaava">Razstave</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">
                    <button class="btn-flat teal-text" type="submit" name="event" value="Šport">Šport</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#">
                    <button class="btn-flat teal-text" type="submit" name="event" value="Kino">Kino</button>
                  </a>
                </li>
              </ul>
            </form>
          </li>

        </ul>
        <ul class="side-nav" id="mobile-sidenav">
          <form action="events" method="get">
            <li>
              <a href="index">Home</a>
            </li>

            <li class="active">
              <button class="btn-flat" type="submit" name="event" value="Glasba">Glasba</button>
            </li>
            <li>
              <button class="btn-flat" type="submit" name="event" value="Gledališče">Gledališèe</button>
            </li>
            <li>
              <button class="btn-flat" type="submit" name="event" value="Razstava">Razstave</button>
            </li>
            <li>
              <button class="btn-flat" type="submit" name="event" value="Šport">Šport</button>
            </li>
            <li>
              <button class="btn-flat" type="submit" name="event" value="Kino">Kino</button>
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
      <form class="col s12">
        <div class="row ">
          <div class="input-field col offset-l3 l6 offset-m2 m8 offset-s1 s10 valign-wrapper center-align">
            <i class="material-icons prefix">search</i>
            <input id="eventsSearchNaziv" type="text" class="validate" placeholder="Naziv" name="nazivDOgodka">
            <input id="eventsSearchKraj" type="text" class="validate" placeholder="Kraj" name="krajDOgodka">
            <button class="btn-flat" type="submit" name="search">
              <i class="material-icons suffix">keyboard_return</i>
            </button>

          </div>
        </div>
        <!-- Zaèetek searcha NAPREDNO-->
        <div class="row center-align">
          <h4>Dodatno </h4>
          <div class="offset-s3 col s3">
            <input type="text" class="datepicker" placeholder="Datum Prièetka" name="datumDogodka">
          </div>
          <div class="col s3">
            <p class="range-field">
              <label for="najCena">Max Cena</label>
              <input type="range" id="najCena" min="0" max="1000"  name="cenaDogodka"/>
            </p>
          </div>
        </div>
      </form>
    </div>



    <!--src="${pageContext.request.contextPath}/lib/slike

    <!-- Zaèetek Vrstice-->
    <div class="row">
      <c:forEach items="${dogodki}" var="d">
      <!-- Zaèetek ENE Karte-->
      <div class="col s12 m6 l4">
        <div class="card hoverable">
          <div class="card-image waves-effect waves-block">
            <img class="activator responsive-image" height="300" width="300" src="${d.slikaURL}">
          </div>
          <div class="card-content">
              <span class="card-title activator grey-text text-darken-4">${d.naziv}
                <i class="material-icons right">expand_less</i>
              </span>
            <p>
                <span class="">Lokacija: Vienna
                  <br/>
                </span>
              <a href="">Veè...</a>
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
              <div class="valign-wrapper"> Veè &nbsp
                <i class="material-icons">add_circle</i>
              </div>
            </button>
            </p>
          </div>
        </div>
      </div>
      <!-- Konec ENE Karte-->
      </c:forEach>

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

    });
</script>

</html>