<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="com.emergentes.modelo.Posts"%>
<%
    List<Posts> Posts= (List<Posts>) request.getAttribute("Posts");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        @import 
        url('https://fonts.googleapis.com/css2?family=Acme&family=Courier+Prime&family=Lobster&family=Purple+Purse&display=swap');
        
        .header {
            text-align: center;
            margin-bottom: 40px;
        }
        .header h1 {
            color: indigo;
            margin: 0;
            font-family: 'Acme', sans-serif;
            font-size: 48px;
        }
        
        .header p {
            color: dimgray;
            font-family: 'Lobster', sans-serif;
            font-size: 20px;
        }
        
        .new-entry {
            display: block;
            text-align: right;
            margin-bottom: 20px;
        }
        
        .new-entry a {
            background-color: moccasin;
            text-decoration: none;
            color: black;
            border: 1px solid chocolate;
            padding: 5px;
            margin-bottom: 20px;
        }
        
        .new-entry a:hover {
            text-decoration: underline;
            background-color: khaki;
        }
        
        .entry {
            border-bottom: 1px solid #000;
            margin-bottom: 20px;
            padding-bottom: 20px;
        }
        
        .entry h2 {
            margin: 0;
            color: indigo;
            font-family: 'Purple Purse', serif;
        }
        
        .entry .date {
            color: gray;
        }
        
        .entry .content {
            margin-top: 10px;
            font-family: 'Courier Prime', monospace;
        }
        
        .entre .date,
        .entry .content {
            font-style: italic;
        }
        
        .buttons {
            margin-top: 10px;
        }
        
        .buttons a {
            background-color: khaki;
            color: black;
            margin-right: 10px;
            text-decoration: none;
            color: cadetblue;
            border: 1px solid cadetblue;
            padding: 5px;
        }
        
        .buttons a:hover {
            text-decoration: underline;
            color: lightskyblue;
        }
    </style>
    <body>
        <div class="header">
            <h1>BLOG DE TECNOLOGÍA</h1>
            <p>Autor: Silvana Callejas Meneses</p>
        </div>
        
        <div class="new-entry">
            <a href="PostsController?action=add">NUEVA ENTRADA</a>
        </div>
        
        <div>
            <c:forEach var="Posts" items="${Posts}">
                <div class="entry">
                    <h2>${Posts.titulo}</h2>
                    <p class="date"><strong>Fecha: </strong>${Posts.fecha}</p>
                    <p class="content">${Posts.contenido}</p>
                    <div class="buttons">
                        <a href="PostsController?action=edit&id=${Posts.id}">EDITAR</a>
                        <a href="PostsController?action=delete&id=${Posts.id}">ELIMINAR</a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </body>
</html>
