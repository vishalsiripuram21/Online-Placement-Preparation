<%-- 
    Document   : home
    Created on : 4 Jun, 2021, 4:41:51 PM
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link rel="stylesheet" href="../CSS/topnav.css">
        <link rel="stylesheet" href="../CSS/signin.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="../../../../dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="signin.css" rel="stylesheet">
        <title>Document</title>
    </head>
    <%
        session.removeAttribute("incorrect");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if (null == session.getAttribute("refreshCount1")) {
            response.setHeader("REFRESH", "0");    // 0 for refresh without delay
            session.setAttribute("refreshCount1", "0");
        }
        if (session.getAttribute("user") == null) {
            session.removeAttribute("refreshCount1");
            response.sendRedirect("index.jsp");
        }

    %>
    <body>
        <%@include file="header.jsp" %>
        <%@include file="menu.jsp" %>

        <main role="main" class="container mt-4">
            <div class="jumbotron">
                <h1>Technical Subjects Placement Paper</h1>
                <p class="lead">Programming questions</p>
                <form action="firstMock.jsp" method="POST">
                    <button class="btn btn-lg btn-primary" type="submit">Click here &raquo;</button>
                </form>
            </div>
        </main>
        <main role="main" class="container mt-4">
            <div class="jumbotron">
                <h1>Quantitative-Aptitude</h1>
                
                <form action="secondMock.jsp" method="POST">
                    <button class="btn btn-lg btn-primary" type="submit">Click here &raquo;</button>
                </form>
            </div>
        </main>
        <main role="main" class="container mt-4">
            <div class="jumbotron">
                <h1>Campus Placement paper</h1>
                <p class="lead">Aug 22nd 2010 at SJB college Of Eng,bangalore</p>
                <form action="thirdMock.jsp" method="POST">
                    <button class="btn btn-lg btn-primary" type="submit">Click here &raquo;</button>
                </form>
            </div>
        </main>
        

    </body>
    <script>

        function myfunct() {
            setInterval(function () {
                var d = new Date();

                document.getElementById('today').innerHTML = d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear() + " " + d.toLocaleTimeString();
            }, 1000);
        }
        myfunct()

    </script>

</html>