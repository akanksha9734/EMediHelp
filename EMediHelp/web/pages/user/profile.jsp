<%-- 
    Document   : profile
    Created on : Jul 21, 2017, 12:04:30 PM
    Author     : ku1d33p
--%>

<%@page import="java.util.*"%>
<%@page import="db.appointment_tab"%>
<%@page import="db.address"%>
<%@page import="db.dblogin"%>
<%@page import="db.doctor_info"%>
<%@page import="db.feedback_tab"%>
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

        <link href="../../resources/css/user/profile.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
        <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
        <script src="../../resources/js/profilejs.js" type="text/javascript"></script>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div class="profile-container">
            <div id="profile-container-left">
                <ul>
                    <li>
                        <a id="profile" href="#">
                            Profile
                        </a>
                    </li>
                    <% if (ssa.getAttribute("page_acc_lvl") != null && Integer.parseInt(ssa.getAttribute("page_acc_lvl").toString()) != 2) {%>
                    <li>
                        <a id="appointment" href="#">
                            Appointments
                        </a>
                    </li>
                    <!--                    <li>
                                            <a id="prescription" href="#">
                                                My Prescription
                                            </a>
                                        </li>-->
                    <li>
                        <a id="feedback" href="#">
                            My Feedback
                        </a>
                    </li>
                    <%}%>
                    <li>
                        <a id="changepass" href="#">
                            Change Password
                        </a>
                    </li>
                </ul>
            </div>
            <% List<doctor_info> doc_data = (List<doctor_info>) request.getAttribute("doc_data"); %>
            <% List<dblogin> log_data = (List<dblogin>) request.getAttribute("log_data");%>
            <% HttpSession ssp = request.getSession(); %>
            <% dblogin user = null;
                for (dblogin item : log_data) {
                    if (item.getLog_id() == Integer.parseInt(ssp.getAttribute("sessionId").toString())) {
                        user = item;
                    }
                }
            %>
            <div id="profile-container-right">
                <div id="profile-container-profile-div">
                    <strong>General Details</strong>
                    <hr>
                    <form action="/profile" method="post">
                        <table id="profile-tab">
                            <tr>
                                <td>Fullname</td>
                                <td>:</td>
                                <td><input type="text" name="fullname" class="text-box" value='<%=ssp.getAttribute("user_name")%>' required/></td>
                            </tr>
                            <tr>
                                <td>Email</td>
                                <td>:</td>
                                <td><input type="text" name="email" class="text-box" value='<%=user.getEmail()%>' readonly="true" /></td>
                            </tr>
                            <tr>
                                <td>Date Of Birth</td>
                                <td>:</td>
                                <td><input type="text" name="dob" class="text-box" value='<%=user.getDob()%>' required/></td>
                            </tr>
                            <tr>
                                <td>Phone No</td>
                                <td>:</td>
                                <td><input type="text" name="phone" pattern="[1-9]{1}[0-9]{9}" class="text-box" value='<%=user.getPhone_no()%>' required /></td>
                            </tr>  
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="submit" name="profile-submit" text="Save" class="btn btn-default" /></td>
                            </tr>                      
                        </table>
                    </form>
                    <br>
                    <%if (ssa.getAttribute("page_acc_lvl") != null && Integer.parseInt(ssa.getAttribute("page_acc_lvl").toString()) == 2) {%>
                    <% address addr_data = (address) request.getAttribute("addr_data");%>
                    <% doctor_info doctor_data = (doctor_info) request.getAttribute("doctor_data");%>
                    <strong>Doctor</strong>
                    <hr>
                    <form action="/contactus" method="post">
                        <table id="add-tab">
                            <tr>
                                <td>discription</td>
                                <td>:</td>
                                <td><textarea name="doc_disc" class="form-control" rows="10" required ><%=doctor_data.getDescription()%></textarea></td>
                            </tr>
                            <tr>
                                <td>fee</td>
                                <td>:</td>
                                <td><input type="number" name="fee" class="text-box" value="<%=doctor_data.getBase_fee()%>" required/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="hidden" name="docid" value="<%=doctor_data.getDoc_id()%>" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="submit" class="btn btn-default" /></td>
                            </tr>
                        </table>
                    </form>
                    <br>
                    <strong>Address</strong>
                    <hr>
                    <form action="/aboutus" method="post">
                        <table id="add-tab">
                            <tr>
                                <td>Street no</td>
                                <td>:</td>
                                <td><input type="text" name="street" value="<%=addr_data.getStreet_no()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td>Landmark</td>
                                <td>:</td>
                                <td><input type="text" name="landmark" value="<%=addr_data.getLandmark()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>:</td>
                                <td><input type="text" name="city" value="<%=addr_data.getCity()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>:</td>
                                <td><input type="text" name="state" value="<%=addr_data.getState()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td>Pincode</td>
                                <td>:</td>
                                <td><input type="text" name="pin" value="<%=addr_data.getPincode()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td>country</td>
                                <td>:</td>
                                <td><input type="text" name="country" value="<%=addr_data.getCountry()%>" class="text-box" required/></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="hidden" name="add_id" value="<%=addr_data.getAdd_id()%>" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="submit" name="add-submit" text="Save" class="btn btn-default" /></td>
                            </tr>
                        </table>
                    </form>
                    <%}%>
                </div>

                <div id="profile-container-appointment-div">
                    <center><strong>Appointments</strong></center>
                        <% List<appointment_tab> app_data = (List<appointment_tab>) request.getAttribute("app_data"); %>
                        <% List<address> add_data = (List<address>) request.getAttribute("add_data"); %>
                        <% for (appointment_tab item : app_data) {%>
                    <div class="profile-appointment-card" >
                        <table>
                            <tr>
                                <td class="app-doc-img">
                                    <img src="../../resources/images/dumy.jpg" alt="doctor img" width="100px" height="100px" />
                                </td>
                                <td class="app-doc-info">
                                    <strong><%  for (doctor_info doc_item : doc_data) {
                                            if (doc_item.getDoc_id() == item.getDoc_id()) {
                                                for (dblogin log_item : log_data) {
                                                    if (log_item.getLog_id() == doc_item.getLog_id()) {%>
                                        <span><%=log_item.getFull_name()%></span>
                                        <%break;
                                                        }
                                                    }
                                                }
                                            }
                                        %></strong>
                                    <address>
                                        <%  for (doctor_info doc_item : doc_data) {
                                                if (doc_item.getDoc_id() == item.getDoc_id()) {
                                                    for (address add_item : add_data) {
                                                        if (add_item.getLog_id() == doc_item.getLog_id()) {%>
                                        <i class="glyphicon glyphicon-map-marker"></i><%=add_item.getStreet_no() + ", " + add_item.getCity() + ", " + add_item.getState() + ", " + add_item.getCountry() + " " + add_item.getPincode()%>
                                        <%break;
                                                        }
                                                    }
                                                }
                                            }
                                        %>
                                    </address>
                                </td>
                                <td class="app-doc-phone">
                                    <%  for (doctor_info doc_item : doc_data) {
                                            if (doc_item.getDoc_id() == item.getDoc_id()) {
                                                for (dblogin log_item : log_data) {
                                                    if (log_item.getLog_id() == doc_item.getLog_id()) {%>
                                    <span><i class="glyphicon glyphicon-earphone"></i> <%=log_item.getPhone_no()%></span>
                                    <%break;
                                                    }
                                                }
                                            }
                                        }
                                    %>
                                </td>
                                <td class="app-doc-time">
                                    <span>date <%=item.getDate()%> <br>time <%=item.getTime()%></span>
                                </td>
                                <td class="app-doc-status">
                                    <% String status = ""; %>
                                    <% if (Integer.parseInt(item.getDate()) == (new Date()).getDate()) {
                                            status = "today";
                                        } else if (Integer.parseInt(item.getDate()) > (new Date()).getDate()) {
                                            status = "coming up";
                                        } else {
                                            status = "over";
                                        }
                                    %>
                                    <span>
                                        <%=status%>
                                    </span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <hr>
                    <%}
                    %>
                </div>
                <div id="profile-container-prescrription-div">

                </div>
                <div id="profile-container-feedback-div">
                    <strong>Feedback</strong>
                    <hr />

                    <% List<feedback_tab> feedback_data = (List<feedback_tab>) request.getAttribute("feedback_data"); %>
                    <% for (feedback_tab item : feedback_data) {%>
                    <div id="feedback-div1" class="feedback-div">
                        <div class="feedback-div-left">
                            <img src="../../resources/images/dumy.jpg" alt="profile-pic" width="70px" />
                            <br />
                            <%  for (doctor_info doc_item : doc_data) {
                                    if (doc_item.getDoc_id() == item.getDoc_id()) {
                                        for (dblogin log_item : log_data) {
                                            if (log_item.getLog_id() == doc_item.getLog_id()) {%>
                            <span>for <%=log_item.getFull_name()%></span>
                            <%break;
                                            }
                                        }
                                    }
                                }
                            %>

                        </div>
                        <div class="feedback-div-right">
                            <span>Visited for <%=item.getProblem()%></span>
                            <br />
                            <p><%=item.getDescription()%></p>
                            <span><%=item.getRating()%></span><br />
                            <span class="glyphicon glyphicon-calendar"><%=item.getAdded_on()%></span>
                        </div>
                    </div>
                    <hr />
                    <%}%>
                </div>

                <div id="profile-container-change-pass-div">
                    <script type="text/javascript">
                        var check = function () {
                            var password = document.getElementById("password");
                            var confirm_password = document.getElementById("confirm_password");
                            if (password.value != confirm_password.value) {
                                confirm_password.setCustomValidity("Passwords Don't Match");
                            } else {
                                confirm_password.setCustomValidity('');
                            }
                        }
                    </script>
                    <strong>Change Password</strong>
                    <hr />
                    <form action="/changepass" method="post">
                        <table>
                            <!--                            <tr>
                                                            <td>Old Password</td>
                                                            <td>:</td>
                                                            <td><input name="oldpass" type="password" autocomplete="off" class="text-box" required /></td>
                                                        </tr>-->
                            <tr>
                                <td>New Password</td>
                                <td>:</td>
                                <td><input name="newpass" type="password" id="password" onkeyup='check();' autocomplete="off" class="text-box" required /></td>
                            </tr>
                            <tr>
                                <td>Confirm Password</td>
                                <td>:</td>
                                <td><input name="confirm-pass-text-box" id="confirm_password" onkeyup='check();' type="password" class="text-box" required /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="submit" value="change" class="btn btn-default" /></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>

        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
