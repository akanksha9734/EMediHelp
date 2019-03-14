<%-- 
    Document   : appointments
    Created on : Jul 25, 2017, 8:56:51 AM
    Author     : ku1d33p
--%>

<%@page import="db.dblogin"%>
<%@page import="db.appointment_tab"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div id="booking" style="margin: 20px auto" class="booking-profile">
            <div class="timings-container">
                <center><h3>Booking Timmings</h3></center>
                <table class="timings-table">
                    <tr>
                        <th>
                            Timing
                        </th>
                        <th>
                            Name
                        </th>
                    </tr>
                    <% List<appointment_tab> app_data = (List<appointment_tab>) request.getAttribute("app_data");%>
                    <% List<dblogin> log_data = (List<dblogin>) request.getAttribute("log_data");%>
                    <% for (appointment_tab item : app_data) {%>
                    <tr class="timings-table-today">
                        <td>
                            <span><%=item.getTime()%></span>
                        </td>
                        <td>
                            <%  String name = "demo name";
                                for (dblogin log_item : log_data) {
                                    if (log_item.getLog_id() == item.getLog_id()) {
                                        name = log_item.getFull_name();
                                                break;
                                            }
                                        }%>
                            <span>by <%=name%></span>
                        </td>
                    </tr>
                    <%}
                    %>
                </table>
            </div>
        </div>
        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
