<%-- 
    Document   : info
    Created on : Jul 20, 2017, 12:27:14 PM
    Author     : ku1d33p
--%>

<%@page import="db.doc_working_tab"%>
<%@page import="db.doctor_info"%>
<%@page import="db.dblogin"%>
<%@page import="db.feedback_tab"%>
<%@page import="db.address"%>
<%@page import="db.image"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.blog"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>E-MediHelp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

            <link href="../../resources/css/user/info.css" rel="stylesheet" type="text/css"/>
            <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
            <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
            <script src="../../resources/js/infojs.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div class="booking-container">
            <% doctor_info doc_data = (doctor_info) request.getAttribute("doc_data"); %>
            <% ArrayList add_data = (ArrayList) request.getAttribute("add_data"); %>
            <div class="booking-container-left">
                <div class="booking-profile">
                    <div class="booking-profile-left">
                        <img src="../../resources/images/dumy.jpg" width="150px" height="150px" />
                    </div>
                    <div class="booking-profile-right">
                        <h3><%=request.getAttribute("fullname")%></h3>
                        <strong><%=request.getAttribute("spci_data")%></strong><br />
                        <span>Experience : <%=doc_data.getExperience()%> years</span><br />
                        <span><%= (doc_data.getVerified_guaranteed() == 1) ? "<i class='glyphicon glyphicon-ok'></i> verified" : "<i class='glyphicon glyphicon-remove'></i> Not verified"%></span><br />
                        <p><%=doc_data.getDescription()%></p>
                        Share this profile: <i class="fa fa-facebook" aria-hidden="true"></i>&nbsp &nbsp<i class="fa fa-twitter"></i>
                        <br />
                        <br />
                        <a href="#booking">
                            <button class="booking-block-button" type="button">Book your appointment now!</button>
                        </a>
                        <button id="feedbackbtn" class="booking-block-button">Give Feedback</button>
                    </div>
                </div>

                <div class="booking-profile">
                    <div id="address-block">
                        <ul>
                            <li>
                                <strong><%=request.getAttribute("fullname")%></strong>
                            </li>
                            <li>
                                <address class="booking-profile-address">
                                    <%=request.getAttribute("full_add")%>
                                    <br>
                                        near <%=request.getAttribute("near_add")%>
                                </address>
                            </li>
                            <li>
                                <%
                                    String rat_str = "";
                                    for (int i = 0; i < 5; i++) {
                                        if (i < doc_data.getRatting()) {
                                            rat_str += "<i class='glyphicon glyphicon-star'></i>";
                                        } else {
                                            rat_str += "<i class='glyphicon glyphicon-star-empty'>";
                                        }
                                    }
                                %>
                                <%=doc_data.getRatting()%>
                            </li>
                            <li>
                                <span>show map</span>
                            </li>
                        </ul>
                    </div>
                    <div id="working-days-block">
                        <ul>
                            <% List<doc_working_tab> work_data = (List<doc_working_tab>) request.getAttribute("work_data"); %>
                            <% for (doc_working_tab work_item : work_data) {%>
                            <li>
                                <strong><%=work_item.getDay()%> - </strong>
                                <span> <%=work_item.getTiming()%></span>
                            </li>
                            <% }%>
                        </ul>
                    </div>
                    <div id="price-block">
                        <p>INR <%=doc_data.getBase_fee()%></p>
                        <br />
                        <span>NOTE: Fees is payable at clinic.There are NO charges for booking an appointment.</span>
                    </div>
                </div>

                <div id="booking" class="booking-profile">
                    <div class="timings-container">
                        <center><h3>Booking Timmings</h3></center>
                        <table class="timings-table">
                            <tr>
                                <th>
                                    Days
                                </th>
                                <th>
                                    Morning
                                </th>
                                <th>
                                    Afternoon
                                </th>
                                <th>
                                    Evening
                                </th>
                                <th>
                                    Night
                                </th>
                            </tr>
                            <tr class="timings-table-today">
                                <td>
                                    Today
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1000&doc_id=<%=request.getParameter("doc_id") %>'> 10:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1200&doc_id=<%=request.getParameter("doc_id") %>'> 12:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1600&doc_id=<%=request.getParameter("doc_id") %>'> 04:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=2000&doc_id=<%=request.getParameter("doc_id") %>'> 08:00 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1030&doc_id=<%=request.getParameter("doc_id") %>'> 10:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1230&doc_id=<%=request.getParameter("doc_id") %>'> 12:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1630&doc_id=<%=request.getParameter("doc_id") %>'> 04:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=2030&doc_id=<%=request.getParameter("doc_id") %>'> 08:30 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1100&doc_id=<%=request.getParameter("doc_id") %>'> 11:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1300&doc_id=<%=request.getParameter("doc_id") %>'> 01:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1700&doc_id=<%=request.getParameter("doc_id") %>'> 05:00 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=2100&doc_id=<%=request.getParameter("doc_id") %>'> 09:00 PM </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1130&doc_id=<%=request.getParameter("doc_id") %>'> 11:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1330&doc_id=<%=request.getParameter("doc_id") %>'> 01:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=1730&doc_id=<%=request.getParameter("doc_id") %>'> 05:30 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=today&time=2130&doc_id=<%=request.getParameter("doc_id") %>'> 09:30 PM </a>
                                </td>
                            </tr>
                            <tr class="timings-table-tomorrow">
                                <td>
                                    Tomorrow
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1000&doc_id=<%=request.getParameter("doc_id") %>'> 10:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1200&doc_id=<%=request.getParameter("doc_id") %>'> 12:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1600&doc_id=<%=request.getParameter("doc_id") %>'> 04:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=2000&doc_id=<%=request.getParameter("doc_id") %>'> 08:00 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1030&doc_id=<%=request.getParameter("doc_id") %>'> 10:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1230&doc_id=<%=request.getParameter("doc_id") %>'> 12:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1630&doc_id=<%=request.getParameter("doc_id") %>'> 04:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=2030&doc_id=<%=request.getParameter("doc_id") %>'> 08:30 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1100&doc_id=<%=request.getParameter("doc_id") %>'> 11:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1300&doc_id=<%=request.getParameter("doc_id") %>'> 01:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1700&doc_id=<%=request.getParameter("doc_id") %>'> 05:00 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=2100&doc_id=<%=request.getParameter("doc_id") %>'> 09:00 PM </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1130&doc_id=<%=request.getParameter("doc_id") %>'> 11:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1330&doc_id=<%=request.getParameter("doc_id") %>'> 01:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=1730&doc_id=<%=request.getParameter("doc_id") %>'> 05:30 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=tomorrow&time=2130&doc_id=<%=request.getParameter("doc_id") %>'> 09:30 PM </a>
                                </td>
                            </tr>
                            <tr class="timings-table-day-after-tomorrow">
                                <td>
                                    Day After Tomorrow
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1000&doc_id=<%=request.getParameter("doc_id") %>'> 10:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1200&doc_id=<%=request.getParameter("doc_id") %>'> 12:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1600&doc_id=<%=request.getParameter("doc_id") %>'> 04:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=2000&doc_id=<%=request.getParameter("doc_id") %>'> 08:00 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1030&doc_id=<%=request.getParameter("doc_id") %>'> 10:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1230&doc_id=<%=request.getParameter("doc_id") %>'> 12:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1630&doc_id=<%=request.getParameter("doc_id") %>'> 04:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=2030&doc_id=<%=request.getParameter("doc_id") %>'> 08:30 PM</a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1100&doc_id=<%=request.getParameter("doc_id") %>'> 11:00 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1300&doc_id=<%=request.getParameter("doc_id") %>'> 01:00 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1700&doc_id=<%=request.getParameter("doc_id") %>'> 05:00 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=2100&doc_id=<%=request.getParameter("doc_id") %>'> 09:00 PM </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1130&doc_id=<%=request.getParameter("doc_id") %>'> 11:30 AM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1330&doc_id=<%=request.getParameter("doc_id") %>'> 01:30 PM</a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=1730&doc_id=<%=request.getParameter("doc_id") %>'> 05:30 PM </a>
                                </td>
                                <td>
                                    <a href='/booking?day=aftertomorrow&time=2130&doc_id=<%=request.getParameter("doc_id") %>'> 09:30 PM </a>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="booking-profile">
                    <strong>Feedback</strong>
                    <hr />

                    <% List<feedback_tab> feedback_data = (List<feedback_tab>) request.getAttribute("feedback_data");%>
                    <% List<dblogin> log_data = (List<dblogin>) request.getAttribute("log_data");%>
                    <% for (feedback_tab feed_item : feedback_data) {%>
                    <div id="feedback-div<%=feed_item.getFeed_id()%>" class="feedback-div">
                        <div class="feedback-div-left">
                            <img src="../../resources/images/dumy.jpg" alt="profile-pic" width="70px" />
                            <br />
                            <%  String name="demo name";
                                for (dblogin log_item : log_data) {
                                if (log_item.getLog_id() == feed_item.getLog_id()) {
                                    name=log_item.getFull_name();
                                    break;
                                }
                            }%>
                            <span>by <%=name%></span>
                        </div>
                        <div class="feedback-div-right">
                            <span>visited for <%=feed_item.getProblem()%></span>
                            <br />
                            <p><%=feed_item.getDescription()%></p>
                            <span>

                                <%=feed_item.getRating()%>
                            </span><br />
                            <span class="glyphicon glyphicon-calendar"><%=feed_item.getAdded_on()%></span>
                        </div>
                    </div>
                    <hr />
                    <%}%>
                </div>

            </div>

            <div id="article-container-div">
                <center><strong>Articles</strong></center>
                <br>
                    <% List<blog> blog_data = (List<blog>) request.getAttribute("blog_data"); %>
                    <%int count = 0;
                        for (blog item : blog_data) {
                            if (count < 5) {%>
                    <div class="article-div">
                        <a class="article-link" href="/article#bl-post<%=item.getBl_id()%>"><%=item.getHeading()%></a>
                    </div>
                    <%count++;
                            } else {
                                break;
                            }
                        }%>
            </div>

        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <div class="feedback-form">
                    <div class="feedback-form-head">
                        <h1>
                            Share your experience with us!</h1>
                        <h4>
                            This will just take 2 minutes...</h4>
                        <br />
                        <br />
                    </div>
                    <form method="get" action="/feedback">
                        <div class="feedback-form-content">
                            <input type="hidden" name="doc_id" value='<%=request.getParameter("doc_id")%>' />
                            <span class="feedback-form-question">Q1. Would You like to recommend the doctor? <span class="feedback-form-required">*</span></span><br />
                            <select name="recomend">
                                <option value="Yes">Yes</option>
                                <option value="No">No</option>
                            </select>
                            <br />
                            <span class="feedback-form-question">Q2. For what health problem/treatment did you visit
                                the doctor? <span class="feedback-form-required">*</span></span>
                            <br />
                            <input name="problem" type="text" required />
                            <br />
                            <span class="feedback-form-question">Q3. Tell us about your experience with the doctor?</span>
                            <br />
                            <textarea class="feedback-form-message" name="message"></textarea>
                            <p>
                                <input class="ratting-radio" type="radio" name="ratting" value="1" /> 1 &nbsp;
                                <input class="ratting-radio" type="radio" name="ratting" value="2" /> 2 &nbsp;
                                <input class="ratting-radio" type="radio" name="ratting" value="3" /> 3 &nbsp;
                                <input class="ratting-radio" type="radio" name="ratting" value="4" /> 4 &nbsp;
                                <input class="ratting-radio" type="radio" name="ratting" value="5" /> 5 &nbsp;
                            </p>
                            <hr />
                            <input id="public-visible" type="checkbox" name="visibility" /> Keep this feedback publicly anonymous.<br /><br />
                            <button name="submit" type="submit" id="submit">SUBMIT</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>

        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
