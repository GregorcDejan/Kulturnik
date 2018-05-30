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
                          <% if(Boolean.valueOf(String.valueOf(session.getAttribute("uporabnikPrijavljen")))){%>
                          <%=
                          String.valueOf(session.getAttribute("imeUporabnika"))
                          %>
                          <%=
                          String.valueOf(session.getAttribute("priimekUporabnika"))
                          %>
                         <% }
                         else
                         {%>
                             <%="Neprijavljen uporabnik "%>
                          <%}%>
                        </span>
                    </button>
                  </form>
                </li>
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
      <h2 class="center-align">
        Dogodek
      </h2>
      <hr/>

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