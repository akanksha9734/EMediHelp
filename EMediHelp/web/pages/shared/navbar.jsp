<%-- 
    Document   : navbar
    Created on : Jul 15, 2017, 4:04:12 PM
    Author     : ku1d33p
--%>

<%@page import="java.util.List"%>
<%@page import="db.specialization_tab"%>
<%--<%@page contentType="text/html" pageEncoding="UTF-8"%>--%>
<script type="text/javascript">
    $(function () {
        logvisibility = true;
        $('#acc-btn').click(function () {
            if (logvisibility) {
                $('#logged-in-div-container').show();
                logvisibility = false;
                return false;
            } else {
                $('#logged-in-div-container').hide();
                logvisibility = true;
                return false;
            }
        });
        docvisibility = true;
        $('#attach_box').click(function () {
            if (docvisibility) {
                $('#doclistdiv').show();
                docvisibility = false;
                return false;
            } else {
                $('#doclistdiv').hide();
                docvisibility = true;
                return false;
            }
        });
    });
</script>
<nav>
    <div id="nav-container">
        <div id="nav-div-left">
            <ul class="ul-container">
                <li><a class="active" href="/home"><i class="glyphicon glyphicon-home"></i></a></li>
                <li><a id="attach_box" href="#">Doctors</a></li>
                <li><a  href="/article">Articles</a></li>
                    <% HttpSession ssa = request.getSession();
                        if (ssa.getAttribute("page_acc_lvl") != null && ssa.getAttribute("sessionId") != null) {
                            if (Integer.parseInt(ssa.getAttribute("page_acc_lvl").toString()) == 2) {%>
                <li><a  href="/appointment?doc_id=<%=ssa.getAttribute("sessionId")%>">Appointments</a></li>
                    <%}
                        }
                    %>
                    <% if (ssa.getAttribute("page_acc_lvl") != null && ssa.getAttribute("sessionId") != null) {
                            if (Integer.parseInt(ssa.getAttribute("page_acc_lvl").toString()) == 3) {%>
                <li><a  href="/filters">Admin</a></li>
                    <%}
                        }
                    %>
                <li><a  href="/aboutus">About us</a></li>
                <li><a  href="/contactus">Contact us</a></li>
            </ul>            
        </div>
        <div id="nav-div-right">
            <ul class="ul-container reg-ul">
                <!--<li>
                    <span class="glyphicon glyphicon-bell"></span>
                </li>-->
                <li>
                    <% HttpSession ss = request.getSession(); %>
                    <%if (ss.getAttribute("page_acc_lvl") == null && ss.getAttribute("sessionId") == null) {%>
                    <a id="login-btn" href="/login">Login / Register</a>
                    <%} else {%>
                    <a id="acc-btn" href="#"><i class="glyphicon glyphicon-user"></i> &nbsp;<%=ss.getAttribute("user_name")%></a>
                        <%}%>
                </li>
            </ul>
        </div>        
    </div>
</nav>
<div id="doclistdiv">
    <div id="specialist-container">
        <strong>General Physicians and Specialists</strong>
        <% List<specialization_tab> speci_data = (List<specialization_tab>) request.getAttribute("speci_data"); %>
        <% for (specialization_tab item : speci_data) {%>
        <div class="specialist-name">
            <a href="/doctor?specialization=<%=item.getSpecialization_id()%>">
                <span><i class="glyphicon glyphicon-chevron-right"></i><%=item.getSpecialization()%></span>
            </a>
        </div>
        <%}%>
    </div>
    <!--    <div id="medi-practioner-container">
            <strong>Medicine Practitioner Type</strong>
            <div class="specialist-name">
                <span><i class="glyphicon glyphicon-chevron-right"></i>Ayurvedic</span>
            </div>
            <div class="specialist-name">
                <span><i class="glyphicon glyphicon-chevron-right"></i>Homoeopath</span>
            </div>
            <div class="specialist-name">
                <span><i class="glyphicon glyphicon-chevron-right"></i>Alopathy</span>
            </div>
        </div>-->
</div>
<div id="logged-in-div-container">
    <div class="logged-in-div">
        <ul>
            <li>
                <a href="/profile?profile" ><span>Profile</span></a>
            </li>
            <li>
                <a href="/profile?appointment" ><span>Appointments</span></a>
            </li>
            <li>
                <a href="/profile?feedback" ><span>My Feedback</span></a>
            </li>
            <li>
                <a href="/profile?changepass" ><span>Change Password</span></a>
            </li>
            <li>
                <a href="/logout" ><span>Logout</span></a>
            </li>
        </ul>
    </div>
</div>