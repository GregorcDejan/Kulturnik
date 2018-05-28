<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Test</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
String ime,String priimek,String geslo, String email, String telefonska,String datum_rojstva
<body>
<h1>Seznam dodanih oseb</h1>
<table border=1>
    <tr><th>ID</th><th>vir</th><th>slika</th></tr>
    <c:forEach  items="${dogodki}" var ="d">
        <tr>
            <td>${d.getNaziv()}</td>
            <td><a href="${d.vir}" />${d.vir}</td>
            <td><img src="${d.slikaURL}" /></td>
        </tr>
    </c:forEach>
</table>

<table border=1>

    <tr><<th>ime</th><th>priimek</th><th>email</th><th>telefonska</th><th>datum rojstva</th><th>geslo</th>/tr>
    <c:forEach  items="${oseba}" var ="d">

    <tr><th>ID</th><th>ime</th><th>priimek</th><th>email</th><th>telefonska</th><th>datum rojstva</th>/tr>
    <c:forEach  items="${osebe}" var ="d">

        <tr>
            <td>${d.ime}</td>
            <td>${d.priimek}</td>
            <td>${d.email}</td>
            <td>${d.telefonska}</td>
            <td>${d.datumRojstva}</td>
            <td>${d.geslo}</td>

        </tr>
    </c:forEach>
</table>


</body>

</html>