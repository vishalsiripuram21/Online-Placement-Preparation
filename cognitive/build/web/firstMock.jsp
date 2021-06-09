<%-- 
    Document   : firstMock
    Created on : 5 Jun, 2021, 12:05:57 PM
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="../CSS/signin.css" rel="stylesheet">
        <link href="../CSS/topnav.css" rel="stylesheet">
        <title>Document</title>
        <style>
            .bol{
                font-weight: bold;
            }
            .sco{
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;

            }
        </style>

    </head>
   
    <%
        session.removeAttribute("incorrect");
        response.setHeader("Cache-Control", "no-cache");
        response.setHeader("Cache-Control", "no-store");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
        if(null == session.getAttribute("refreshCount"))
        {
            response.setHeader("REFRESH", "0");    // 0 for refresh without delay
            session.setAttribute("refreshCount", "0");
        }
        if (session.getAttribute("user") == null) {
            session.removeAttribute("refreshCount");
            response.sendRedirect("index.jsp");
        }
        String[] answers = (String[]) session.getAttribute("answers");
        String[] userAnswers = (String[]) session.getAttribute("userAnswers");
        String score = (String) session.getAttribute("score");
        String usermarks = (String) session.getAttribute("usermarks");
    %>
    <body>
        <%!
            public String answer(String value) {
                String ret = value;
                if (ret == null) {
                    ret = "Your Answer : not answered";
                } else {
                    ret = "Your Answer : " + value;
                }
                return ret;
            }
        %>
        <%@include file="/header.jsp" %>
        <%@include file="/menu.jsp" %>
        <form action="firstMock" method="post">

            <div class="container">
                <h3  class="text-success" style="display: flex; justify-content:center"><%
                    if (score != null)
                        out.println(score);
                    %></h3>
                    <h3 style="display: flex;justify-content:center"><% if (usermarks != null)
                        out.println("Your previous Score : " + usermarks); %></h3>

                1. what is an array?
                <br>
                <input type="radio" value="a" name="S11" id="O1-1">
                <label for="O1-1">An array is a series of elements of the same type in contiguous
                    memory
                    locations</label> <br>
                <input type="radio" value="b" name="S11" id="O1-2">
                <label for="O1-2"> An array is a series of element</label><br>
                <input type="radio" value="c" name="S11" id="O1-3">
                <label for="O1-3">. An array is a series of elements of the same type placed in noncontiguous
                    memory locations</label><br>
                <input type="radio" value="d" name="S11" id="O1-4">
                <label for="O1-4">None of the mentioned</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[0]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[0]);
                    %></p>
                <br>
                <br>
                2. What is the output of this program?
                #include < stdio.h> <br>
                using namespace std;<br>
                int main() <br>
                { <br>
                char str[5] = "ABC"; <br>
                cout << str[3]; <br>
                cout << str;<br>
                return 0;<br>
                }<br><br><br>
                <input type="radio" name="S12" id="O2-1" value="a">
                <label for="O2-1">ABC</label><br>
                <input type="radio" name="S12" id="O2-2" value="b">
                <label for="O2-2">ABCD</label><br>
                <input type="radio" name="S12" id="O2-3" value="c">
                <label for="O2-3">AB</label><br>
                <input type="radio" name="S12" id="O2-4" value="d">
                <label for="O2-4">None of the above</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[1]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[1]);
                    %></p>
                <br>
                <br>
                3. How many specifiers are present in access specifiers in class? <br>
                <input type="radio" name="S13" id="O3-1" value="a">
                <label for="O3-1">1</label><br>
                <input type="radio" name="S13" id="O3-2" value="b">
                <label for="O3-2">2</label><br>
                <input type="radio" name="S13" id="O3-3" value="c">
                <label for="O3-3">3</label><br>
                <input type="radio" name="S13" id="O3-4" value="d">
                <label for="O3-4">4</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[2]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[2]);
                    %></p>
                <br><br>
                4. How many kinds of classes are there in c++?
                <br>
                <input type="radio" name="S14" id="O4-1" value="a">
                <label for="O4-1">1</label><br>
                <input type="radio" name="S14" id="O4-2" value="b">
                <label for="O4-2">2</label><br>
                <input type="radio" name="S14" id="O4-3" value="c">
                <label for="O4-3">3</label><br>
                <input type="radio" name="S14" id="O4-4" value="d">
                <label for="O4-4">4</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[3]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[3]);
                    %></p>
                <br><br>
                5. which of the following is used to implement the c++ interfaces? <br>
                <input type="radio" name="S15" id="O5-1" value="a">
                <label for="O5-1">absolute variables</label><br>
                <input type="radio" name="S15" id="O5-2" value="b">
                <label for="O5-2">abstract classes</label><br>
                <input type="radio" name="S15" id="O5-3" value="c">
                <label for="O5-3">constant variables</label><br>
                <input type="radio" name="S15" id="O5-4" value="d">
                <label for="O5-4">none of the mentioned</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[4]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[4]);
                    %></p>
                <br><br>
                6. #include is called <br>
                <input type="radio" name="S16" id="O6-1" value="a">
                <label for="O6-1">Preprocessor directive</label><br>
                <input type="radio" name="S16" id="O6-2" value="b">
                <label for="O6-2">Inclusion directive</label><br>
                <input type="radio" name="S16" id="O6-3" value="c">
                <label for="O6-3">File inclusion directive</label><br>
                <input type="radio" name="S16" id="O6-4" value="d">
                <label for="O6-4">none of the mentioned</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[5]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[5]);
                    %></p>
                <br><br>
                7. If #include is used with file name in angular brackets
                <br>
                <input type="radio" name="S17" id="O7-1" value="a">
                <label for="O7-1">The file is searched for in the standard compiler include paths
                </label><br>
                <input type="radio" name="S17" id="O7-2" value="b">
                <label for="O7-2">The search path is expanded to include the current source directory</label><br>
                <input type="radio" name="S17" id="O7-3" value="c">
                <label for="O7-3">Both a & b</label><br>
                <input type="radio" name="S17" id="O7-4" value="d">
                <label for="O7-4">none of the mentioned</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[6]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[6]);
                    %></p>
                <br><br>
                8. Which of the following is “NOT” a UNIX variant ?
                <br>
                <input type="radio" name="S18" id="O8-1" value="a">
                <label for="O8-1">Solaris</label><br>
                <input type="radio" name="S18" id="O8-2" value="b">
                <label for="O8-2">AIX</label><br>
                <input type="radio" name="S18" id="O8-3" value="c">
                <label for="O8-3">IRIX</label><br>
                <input type="radio" name="S18" id="O8-4" value="d">
                <label for="O8-4">AS400</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[7]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[7]);
                    %></p>
                <br><br>
                9. wtmp and utmp files contain:<br>
                <input type="radio" name="S19" id="O9-1" value="a">
                <label for="O9-1">Temporary system data</label><br>
                <input type="radio" name="S19" id="O9-2" value="b">
                <label for="O9-2">User login-logout log</label><br>
                <input type="radio" name="S19" id="O9-3" value="c">
                <label for="O9-3">The user’s command execution log</label><br>
                <input type="radio" name="S19" id="O9-4" value="d">
                <label for="O9-4">The user’s su and sudo attempts</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[8]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[8]);
                    %></p>
                <br><br>
                10. An expression involving byte, int, and literal numbers is promoted
                to which of these ? <br>
                <input type="radio" name="S1_10" id="O10-1" value="a">
                <label for="O10-1">int</label><br>
                <input type="radio" name="S1_10" id="O10-2" value="b">
                <label for="O10-2">long</label><br>
                <input type="radio" name="S1_10" id="O10-3" value="c">
                <label for="O10-3">byte</label><br>
                <input type="radio" name="S1_10" id="O10-4" value="d">
                <label for="O10-4">float</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[9]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[9]);
                    %></p>
                <br><br>
                11.Who is the father of PHP?
                <br>
                <input type="radio" name="S1_11" id="O11-1" value="a">
                <label for="O11-1">Rasmus Lerdorf</label><br>
                <input type="radio" name="S1_11" id="O11-2" value="b">
                <label for="O11-2">Willam Makepiece</label><br>
                <input type="radio" name="S1_11" id="O11-3" value="c">
                <label for="O11-3">Drek Kolkevi</label><br>
                <input type="radio" name="S1_11" id="O11-4" value="d">
                <label for="O11-4">List Barely</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[10]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[10]);
                    %></p>
                <br><br>
                12. Which one of the following computer network is built on the top of
                another network?
                <br>
                <input type="radio" name="S1_12" id="O12-1" value="a">
                <label for="O12-1">prior network
                </label><br>
                <input type="radio" name="S1_12" id="O12-2" value="b">
                <label for="O12-2">chief network</label><br>
                <input type="radio" name="S1_12" id="O12-3" value="c">
                <label for="O12-3">prime network</label><br>
                <input type="radio" name="S1_12" id="O12-4" value="d">
                <label for="O12-4">overlay network</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[11]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[11]);
                    %></p>
                <br>
                <button class="btn btn-xs btn-danger mt-0 mb-5 <%=session.getAttribute("display")%>" type="submit">submit </button>
            </div>
        </form>
        <%
            session.removeAttribute("display");
            session.removeAttribute("answers");
            session.removeAttribute("score");
            session.removeAttribute("userAnswers");
            session.removeAttribute("usermarks");
        %>
    </body>
    <script>

        function myfunct() {
            setInterval(function () {
                var d = new Date();
                console.log(d.getTime());
                document.getElementById('today').innerHTML = d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear() + " " + d.toLocaleTimeString();

            }, 1000);
        }
        myfunct();

    </script>
</html>