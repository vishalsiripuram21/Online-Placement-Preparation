<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.protocol.Resultset"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionProvider"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/topnav.css">
    <link rel="stylesheet" href="/css/signin.css">
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

<body>
    <%@include file="header.jsp" %>
    <div class="container">
        <div class="column  justify-content-center">

            <body class="text-center">
                <form class="form-signin" action="" method="post">
                    <p>
                        <%
                        String  s = (String)session.getAttribute("mes");
                        if(s!=null)
                        {
                            %>
                            <%= s %>
                            <%
                                session.removeAttribute("mes");
                        }
                        %></p>
                    <h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>
                    <label for="inputName" class="sr-only">Name</label>
                    <input type="text" id="inputName" class="form-control" placeholder="Enter name" name="name" required
                        autofocus>
                    <label for="inputPhone" class="sr-only">Name</label>
                    <input type="phone" id="inputPhone" class="form-control" placeholder="Enter phone number" name="phone" required
                        autofocus>
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" name="email"
                      autocomplete="off"  required autofocus>
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder=" enter password"
                        name="password" autocomplete="new-password" required>

                    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
                </form>
                <form>
                <%
                        String message = "";
                       String name = request.getParameter("name");
                       String phone = request.getParameter("phone");
                       String email = request.getParameter("email");
                       String password = request.getParameter("password");
                       Connection con = ConnectionProvider.getConnection();
                       if(name!=null && phone!=null && email!=null && password!=null)
                       {
                           String query ="select email from user where email='"+email+"'";
                           PreparedStatement stmt = con.prepareStatement(query);
                           ResultSet rs = stmt.executeQuery();
                           if(rs.next())
                           {
                              response.sendRedirect("validation");
                           }
                           else
                           {
                               String query1 = "insert into user(userName,email,phone,password) values(?,?,?,?)";
                               String query2 = "insert into marks(email) values(?)";
                               PreparedStatement pstmt1 = con.prepareStatement(query1);
                               PreparedStatement pstmt2 = con.prepareStatement(query2);
                               pstmt1.setString(1, name);
                               pstmt1.setString(2, email);
                               pstmt1.setString(3, phone);
                               pstmt1.setString(4, password);
                              int i = pstmt1.executeUpdate();
                               pstmt2.setString(1, email);
                              int j =  pstmt2.executeUpdate();
                              if(i>=1 && j>=1)
                                  con.close();
                               response.sendRedirect("index.jsp");
                           }
                        }
                       
                 %>
                 </form>
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
    myfunct()
</script>
</html>