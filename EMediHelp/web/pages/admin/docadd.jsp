<%-- 
    Document   : docadd
    Created on : Jul 25, 2017, 8:32:17 PM
    Author     : ku1d33p
--%>

<%@page import="java.util.List"%>
<%@page import="db.specialization_tab"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add doc</title>
        <style>
            .card {
                max-height:450px;
                overflow-y:scroll;
                overflow-x:auto;
            }
        </style>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">E-Medihelp | Admin</a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/filters">Filter</a></li>
                    <li class="active"><a href="/adddoc">Add Doctor</a></li>
                    <li class="active"><a href="/home">Home</a></li>
                </ul>
                &nbsp;<a href="/logout" class="btn btn-danger navbar-btn">Logout</a>
            </div>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-offset-3 col-lg-6 panel panel-default panel-body">
                    <center>
                        <strong>Add doctor</strong>
                    </center>
                    <form action="/adddoc" method="post">
                        <table class="table">
                            <tr>
                                <td>fullname</td>
                                <td>:</td>
                                <td><input type="text" class="form-control" name="fullname" required/></td>
                            </tr>
                            <tr>
                                <td>email</td>
                                <td>:</td>
                                <td><input type="email" class="form-control" name="email" required/></td>
                            </tr>
                            <tr>
                                <td>dob</td>
                                <td>:</td>
                                <td><input type="date" class="form-control" name="dob" required/></td>
                            </tr>
                            <tr>
                                <td>phone</td>
                                <td>:</td>
                                <td><input type="text" pattern="[1-9]{1}[0-9]{9}" class="form-control" name="phone" required/></td>
                            </tr>
                            <tr>
                                <td>password</td>
                                <td>:</td>
                                <td><input type="password" class="form-control" name="pass" required/></td>
                            </tr>
                            <tr>
                                <td>specialization</td>
                                <td>:</td>
                                <td>
                                    <select class="form-control" name="spci">
                                        <% List<specialization_tab> speci_data = (List<specialization_tab>) request.getAttribute("speci_data"); %>
                                        <% for (specialization_tab item : speci_data) {%>
                                        <option value="<%=item.getSpecialization_id()%>"><%=item.getSpecialization()%></option>
                                        <%}%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>gender</td>
                                <td>:</td>
                                <td>
                                    <input class="ratting-radio" type="radio" name="gen" value="1" required/> Male &nbsp;
                                    <input class="ratting-radio" type="radio" name="gen" value="0" required/> Female &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>experience</td>
                                <td>:</td>
                                <td><input min="0" type="number" class="form-control" name="expr" required/></td>
                            </tr>
                            <tr>
                                <td>Discription</td>
                                <td>:</td>
                                <td><textarea class="form-control" name="detail" rows="10" required ></textarea></td>
                            </tr>
                            <tr>
                                <td>base fee</td>
                                <td>:</td>
                                <td><input min="1" type="number" class="form-control" name="fee" required/></td>
                            </tr>
                            <tr>
                                <td>rating</td>
                                <td>:</td>
                                <td>
                                    <input class="ratting-radio" type="radio" name="ratting" value="1" required/> 1 &nbsp;
                                    <input class="ratting-radio" type="radio" name="ratting" value="2" required/> 2 &nbsp;
                                    <input class="ratting-radio" type="radio" name="ratting" value="3" required/> 3 &nbsp;
                                    <input class="ratting-radio" type="radio" name="ratting" value="4" required/> 4 &nbsp;
                                    <input class="ratting-radio" type="radio" name="ratting" value="5" required/> 5 &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>Street no</td>
                                <td>:</td>
                                <td><input type="text" name="street" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Landmark</td>
                                <td>:</td>
                                <td><input type="text" name="landmark" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>City</td>
                                <td>:</td>
                                <td><input type="text" name="city" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>State</td>
                                <td>:</td>
                                <td><input type="text" name="state" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>Pincode</td>
                                <td>:</td>
                                <td><input type="text" name="pin" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td>country</td>
                                <td>:</td>
                                <td><input type="text" name="country" class="form-control" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><input type="submit" class="btn btn-default" value="add" /></td>
                            </tr>
                        </table>
                    </form>
                </div>    
            </div>
        </div>
    </body>
</html>
