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
    <link rel="stylesheet" type="text/css" media="screen" href="/lib/css/style.css"/>
</head>

<body class="teal lighten-5">


<main>
    <div class="navbar-fixed">
        <nav class="teal darken-2 z-depth-3">
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
        <div class="row">
            <h1 class="center-align col s12">Kulturnik</h1>
            <hr/>
        </div>

        <div class="row">

            <div class="col offset-s1 offset-l1 s12 l5 section">
                <h3 class="center-align">Današnji dogodki</h3>
                <div class="card-panel grey lighten-3 large">
                    <span class="black-text grey lighten-3">
                        <ul class="collection grey lighten-3 z-depth-3">
                            <c:forEach items="${dogodkiDat}" var="d">
                                <li class="collection-item grey lighten-2 hoverable"><div class="truncate">${d.naziv}<a href="${d.vir}" class="secondary-content"><i class="material-icons red-text text-lighten-2">send</i></a></div></li>
                            </c:forEach>

                        </ul>
                    </span>
                </div>
            </div>
            <!--div class="col s12 xl3">
                <h3 class="center-align">Zadnjih 5</h3>
                <p class="flow-text center-align">
                    <div class="card grey lighten-3 hoverable">
                        <div class="card-content white-text">
                            <c:forEach items="${dogodki}" var="d">
                <p>
                <div id="napovednikbox2" class="grey-text text-darken-2 "><a href="${d.vir}">${d.naziv}</a></div>
                </p>
                </c:forEach>
            </--div>
                <div class="card-action red lighten-2 center-align">
                    <a href="https://www.napovednik.com" class="grey-text text-lighten-2">Ne spreglejte tudi</a>
                </div>
            </div-->
            <div class="col s12 l5">
                <h3 class="center-align">Zadnjih 5</h3>
                <div class="card-panel grey lighten-3 large">
                    <span class="black-text grey z-depth-3 lighten-3">
                        <ul class="collection grey lighten-3  z-depth-3">
                            <c:forEach items="${dogodki}" var="d">
                                <li class="collection-item grey lighten-2 hoverable"><div class="truncate">${d.naziv}<a href="${d.vir}" class="secondary-content"><i class="material-icons red-text text-lighten-2">send</i></a></div></li>
                            </c:forEach>
                        </ul>
                    </span>
                </div>
            </div>
        </div>
        <div class="row">
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
        </div>
        <div class="row">
            <div class="col s12 m4">
                <h3 class="center-align">Kontakt</h3>
                <div class="grey lighten-3">
                    <ul class="collection z-depth-1">
                        <li class="collection-item avatar grey lighten-3">
                            <img src="${pageContext.request.contextPath}/lib/slike/lucka.jpg" alt="" class="circle">
                            <span class="title">Lucija Brezočnik</span>
                            <p>
                                Project Owner
                                <br/> lucija.brezocnik@um.si
                            </p>
                            <a href="https://www.facebook.com/lucija.brezocnik" class="secondary-content">
                                <i class="material-icons red-text text-lighten-2">send</i>
                            </a>
                        </li>
                        <li class="collection-item avatar grey lighten-3">
                            <img src="${pageContext.request.contextPath}/lib/slike/lepotec.jpg" alt="" class="circle">
                            <span class="title">Marko Gluhak</span>
                            <p>
                                Front-End
                                <br/> markogl@comtrade.com
                            </p>
                            <a href="https://github.com/MerceneX" class="secondary-content">
                                <i class="material-icons red-text text-lighten-2">send</i>
                            </a>
                        </li>
                        <li class="collection-item avatar grey lighten-3">
                            <img src="${pageContext.request.contextPath}/lib/slike/ninc.jpg" alt="" class="circle">
                            <span class="title">Nina Kliček</span>
                            <p>
                                Back-End
                                <br/> nina.klicek@student.um.si
                            </p>
                            <a href="https://github.com/KlicekNina" class="secondary-content">
                                <i class="material-icons red-text text-lighten-2">send</i>
                            </a>
                        </li>
                        <li class="collection-item avatar grey lighten-3">
                            <img src="${pageContext.request.contextPath}/lib/slike/dejc.jpg" alt="" class="circle">
                            <span class="title">Dejan Gregorc</span>
                            <p>
                                Back-End
                                <br/> gregorc.dejan@gmail.com
                            </p>
                            <a href="https://github.com/WiiTheThird" class="secondary-content">
                                <i class="material-icons red-text text-lighten-2">send</i>
                            </a>
                        </li>
                        <li class="collection-item avatar grey lighten-3">
                            <img src="${pageContext.request.contextPath}/lib/slike/rusha.jpg" alt="" class="circle">
                            <span class="title">Maruša Konečnik</span>
                            <p>
                                Back-End
                                <br/> marusa.konecnik@student.um.si
                            </p>
                            <a href="https://github.com/marusakonecnik" class="secondary-content">
                                <i class="material-icons red-text text-lighten-2">send</i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col s12 m8">
                <h3 class="center-align">O nas</h3>
                <p class="flow-text left-align">Dobrodošli v našem prvem večjem skupinskem projektu. <br/> Smo mlada ekipa študentov
                    Fakultete za Elektrotehniko, Rečunalništvo in Informatiko in ta spletna stran je narejena kot simulacija praktičnega dela za stranko.
                    Pod mentorstvom Lucije Brezočnik smo prišli na idejo posredne platforme za zbiranje vse mogočih dogodkov, ki smo jih razdelili na smiselne kategorije.
                    <br/>Tehnologije, ki smo se jih poslužili so Spring boot ogrodje in Java programski jezik za strežniško konfiguracijo in Materialize CSS ogrodje
                    za grajenje samega izgleda spletne strani, da je dobila podobo ki jo želimo. Strmeli smo k dinamični rešitvi, ki svojo kompleksno stran skrije na
                    strežniški logiki in preprosto uporabniško izkušnjo, ki jo vodi materialistično oblikovanje.
                </p>
            </div>
        </div>
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