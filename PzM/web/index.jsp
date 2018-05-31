<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OSMA NALOGA</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        table#t01 {
            width: 100%;
            background-color: #f1f1c1;
        }
    </style>
</head>
<body>

<div class="header">
    <h2 >Opravila</h2>
    <input type="text" id="vnos" placeholder="Vpiši opravilo...">
    <input type="button" onclick="dodajNovoOpravilo()" value="Dodaj novo opravilo">
    <input type="button" onclick="izbrisiOpravilo()" value="Opravilo urejeno">
</div>
<br />
<div>
    <table id="tabela" border="1">

    </table>
</div>



<script type="text/javascript">








    function dodajNovoOpravilo()
    {
        var tabelca = document.getElementById('tabela');
        var check = document.createElement('input');
        check.value="da";
        var row = tabelca.insertRow(0);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);

        check.type='checkbox';
        cell1.appendChild(check);
        cell2.innerHTML = document.getElementById('tabela').rows.length;
        cell3.innerHTML = document.getElementById("vnos").value;

    }

    function izbrisiOpravilo()
    {


        var tabelca=document.getElementById("tabela");

        for ( var i = 0; i < tabelca.rows.length; i++)
        {

            var check=document.getElementById('tabela').rows[i].cells[0].childNodes[0];


            document.getElementById("test").innerHTML=check;
            if(check.checked)
            {

                document.getElementById("tabela").deleteRow(i);
                i--;
            }

        }

    }





</script>

</body>
</html>