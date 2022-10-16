
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
        <title>INSERTAR UN REGISTRO EN LA TABLA</title>
    </head>
    <body>
        <h1>INSERTAR UN REGISTRO EN LA TABLA</h1>
        <p style="color:green;font-weight: 1200">*observe que en la tabla el registr agregado se marca con fondo verde</p>

        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro (isb, titulo, autor, editorial)  VALUES (?, 'Anonimo', 'Ali', 'AA');
            <sql:param value="${param.isb}"/>
        </sql:update>

        ++${result}++
        <sql:update dataSource = "${fuenteDatos}" var = "result">
            INSERT INTO libro (isb, titulo, autor, editorial) VALUES (?,?,?,?);
            <sql:param value="${param.isb}"/>
            <sql:param value="${param.titulo}"/>
            <sql:param value="${param.autor}"/>     
            <sql:param value="${param.editorial}"/>    
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
                <tr>
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
        <script>
           var nuevo=document.getElementsByTagName("table")[0].lastElementChild.lastElementChild;
           nuevo.style.backgroundColor="lightgreen";            
        </script>
    </body>
</html>
