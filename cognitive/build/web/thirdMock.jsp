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
        if (null == session.getAttribute("refreshCount")) {
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
        <form action="thirdMock" method="POST">

            <div class="container">
                <h3  class="text-success" style="display: flex; justify-content:center"><%
                    if (score != null)
                        out.println(score);
                    %></h3>
                <h3 style="display: flex;justify-content:center"><% if (usermarks != null)
                            out.println("Your previous Score : " + usermarks); %></h3>

                1. A number when divided by D leaves a remainder of 8 and when divided by 3D leaves a remainder
                of 21 . What is the remainder left, when twice the number is divided by 3D?
                <br>
                <input type="radio" value="a" name="S31" id="O1-1">
                <label for="O1-1">13</label> <br>
                <input type="radio" value="b" name="S31" id="O1-2">
                <label for="O1-2">cannot be determined</label><br>
                <input type="radio" value="c" name="S31" id="O1-3">
                <label for="O1-3">3</label><br>
                <input type="radio" value="d" name="S31" id="O1-4">
                <label for="O1-4">42</label><br>
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
                2.One day Alice meets pal and byte in fairyland. She knows that pal lies on Mondays, Tuesdays and
                Wednesdays and tells the truth on the other days of the week byte, on the other hand, lies on
                Thursdays, Fridays and Saturdays, but tells the truth on the other days of the week. Now they make the
                following statements to Alice – pal. Yesterday was one of those days when I lie byte. Yesterday was one
                of those days when I lie too. What day is it ?
                <br>
                <input type="radio" name="S32" id="O2-1" value="a">
                <label for="O2-1">Thursday</label><br>
                <input type="radio" name="S32" id="O2-2" value="b">
                <label for="O2-2">Tuesday</label><br>
                <input type="radio" name="S32" id="O2-3" value="c">
                <label for="O2-3">Monday</label><br>
                <input type="radio" name="S32" id="O2-4" value="d">
                <label for="O2-4">Sunday</label><br>
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
                3.  Rearrange the following letters to make a word and choose the category in which it Ms
                'RAPETEKA'<br>
                <input type="radio" name="S33" id="O3-1" value="a">
                <label for="O3-1">bird</label><br>
                <input type="radio" name="S33" id="O3-2" value="b">
                <label for="O3-2">vegetable</label><br>
                <input type="radio" name="S33" id="O3-3" value="c">
                <label for="O3-3">city</label><br>
                <input type="radio" name="S33" id="O3-4" value="d">
                <label for="O3-4">fruit</label><br>
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
                4. On planet korba, a solar blast has melted the ice caps on its equator. 9 years after the ice melts,
                tiny planetoids called echina start growing on the rocks. Echina grows in the form of circle, and the
                relationship between the diameter of this circle and the age of echina is given by the formula
                d = 4*√ (t-9) for t ≥ 9
                where d represents the diameter in mm and t the number of years since the solar blast.
                Jagan recorded the radius of some echina at a particular spot as 7mm. How many years back did the
                solar blast occur?
                <br>
                <input type="radio" name="S34" id="O4-1" value="a">
                <label for="O4-1">17</label><br>
                <input type="radio" name="S34" id="O4-2" value="b">
                <label for="O4-2">21.25</label><br>
                <input type="radio" name="S34" id="O4-3" value="c">
                <label for="O4-3">12.25</label><br>
                <input type="radio" name="S34" id="O4-4" value="d">
                <label for="O4-4">12.06</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[3]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[3]);
                    %></p><br><br>
                5. In the reading room of a library, there are23 reading spots. Each reading spot consists of a round
                table with 9 chairs placed around it. There are some readers such that in each occupied reading spot
                there are different numbers of readers. If in all there are 36 readers, how many reading spots do not
                have even a single reader? <br>
                <input type="radio" name="S35" id="O5-1" value="a">
                <label for="O5-1">8</label><br>
                <input type="radio" name="S35" id="O5-2" value="b">
                <label for="O5-2">16</label><br>
                <input type="radio" name="S35" id="O5-3" value="c">
                <label for="O5-3">none</label><br>
                <input type="radio" name="S35" id="O5-4" value="d">
                <label for="O5-4">15</label><br>
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
                6. Ferrari S.P.A is an Italian sports car manufacturer based in Maranello, Italy. Founded by Enzo
                Ferrari in 1928 as Scuderia Ferrari , the company sponsored drivers and manufactured race cars before
                moving into production of street-legal vehicles in 1947 as Feraari S.P.A. Throughout its history, the
                company has been noted for its continued participation in racing, especially in Formula One where it
                has employed great success .Rohit once bought a Ferrari . It could go 4 times as fast as Mohan's old
                Mercedes. If the speed of Mohan's Mercedes is 46 km/hr and the distance traveled by the Ferrari is
                953 km, find the total time taken for Rohit to drive that distance.
                <br>
                <input type="radio" name="S36" id="O6-1" value="a">
                <label for="O6-1">20.72</label><br>
                <input type="radio" name="S36" id="O6-2" value="b">
                <label for="O6-2">5.18</label><br>
                <input type="radio" name="S36" id="O6-3" value="c">
                <label for="O6-3">29.25</label><br>
                <input type="radio" name="S36" id="O6-4" value="d">
                <label for="O6-4">24.8</label><br>
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
                7. A sheet of paper has statements numbered from 1 to 70. For all values of n from 1 to 70.
                Statement n says ' At least n of the statements on this sheet are false. ' Which statements are true and
                which are false?
                <br>
                <input type="radio" name="S37" id="O7-1" value="a">
                <label for="O7-1">The even numbered statements are true and the odd numbered are false.
                </label><br>
                <input type="radio" name="S37" id="O7-2" value="b">
                <label for="O7-2">The odd numbered statements are true and the even numbered are false</label><br>
                <input type="radio" name="S37" id="O7-3" value="c">
                <label for="O7-3">The first 35 statements are true and the last 35 are false.</label><br>
                <input type="radio" name="S37" id="O7-4" value="d">
                <label for="O7-4">The first 35 statements are false and the last 35 are false</label><br>
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
                8.Middle – earth is a fictional land inhabited by Hobbits, Elves, dwarves and men. The Hobbits
                and the Elves are peaceful creatures who prefer slow, silent lives and appreciate nature and art. The
                dwarves and the men engage in physical games. The game is as follows . A tournol is one where out of
                the two teams that play a match, the one that loses get eliminated. The matches are played in different
                rounds where in every round , half of the teams get eliminated from the tournament. If there are 8
                rounds played in a knock-out tournol how many matches were played?
                <br>
                <input type="radio" name="S38" id="O8-1" value="a">
                <label for="O8-1">257</label><br>
                <input type="radio" name="S38" id="O8-2" value="b">
                <label for="O8-2">255</label><br>
                <input type="radio" name="S38" id="O8-3" value="c">
                <label for="O8-3">72</label><br>
                <input type="radio" name="S38" id="O8-4" value="d">
                <label for="O8-4">256</label><br>
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
                9. A research lab in Chennai requires 100 mice and 75 sterilized cages for a certain set of laboratory
                experiments . To identify the mice, the lab has prepared labels with numbers 1 to 100 , by combining
                tags numbered 0 to 9. The SPCA requires that the tags be made of toxin-free material and that the
                temperature of the cages be maintained at 27 degree Celsius. Also , not more than 2 mice can be caged
                together and each cage must be at least 2 sq.ft in area. The 5 experiments to be conducted by lab are to
                be thoroughly documented and performed only after a round of approval by authorities. The approval
                procedure takes around 48 hours. How many times is the tag numbered '4' used by the lab in numbering
                these mice?<br>
                <input type="radio" name="S39" id="O9-1" value="a">
                <label for="O9-1">8</label><br>
                <input type="radio" name="S39" id="O9-2" value="b">
                <label for="O9-2">19</label><br>
                <input type="radio" name="S39" id="O9-3" value="c">
                <label for="O9-3">9</label><br>
                <input type="radio" name="S39" id="O9-4" value="d">
                <label for="O9-4">20</label><br>
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
                10.There are two water tanks A and B, A is much smaller than B. While water fills at the rate of one
                litre every hour in A, it gets filled up like 10, 20, 40, 80, 160... in tank B.( At the end of first hour, B has
                10 litres , second hour it has 20, and so on). If tank B is 1/32 filled after 21 hours, what is the total
                duration required to fill it completely?<br>
                <input type="radio" name="S3_10" id="O10-1" value="a">
                <label for="O10-1">25hrs</label><br>
                <input type="radio" name="S3_10" id="O10-2" value="b">
                <label for="O10-2">26hrs</label><br>
                <input type="radio" name="S3_10" id="O10-3" value="c">
                <label for="O10-3">27hrs</label><br>
                <input type="radio" name="S3_10" id="O10-4" value="d">
                <label for="O10-4">28hrs</label><br>
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
                11. Francois Pachet , a researcher at Sony Computer Science laboratories is also a jazz musician. He
                decided to build a robot able to improvise like a pro. Named Continuator, the robot can duet with a live
                musician in real- time. It listens to a musical phrase and then computes a complementary phrase with
                the same playing style. If the cost of making the robot is divided between and then computes a
                complementary phrase with the same playing style. If the cost of making the robot is divided between
                materials , labour and overheads in the ratio of 4:6:2.If the materials cost $108. the cost of the robot is
                <br>
                <input type="radio" name="S3_11" id="O11-1" value="a">
                <label for="O11-1">$270</label><br>
                <input type="radio" name="S3_11" id="O11-2" value="b">
                <label for="O11-2">$324</label><br>
                <input type="radio" name="S3_11" id="O11-3" value="c">
                <label for="O11-3">$216</label><br>
                <input type="radio" name="S3_11" id="O11-4" value="d">
                <label for="O11-4">$648</label><br>
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
                12. A man jogs at 6 mph over a certain journey and walks over the same route at 4 mph. What is his
                average speed for the journey?
                <br>
                <input type="radio" name="S3_12" id="O12-1" value="a">
                <label for="O12-1">2.4mph
                </label><br>
                <input type="radio" name="S3_12" id="O12-2" value="b">
                <label for="O12-2">4mph</label><br>
                <input type="radio" name="S3_12" id="O12-3" value="c">
                <label for="O12-3">4.8mph</label><br>
                <input type="radio" name="S3_12" id="O12-4" value="d">
                <label for="O12-4">5mph</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[11]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[11]);
                    %></p>
                <br><br>
                13.Which is the smallest no divides 2880 and gives a perfect square?
                <br>
                <input type="radio" name="S3_13" id="O13-1" value="a">
                <label for="O13-1">1
                </label><br>
                <input type="radio" name="S3_13" id="O13-2" value="b">
                <label for="O13-2">2</label><br>
                <input type="radio" name="S3_13" id="O13-3" value="c">
                <label for="O13-3">5</label><br>
                <input type="radio" name="S3_13" id="O13-4" value="d">
                <label for="O13-4">6</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[12]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[12]);
                    %></p>
                <br><br>
                14.. Form 8 digit numbers from by using 1, 2,3,4,5 with repetition is allowed and
                must be divisible by4?
                <br>
                <input type="radio" name="S3_14" id="O14-1" value="a">
                <label for="O14-1">31250
                </label><br>
                <input type="radio" name="S3_14" id="O14-2" value="b">
                <label for="O14-2">97656</label><br>
                <input type="radio" name="S3_14" id="O14-3" value="c">
                <label for="O14-3">78125</label><br>
                <input type="radio" name="S3_14" id="O14-4" value="d">
                <label for="O14-4">97657</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[13]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[13]);
                    %></p>
                <br><br>
                15.. In school there are some bicycles and 4wheeler wagons.one Tuesday there are
                190 wheels in the campus. How many bicycles are there?
                <br>
                <input type="radio" name="S3_15" id="O15-1" value="a">
                <label for="O15-1">12
                </label><br>
                <input type="radio" name="S3_15" id="O15-2" value="b">
                <label for="O15-2">14</label><br>
                <input type="radio" name="S3_15" id="O15-3" value="c">
                <label for="O15-3">15</label><br>
                <input type="radio" name="S3_15" id="O15-4" value="d">
                <label for="O15-4">18</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[14]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[14]);
                    %></p>
                <br><br>
                16.(1/2) of a number is 3 times more than the (1/6) of the same number?
                <br>
                <input type="radio" name="S3_16" id="O16-1" value="a">
                <label for="O16-1">9
                </label><br>
                <input type="radio" name="S3_16" id="O16-2" value="b">
                <label for="O16-2">8</label><br>
                <input type="radio" name="S3_16" id="O16-3" value="c">
                <label for="O16-3">5</label><br>
                <input type="radio" name="S3_16" id="O16-4" value="d">
                <label for="O16-4">10</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[15]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[15]);
                    %></p>
                <br><br>
                17.There are two pipes A and B. If A filled 10 liters in hour B can fills 20 liters in
                same time. Likewise B can fill 10, 20, 40, 80,160….if B filled in (1/16) th of a tank
                in 3 hours, how much time will it take to fill completely?
                <br>
                <input type="radio" name="S3_17" id="O17-1" value="a">
                <label for="O17-1">6 hours
                </label><br>
                <input type="radio" name="S3_17" id="O17-2" value="b">
                <label for="O17-2">7 hours</label><br>
                <input type="radio" name="S3_17" id="O17-3" value="c">
                <label for="O17-3">9 hours</label><br>
                <input type="radio" name="S3_17" id="O17-4" value="d">
                <label for="O17-4">5 hours</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[16]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[16]);
                    %></p>
                <br><br>
                18.One question has last part like difference between two terms is 9 and product
                of two numbers is 14, what is the squares of sum of numbers?
                <br>
                <input type="radio" name="S3_18" id="O18-1" value="a">
                <label for="O18-1">109
                </label><br>
                <input type="radio" name="S3_18" id="O18-2" value="b">
                <label for="O18-2">108</label><br>
                <input type="radio" name="S3_18" id="O18-3" value="c">
                <label for="O18-3">106</label><br>
                <input type="radio" name="S3_18" id="O18-4" value="d">
                <label for="O18-4">105</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[17]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[17]);
                    %></p>
                <br><br>
                19.One grandfather has three grandchildren, two of their age difference is 3,
                eldest child age is 3 times youngest child’s age and eldest child’s age is two times
                of sum of other two children. What is the age of eldest child?
                <br>
                <input type="radio" name="S3_19" id="O19-1" value="a">
                <label for="O19-1">14
                </label><br>
                <input type="radio" name="S3_19" id="O19-2" value="b">
                <label for="O19-2">16</label><br>
                <input type="radio" name="S3_19" id="O19-3" value="c">
                <label for="O19-3">13</label><br>
                <input type="radio" name="S3_19" id="O19-4" value="d">
                <label for="O19-4">15</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[18]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[18]);
                    %></p>
                <br><br>
                20.In a market 4 man are standing .the average age of the four before 4years is
                45,aftyer some days one man is added and his age is 49.what is the
                average weight of all?
                <br>
                <input type="radio" name="S3_20" id="O20-1" value="a">
                <label for="O20-1">49
                </label><br>
                <input type="radio" name="S3_20" id="O20-2" value="b">
                <label for="O20-2">40</label><br>
                <input type="radio" name="S3_20" id="O20-3" value="c">
                <label for="O20-3">35</label><br>
                <input type="radio" name="S3_20" id="O20-4" value="d">
                <label for="O20-4">45</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[19]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[19]);
                    %></p>
                <br><br>
                21. In a question ,last part has ,the ages of two people has the ratio of 6:6 and by
                adding the numbers we get 44,after how many years the ratio would be 8:7?
                <br>
                <input type="radio" name="S3_21" id="O21-1" value="a">
                <label for="O21-1">7
                </label><br>
                <input type="radio" name="S3_21" id="O21-2" value="b">
                <label for="O21-2">5</label><br>
                <input type="radio" name="S3_21" id="O21-3" value="c">
                <label for="O21-3">6</label><br>
                <input type="radio" name="S3_21" id="O21-4" value="d">
                <label for="O21-4">8</label><br>
                <p class="bol"><%
                    if (userAnswers != null) {
                        String s = answer(userAnswers[20]);
                        out.println(s);
                    }
                    %><br><%
                        if (answers != null)
                            out.println("Correct Answer :" + answers[20]);
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
        myfunct()
    </script>
</html>