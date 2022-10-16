<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo 01. BlackMore Dev's</title>
        <script>
            function insertar() {
                alert("A continuación debe ingresar los datos del libro.");
                var isb = prompt("Ingrese el isbn ");
                var titu = prompt("Ingrese el titulo");
                var aut = prompt("Ingrese el autor ");
                var edito = prompt("Ingrese la editorial ");
                location.href = "insertar.jsp?isb=" + isb + "&titulo=" + titu + "&autor=" + aut + "&editorial=" + edito;
            }

        </script>
<h1>Guia 55ab</h1>
<h2>TPI-115, GRUPO 01</h2>
<ul>
    <li><a href="consultar.jsp">Actualizar - Borrar Libros</a></li>
    <li><a href="javascript:insertar();">Agregar y mostrar Listado Actualizado</a></li>
</ul>

</body>
</html>
