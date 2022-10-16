

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ACTUALIZAR UN REGISTRO DE LA TABLA</title>
        <style>
            .fila${param.id} {background-color:orange;}
        </style>
    </head>
    <body>
        <h1>ACTUALIZAR UN REGISTRO DE LA TABLA</h1>
        <p style="color:blue;font-size: 7mm;">
            A continuación se cambia al registro ${param.id} el autor ${param.autor} por este otro: ${param.nautor}</p>
        <c:set var = "libId" value = "${param.id}"/>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libro SET autor=?  WHERE  id=?
            <sql:param value="${param.nautor}"/>
            <sql:param value = "${libId}" />
        </sql:update>

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
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td><c:out value = "${row.editorial}"/></td>
                </tr>
            </c:forEach>
        </table>

        <sql:update dataSource = "${fuenteDatos}" var = "count">
            UPDATE libro SET autor = ?  WHERE  id=?
            <sql:param value = "${param.nautor}" />
            <sql:param value = "${libId}" />
        </sql:update>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
        <br><br><br>
        <p style="color:blue;font-size: 7mm;">
            A continuación al registro ${param.id} se reestable el autor original: ${param.autor} siendo el anterior: ${param.nautor}</p>
        <table border = "1" width = "100%">
            <tr>
                <th>id</th>
                <th>isb</th>
                <th>titulo</th>
                <th>autor</th>
                <th>editorial</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr class="fila${row.id}">
                    <td><c:out value = "${row.id}"/></td>
                    <td><c:out value = "${row.isb}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td><c:out value = "${row.editorial}"/></td>
                </tr>
            </c:forEach>
        </table>    
        <h3 style="background-color:yellow;">***REGRESE A INDEX PARA REALIZAR OTRA OPERACION</h3>
        <a href="index.jsp" style="font-size:1cm;color:blue;">RETORNAR A INDEX</a>
    </body>
</html>
