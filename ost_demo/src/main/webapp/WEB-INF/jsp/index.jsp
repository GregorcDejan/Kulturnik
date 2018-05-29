<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html >

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Kulturnik</title>
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
                  <a href="/dodajanjeDogodkov">
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
              <form action="/events" method="get">
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
                      <button class="btn-flat teal-text" type="submit" name="event" value="Gledališče">Gledališče</button>
                    </a>
                  </li>
                  <li class="divider"></li>
                  <li>
                    <a href="#">
                      <button class="btn-flat teal-text" type="submit" name="event" value="Razstava">Razstave</button>
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
                <button class="btn-flat" type="submit" name="event" value="Kino">Kino</button>
              </li>

            </form>
          </ul>
        </div>
      </nav>
    </div>
    <div class="container">
      <div class="row">
        <h1 class="center-align col s12">Kulturnik</h1>
        <hr/>
      </div>
      <div class="carousel carousel-slider hoverable z-depth-4" data-indicators="true">
        <a class="carousel-item" href="#one!">
          <img src="${pageContext.request.contextPath}/lib/slike/hkphil1718.JPG">
        </a>
        <a class="carousel-item" href="#two!">
          <img src="${pageContext.request.contextPath}/lib/slike/bkpam2284930_gallery6.jpeg">
        </a>
        <a class="carousel-item" href="#three!">
          <img src="${pageContext.request.contextPath}/lib/slike/hammerfall.jpg">
        </a>
        <a class="carousel-item" href="#four!">
          <img src="${pageContext.request.contextPath}/lib/slike/musicLogo.png">
        </a>
        <a class="carousel-item" href="#five!">
          <img src="${pageContext.request.contextPath}/lib/slike/generic-event.jpg">
        </a>
      </div>
      <div class="row">
        <div class="col s12">
          <h3 class="center-align">O nas</h3>
          <p class="flow-text center-align">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perspiciatis enim corrupti excepturi fuga nam assumenda
            repudiandae harum recusandae beatae! Quis porro obcaecati dolor, quasi explicabo illo nihil quas ipsum vitae!
            Lorem ipsum, dolor sit amet consectetur adipisicing elit. Praesentium error provident iste facere, nostrum sed
            eaque consectetur blanditiis cumque. Voluptatum blanditiis tempora quam, nesciunt vitae eveniet officiis possimus
            inventore perspiciatis?
          </p>
        </div>
      </div>
      <div class="row">
        <div class="col s12 xl3">
          <h3 class="center-align">Kontakt</h3>
          <div class="grey lighten-3">
            <ul class="collection z-depth-1">
              <li class="collection-item avatar grey lighten-3">
                <img src="res/lucka.jpg" alt="" class="circle">
                <span class="title">Lucija Brezočnik</span>
                <p>
                  Project Owner
                  <br/> lucija.brezocnik@um.si
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons red-text text-lighten-2">send</i>
                </a>
              </li>
              <li class="collection-item avatar grey lighten-3">
                <img src="res/lepotec.jpg" alt="" class="circle">
                <span class="title">Marko Gluhak</span>
                <p>
                  Front-End
                  <br/> markogl@comtrade.com
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons red-text text-lighten-2">send</i>
                </a>
              </li>
              <li class="collection-item avatar grey lighten-3">
                <img src="res/ninc.jpg" alt="" class="circle">
                <span class="title">Nina Kliček</span>
                <p>
                  Back-End
                  <br/> marko.mx.gluhak@gmail.com
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons red-text text-lighten-2">send</i>
                </a>
              </li>
              <li class="collection-item avatar grey lighten-3">
                <img src="res/dejc.jpg" alt="" class="circle">
                <span class="title">Dejan Gregorc</span>
                <p>
                  Back-End
                  <br/> gregorc.dejan@gmail.com
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons red-text text-lighten-2">send</i>
                </a>
              </li>
              <li class="collection-item avatar grey lighten-3">
                <img src="res/lepotec.jpg" alt="" class="circle">
                <span class="title">Maruša Konečnik</span>
                <p>
                  Back-End
                  <br/> marko.mx.gluhak@gmail.com
                </p>
                <a href="#!" class="secondary-content">
                  <i class="material-icons red-text text-lighten-2">send</i>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col s12 xl6 section">
          <h3 class="center-align">Dogodki na dlani</h3>
          <p class="flow-text center-align">
            Lorem, ipsum dolor sit amet consectetur adipisicing elit. Nisi libero hic, laborum rem iusto quam unde, itaque repudiandae
            molestiae ipsum obcaecati. Consequuntur eveniet harum, dolore minus beatae illo impedit? Odio.
          </p>
        </div>
        <div class="col s12 xl3">
          <h3 class="center-align">V Sodelovanju</h3>
          <p class="flow-text center-align">
            <div class="card grey lighten-3 hoverable">
              <div class="card-content white-text">
                <span class="card-title">
                  <blockquote class="grey-text">
                    Napovednik.com
                  </blockquote>
                </span>
                <p>
                  <div id="napovednikbox2" class="grey-text text-darken-2 "></div>
                </p>
              </div>
              <div class="card-action red lighten-2 center-align">
                <a href="https://www.napovednik.com" class="grey-text text-lighten-2">Ne spreglejte tudi</a>
              </div>
            </div>
          </p>
        </div>
      </div>
    </div>
  </main>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lib/javascript/materialize.min.js"></script>

<script>

  if (typeof jQuery == 'undefined') {
    document.write('<script type="text/javascript" src="https://www.napovednik.com/script/jquery.js"></scrip' + 't>');
  }
  var rubrika = 0;
  var regija = '';
  var zapisov = 5;
  var prireditelj = 0;
  var conv = 0;
  function getbox() {
    jQuery.ajax({
      type: 'GET',
      url: 'https://www.napovednik.com/box.php?n=' + zapisov + '&k=' + rubrika + '&r=' + regija + '&c=' + conv + '&pr=' + prireditelj + '&jsoncallback=?',
      dataType: 'json',
      jsonp: 'jsoncallback',
      success: function (data) {
        document.getElementById('napovednikbox2').innerHTML = data['data'];
      }
    });
  }
  jQuery(document).ready(function () { getbox(); });


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

    // Carousel //
    $('.carousel.carousel-slider').carousel({
      fullWidth: true,
      noWrap: true
    });



  });
</script>

</html>