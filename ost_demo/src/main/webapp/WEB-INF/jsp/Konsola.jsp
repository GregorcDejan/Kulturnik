<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
<title>Test</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
private int id;
private String naziv;
private String vir;
private String slikaURL;
private String tip;
private String opis;
private String kraj;
private String naslov;
private String datum;
private int idUporabnika;
private String cena;
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


</body>

</html>