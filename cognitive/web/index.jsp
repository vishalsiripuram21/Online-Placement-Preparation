<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    <link href="CSS/signin.css" rel="stylesheet">
    <link href="CSS/topnav.css">
    <title>Document</title>
  
</head>
<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <div class="column  justify-content-center">

            <body class="text-center">
                <form class="form-signin" action="" method="POST">
                    <p class="text-danger"> <%
                        String mes = (String)session.getAttribute("incorrect");
                        if(mes!=null)
                        {
                            %><%= mes %> <%
                                session.removeAttribute("incorrect");
                        }
                        %> </p>
                    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email"
                        required autofocus>
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password"
                        name="password" required>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                </form>
                <form class="form-signin" action="signup.jsp">
                    <button class="btn btn-lg btn-primary btn-block" href="signup.jsp" type="submit">Sign Up</button>
                </form>
                <%
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    Connection con =ConnectionProvider.getConnection();
                    String query = "select * from user where email=? and password=?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setString(1, email);
                    pstmt.setString(2, password);
                    ResultSet rs = pstmt.executeQuery();
                    if(rs.next())
                    {
                        session.setAttribute("user", email);
                        response.sendRedirect("home.jsp");
                        }
                    else
                    {
                        session.setAttribute("incorrect", "enter details correctly!!");
                    }
                %>
            </body>
        </div>
    </div>
</body>
<script>

    function myfunct() {
        setInterval(function () {
            var d = new Date();

            document.getElementById('today').innerHTML = d.getDate() + "-" + (d.getMonth()+1) + "-" + d.getFullYear() + " " + d.toLocaleTimeString();
        }, 1000);
    }
    myfunct();
</script>

</html>