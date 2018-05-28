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
    <link type="text/css" rel="stylesheet" href="/lib/css/materialize.min.css" media="screen,projection" />
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css" />
    <link rel="stylesheet" type="text/css" href="materialize.min.css"  />
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>

    </style>
</head>

<body>
  <main class="teal lighten-5">
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
                <li class="active">
                  <a href="add.html">
                    <button class="btn-flat teal-text">Dodaj Dogodek</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="vpis.html">
                    <button class="btn-flat teal-text">Vpis</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="registracija.html">
                    <button class="btn-flat teal-text">Registracija</button>
                  </a>
                </li>
                <li class="divider"></li>
                <li>
                  <a href="#!">
                    <button class="btn-flat teal-text">Moji Dogodki</button>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
          <ul id="nav-mobile" class="right hide-on-med-and-down">

            <li>
              <a href="index.html">Domov</a>
            </li>
            <li>
              <form action="events.html" method="get">
                <a class="dropdown-trigger" data-activates="dropdownEvents" href="#">
                  Dogodki
                  <i class="material-icons right">arrow_drop_down</i>
                </a>
                <ul id='dropdownEvents' class='dropdown-content'>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Glasba</button>
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Gledališče</button>
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Razstave</button>
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Šport</button>
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Glasba">Kino</button>
                    </a>
                  </li>
                </ul>
            </li>
            </form>
          </ul>
          <ul class="side-nav" id="mobile-sidenav">
            <form action="events.html" method="get">
              <li>
                <a href="index.html">Home</a>
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
      <h2 class="center-align">
        Dodaj dogodek
      </h2>
      <form action="#" method="post">
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" name="" id="nazivInput" class="validate">
            <label for="nazivInput">Naziv</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" name="" id="krajInput" class="validate">
            <label for="krajInput">Kraj</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" name="" id="lokacijaInput" class="validate">
            <label for="lokacijaInput">Lokacija</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2 ">
            <select required name="inputKategorija" id="inputKategorija">
              <option value="" disabled selected>Izberite tip dogodka</option>
              <option value="Glasba">Glasba</option>
              <option value="Gledališče">Gledališče</option>
              <option value="Razstave">Razstave</option>
              <option value="Šport">Šport</option>
              <option value="Kino">Kino</option>
            </select>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" name="" id="linkInput" class="validate">
            <label for="linkInput">Povezava do dogodka</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" id="datumInput" class="datepicker">
            <label for="datumInput">Datum dogodka</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <input required type="text" id="casInput" class="timepicker">
            <label for="casInput">Čas začetka</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s8 offset-s2">
            <textarea required id="opisDogodkaInput" name="" class="materialize-textarea"></textarea>
            <label for="opisDogodkaInput">Opis dogodka</label>
          </div>
        </div>
        <div class="row">
          <div class="file-field input-field col s8 offset-s2">
            <div class="btn teal darken-2">
              <span>Naloži</span>
              <input type="file" multiple>
            </div>
            <div class="file-path-wrapper">
              <input class="file-path validate" type="text" placeholder="Naložite slike dogodka">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col offset-s4">
            <button class="btn teal darken-2 z-depth-3" type="submit">
              <div class="valign-wrapper">Dodaj dogodek
                <i class="material-icons right">send</i>
              </div>
          </div>
          </button>
        </div>
      </form>
    </div>
  </main>
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
      aftershow: function () { } //Function for after opening timepicker
    });

  });
</script>

</html>