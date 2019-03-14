<%-- 
    Document   : doctors
    Created on : Jul 20, 2017, 11:08:03 AM
    Author     : ku1d33p
--%>

<%@page import="db.blog"%>
<%@page import="db.image"%>
<%@page import="db.address"%>
<%@page import="db.dblogin"%>
<%@page import="java.util.List"%>
<%@page import="db.doctor_info"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>E-MediHelp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

            <link href="../../resources/css/user/doctors.css" rel="stylesheet" type="text/css"/>
            <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
            <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div class="doctor-container">
            <div class="doctor-left-container">
                <div class="doctor-filter-div">
                    <h3>Filter by:</h3>
                    <input type="checkbox" name="available" />Available Today<br />
                    <input type="checkbox" name="online" />Online Booking<br />
                    <input type="checkbox" name="male" />Male Doctors<br />
                    <input type="checkbox" name="female" />Female Doctors<br />
                </div>
                <div class="doctor-filter-div">
                    <h3>Consultation fee:</h3>
                    <input type="checkbox" name="Free" />Free<br />
                    <input type="checkbox" name="1-200" />1-200<br />
                    <input type="checkbox" name="201-500" />201-500<br />
                    <input type="checkbox" name="501+" />501+<br />
                </div>
            </div>
            <div class="doctor-middle-container">

                <% List<doctor_info> doc_data = (List<doctor_info>) request.getAttribute("doc_data"); %>
                <% List<dblogin> log_data = (List<dblogin>) request.getAttribute("log_data"); %>
                <% List<address> add_data = (List<address>) request.getAttribute("add_data"); %>
                <% List<image> img_data = (List<image>) request.getAttribute("img_data"); %>
                <% for (doctor_info item : doc_data) {%>
                <div class="doctor-card-div" id="appointments-block-1">
                    <div class="doctor-card-img">
                        <img src="../../resources/images/dumy.jpg" width="100px" height="100px" />
                    </div>
                    <div class="doctor-card-name">
                        <a href="/doctor/info?doc_id=<%=item.getDoc_id()%>">
                            <% for (dblogin log_item : log_data) {
                                    if (log_item.getLog_id() == item.getLog_id()) {%>
                            <h3>
                                <%=log_item.getFull_name().toUpperCase()%>
                            </h3>
                            <%break;
                                    }
                                }%>
                        </a>
                        <h4>Details:</h4>
                        <ul class="facilities-group">
                            <li class="facilities-group-list-item"><i class="glyphicon glyphicon-user"></i>&nbsp <%=(item.getGender() == 1 ? "Male" : "Female")%></li>
                            <li class="facilities-group-list-item"><i class="glyphicon glyphicon-hand-right"></i>&nbsp <%=item.getExperience()%> years</li>
                            <li class="facilities-group-list-item">
                                <%
                                    String rat_str = "";
                                    for (int i = 0; i < 5; i++) {
                                        if (i < item.getRatting()) {
                                            rat_str += "<i class='glyphicon glyphicon-star'></i>";
                                        } else {
                                            rat_str += "<i class='glyphicon glyphicon-star-empty'>";
                                        }
                                    }
                                %>
                                <%=item.getRatting()%>
                            </li>
                        </ul>
                    </div>
                    <div class="doctor-card-details">
                        <ul class="appointment-block-details-list">
                            <li class="appointment-block-details-list-item"><i class="glyphicon glyphicon-map-marker"></i>&nbsp  
                                <% for (address add_item : add_data) {
                                        if (add_item.getLog_id() == item.getLog_id()) {%>
                                <span>
                                    <%=add_item.getStreet_no() + ", " + add_item.getCity() + ", " + add_item.getState() + ", " + add_item.getCountry() + " " + add_item.getPincode()%>
                                </span>
                                <%break;
                                        }
                                    }%>
                            </li>
                            <li class="appointment-block-details-list-item"><i class="glyphicon glyphicon-usd"></i>&nbsp Consulation Fee: <%=item.getBase_fee()%></li>
                        </ul>
                        <a href="/doctor/info?doc_id=<%=item.getDoc_id()%>#booking"><input class="appointments-block-button " type="button" name="submit" value="Book an appointment" /></a>
                    </div>
                </div>
                <%}%>
            </div>
            <div id="article-container-div">
                <strong>Articles</strong>
                <br><br>
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

                        <%@include file="../shared/footer.jsp" %>
                        </body>
                        </html>
