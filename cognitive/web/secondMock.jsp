<%-- 
    Document   : secondMock
    Created on : 7 Jun, 2021, 11:12:05 AM
    Author     : vishal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        if (null == session.getAttribute("refreshCount2")) {
            response.setHeader("REFRESH", "0");    // 0 for refresh without delay
            session.setAttribute("refreshCount2", "0");
        }
        if (session.getAttribute("user") == null) {
            session.removeAttribute("refreshCount2");
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
        <form action="secondMock" method="POST">

            <div class="container">
                <h3  class="text-success" style="display: flex; justify-content:center"><%
                    if (score != null)
                        out.println(score);
                    %></h3>
                    <h3 style="display: flex;justify-content:center"><% if (usermarks != null)
                        out.println("Your previous Score : " + usermarks); %></h3>

                1.There are 150 weights .Some are 1 kg weights and some are 2 kg
                weights. The sum of the weights is 260.What is the number of 1kg weights?
                <br>
                <input type="radio" value="a" name="S21" id="O1-1">
                <label for="O1-1">20</label> <br>
                <input type="radio" value="b" name="S21" id="O1-2">
                <label for="O1-2">40</label><br>
                <input type="radio" value="c" name="S21" id="O1-3">
                <label for="O1-3">38</label><br>
                <input type="radio" value="d" name="S21" id="O1-4">
                <label for="O1-4">35</label><br>
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
                2. A is driving on a highway when the police fines him for overspeeding and exceeding the
                limit by 10 km/hr.At the same time B is fined for overspeeding by twice the amount by which
                A exceeded the limit.If he was driving at 35 km/hr what is the speed limit for the road?<br>
                <input type="radio" name="S22" id="O2-1" value="a">
                <label for="O2-1">15 kmph</label><br>
                <input type="radio" name="S22" id="O2-2" value="b">
                <label for="O2-2">18 kmph</label><br>
                <input type="radio" name="S22" id="O2-3" value="c">
                <label for="O2-3">10 kmph</label><br>
                <input type="radio" name="S22" id="O2-4" value="d">
                <label for="O2-4">20 kmph</label><br>
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
                3. A moves 3 kms east from his starting point . He then travels 5 kms north. From that point
                he moves 8 kms to the east.How far is A from his starting point?<br>
                <input type="radio" name="S23" id="O3-1" value="a">
                <label for="O3-1">11kms</label><br>
                <input type="radio" name="S23" id="O3-2" value="b">
                <label for="O3-2">12kms</label><br>
                <input type="radio" name="S23" id="O3-3" value="c">
                <label for="O3-3">13kms</label><br>
                <input type="radio" name="S23" id="O3-4" value="d">
                <label for="O3-4">15kms</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[2]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[2]);
                    %></p><br>
                4. A car travels 12 kms with a 4/5th filled tank.How far will the car travel with 1/3 filled tank?
                <br>
                <input type="radio" name="S24" id="O4-1" value="a">
                <label for="O4-1">1</label><br>
                <input type="radio" name="S24" id="O4-2" value="b">
                <label for="O4-2">2</label><br>
                <input type="radio" name="S24" id="O4-3" value="c">
                <label for="O4-3">3</label><br>
                <input type="radio" name="S24" id="O4-4" value="d">
                <label for="O4-4">5</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[3]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[3]);
                    %></p><br>
                5. The sum of the digits of a two digit number is 8. When 18 is added to the number, the
                digits are reversed. Find the number? <br>
                <input type="radio" name="S25" id="O5-1" value="a">
                <label for="O5-1">25</label><br>
                <input type="radio" name="S25" id="O5-2" value="b">
                <label for="O5-2">35</label><br>
                <input type="radio" name="S25" id="O5-3" value="c">
                <label for="O5-3">33</label><br>
                <input type="radio" name="S25" id="O5-4" value="d">
                <label for="O5-4">30</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[4]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[4]);
                    %></p><br>
                6. The cost of one pencil, two pens and four erasers is Rs.22 while the cost of five pencils,
                four pens and two erasers is Rs.32.How much will three pencils, three pens and three
                erasers cost?<br>
                <input type="radio" name="S26" id="O6-1" value="a">
                <label for="O6-1">28</label><br>
                <input type="radio" name="S26" id="O6-2" value="b">
                <label for="O6-2">27</label><br>
                <input type="radio" name="S26" id="O6-3" value="c">
                <label for="O6-3">29</label><br>
                <input type="radio" name="S26" id="O6-4" value="d">
                <label for="O6-4">24</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[5]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[5]);
                    %></p><br>
                7. Fathers age is 5 times his son’s age. 4 years back the father was 9 times older than
                son.Find the fathers’ present age.
                <br>
                <input type="radio" name="S27" id="O7-1" value="a">
                <label for="O7-1">38
                </label><br>
                <input type="radio" name="S27" id="O7-2" value="b">
                <label for="O7-2">41</label><br>
                <input type="radio" name="S27" id="O7-3" value="c">
                <label for="O7-3">40</label><br>
                <input type="radio" name="S27" id="O7-4" value="d">
                <label for="O7-4">none of the mentioned</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[6]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[6]);
                    %></p><br>
                8. What number should be added to or subtracted from each term of the ratio 17 : 24 so that
                it becomes equal to 1 : 2.
                <br>
                <input type="radio" name="S28" id="O8-1" value="a">
                <label for="O8-1">10 should be subtracted</label><br>
                <input type="radio" name="S28" id="O8-2" value="b">
                <label for="O8-2">10 should be added</label><br>
                <input type="radio" name="S28" id="O8-3" value="c">
                <label for="O8-3">9 should be added</label><br>
                <input type="radio" name="S28" id="O8-4" value="d">
                <label for="O8-4">9 should be subtracted</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[7]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[7]);
                    %></p><br>
                9. What is the 12th term of the series 2, 5, 8, ....<br>
                <input type="radio" name="S29" id="O9-1" value="a">
                <label for="O9-1">38</label><br>
                <input type="radio" name="S29" id="O9-2" value="b">
                <label for="O9-2">39</label><br>
                <input type="radio" name="S29" id="O9-3" value="c">
                <label for="O9-3">35</label><br>
                <input type="radio" name="S29" id="O9-4" value="d">
                <label for="O9-4">36</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[8]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[8]);
                    %></p><br>
                10. If 20 men take 15 days to to complete a job, in how many days can 25 men finish that
                work?<br>
                <input type="radio" name="S2_10" id="O10-1" value="a">
                <label for="O10-1">12</label><br>
                <input type="radio" name="S2_10" id="O10-2" value="b">
                <label for="O10-2">10</label><br>
                <input type="radio" name="S2_10" id="O10-3" value="c">
                <label for="O10-3">11</label><br>
                <input type="radio" name="S2_10" id="O10-4" value="d">
                <label for="O10-4">4</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[9]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[9]);
                    %></p><br>
                11. In a fraction, if 1 is added to both the numerator at the denominator,
                the fraction becomes 1/2. If numerator is subtracted from the denominator,
                the fraction becomes 3/4. Find the fraction.
                <br>
                <input type="radio" name="S2_11" id="O11-1" value="a">
                <label for="O11-1">2/7</label><br>
                <input type="radio" name="S2_11" id="O11-2" value="b">
                <label for="O11-2">3/6</label><br>
                <input type="radio" name="S2_11" id="O11-3" value="c">
                <label for="O11-3">2/8</label><br>
                <input type="radio" name="S2_11" id="O11-4" value="d">
                <label for="O11-4">3/7</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[10]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[10]);
                    %></p><br>
                12. If Rs.1260 is divided between between A, B and C in the ratio 2:3:4, what is C’s share?
                <br>
                <input type="radio" name="S2_12" id="O12-1" value="a">
                <label for="O12-1">560
                </label><br>
                <input type="radio" name="S2_12" id="O12-2" value="b">
                <label for="O12-2">540</label><br>
                <input type="radio" name="S2_12" id="O12-3" value="c">
                <label for="O12-3">525</label><br>
                <input type="radio" name="S2_12" id="O12-4" value="d">
                <label for="O12-4">530</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[11]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[11]);
                    %></p><br>
                13. A shopkeeper bought a watch for Rs.400 and sold it for Rs.500.What is
                his profit percentage?
                <br>
                <input type="radio" name="S2_13" id="O13-1" value="a">
                <label for="O13-1">30%
                </label><br>
                <input type="radio" name="S2_13" id="O13-2" value="b">
                <label for="O13-2">25%</label><br>
                <input type="radio" name="S2_13" id="O13-3" value="c">
                <label for="O13-3">20%</label><br>
                <input type="radio" name="S2_13" id="O13-4" value="d">
                <label for="O13-4">28%</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[12]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[12]);
                    %></p><br>
                14. What percent of 60 is 12?
                <br>
                <input type="radio" name="S2_14" id="O14-1" value="a">
                <label for="O14-1">22%
                </label><br>
                <input type="radio" name="S2_14" id="O14-2" value="b">
                <label for="O14-2">23%</label><br>
                <input type="radio" name="S2_14" id="O14-3" value="c">
                <label for="O14-3">20%</label><br>
                <input type="radio" name="S2_14" id="O14-4" value="d">
                <label for="O14-4">19%</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[13]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[13]);
                    %></p><br>
                15. Hansie made the following amounts in seven games of cricket in India : Rs.10, Rs.15,
                Rs.21, Rs.12, Rs.18, Rs.19 and Rs.17(all figures in crores of course).Find his average
                earnings.
                <br>
                <input type="radio" name="S2_15" id="O15-1" value="a">
                <label for="O15-1">12 crore
                </label><br>
                <input type="radio" name="S2_15" id="O15-2" value="b">
                <label for="O15-2">14 crore</label><br>
                <input type="radio" name="S2_15" id="O15-3" value="c">
                <label for="O15-3">16 crore</label><br>
                <input type="radio" name="S2_15" id="O15-4" value="d">
                <label for="O15-4">18 crore</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[14]);
                        out.println(s);
                    }
                    %><br><%
                    if (answers != null)
                        out.println("Correct Answer :" + answers[14]);
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

                document.getElementById('today').innerHTML = d.getDate() + "-" + (d.getMonth() + 1) + "-" + d.getFullYear() + " " + d.toLocaleTimeString();
            }, 1000);
        }
        myfunct();
    </script>
</html>