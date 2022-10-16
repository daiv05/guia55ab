
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>REALIZAR UNA CONSULTA EN LA TABLA.</title>
        <script>
            function actualizar(id, autor)
            {
                var nautor = prompt("Ingrese el autor que reemplaza el actual (" + autor + ")");
                location.href = "actualizar.jsp?id=" + id + "&autor=" + autor + "&nautor=" + nautor;
            }
            function eliminar(id)
            {
                alert("A continuación se eliminará el registro #"+id);
                location.href = "eliminar.jsp?id=" + id;
            }
        </script>
        <style type="text/css">
              
        </style>
            
    </head>
    <body>
        <h1>REALIZAR UNA CONSULTA EN LA TABLA , ACTUALIZAR O ELIMINAR UN REGISTRO (id).</h1>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>

        <table border = "1" width = "100%">
            <tr>
                <th>id</th>
                <th>isb</th>
                <th>titulo</th>
                <th>autor</th>
                <th>editorial</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td onclick="eliminar('${row.id}');" 
                        onmouseover="this.style.backgroundColor='pink';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.id}"/>
                    </td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td><c:out value = "${row.editorial}"/></td>
                    <td onclick="actualizar('${row.id}', '${row.autor}');"  
                        onmouseover="this.style.backgroundColor='green';"
                        onmouseout="this.style.backgroundColor='white';">
                        <c:out value = "${row.autor}"/>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
