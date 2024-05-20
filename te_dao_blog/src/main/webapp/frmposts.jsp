<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.emergentes.modelo.Posts"%>
<%
    Posts pst = (Posts) request.getAttribute("posts");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <style>
        @import 
        url('https://fonts.googleapis.com/css2?family=Overpass+Mono&family=Roboto+Serif:ital,opsz,wght@0,8..144,100..900;1,8..144,100..900&family=Young+Serif&display=swap');
        
        .form-container {
            max-width: 1000px;
            margin: auto;
        }
        
        .form-container h1 {
            text-align: center;
            color: indianred;
            font-family: 'Young Serif', serif;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: darkblue;
            font-family: 'Roboto Serif', serif;
        }
        
        .form-group input[type="text"], 
        .form-group textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            font-family: 'Overpass Mono', monospace;
        }
        
        .form-group input[type="date"] {
            padding: 8px;
        }
        
        .form-group input[type="submit"] {
            background-color: khaki;
            color: black;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            display: block;
            margin: auto;
        }
        
        .form-group input[type="submit"]:hover {
            background-color: moccasin;
            color: black;
        }
    </style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="form-container">
            <h1>
                <c:if test="${posts.id == 0}">NUEVA ENTRADA</c:if>
                <c:if test="${posts.id != 0}">EDITAR</c:if>
                
                NUEVA ENTRADA
            </h1>
            <form action="PostsController" method="post">
                <input type="hidden" name="id" value="${posts.id}">
                <div class="form-group">
                    <label for="fecha">FECHA: </strong</label>
                    <input type="date" id="fecha" name="fecha" value="${posts.fecha}" required/>
                </div>
                
                <div class="form-group">
                    <label for="titulo">TITULO: </label>
                    <input type="text" id="titulo" value="${posts.titulo}" name="titulo" required/>
                </div>
                
                <div class="form-group">
                    <label for="contenido">CONTENIDO: </label>
                    <textarea id="contenido" name="contenido" rows="15" required>${posts.contenido}</textarea>
                </div>
                
                <div class="form-group">
                    <input type="submit" value="ENVIAR"/>
                </div>
            </form>
        </div>
        <!--
        <h1>NUEVA ENTRADA</h1>
        
        <form action="PostsController" method="post">
        <input type="hidden" name="id" value="<%= pst != null ? pst.getId() : "" %>">
        <table>
            <tr>
                <td>FECHA: </td>
                <td><input type="date" name="fecha" value="<%= pst != null ? pst.getFecha(): "" %>"/></td>
            </tr>
            <tr>
                <td>TITULO: </td>
                <td><input type="text" name="titulo" value="<%= pst != null ? pst.getTitulo() : "" %>"/></td>
            </tr>
            <tr>
                <td>CONTENIDO: </td>
                <td><textarea name="contenido" rows="5" cols="10"><%= pst != null ? pst.getContenido() : "" %></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" value="ENVIAR"/></td>
            </tr>
        </table>
    </form>-->
    </body>
</html>
