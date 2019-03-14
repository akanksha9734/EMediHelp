<%-- 
    Document   : addfilters
    Created on : Jul 23, 2017, 12:20:32 PM
    Author     : ku1d33p
--%>

<%@page import="db.medicine_practice_type"%>
<%@page import="java.util.List"%>
<%@page import="db.role"%>
<%@page import="db.image_type"%>
<%@page import="db.specialization_tab"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>

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
                
                <div id="add-role-type-panel" class="col-lg-3 panel panel-default panel-body">
                    <% List<role> role_data = (List<role>) request.getAttribute("role_data"); %>
                    <center><strong>Role</strong></center><br>
                    <ul class="list-group card">
                        <% for (role item : role_data) {%>
                        <li class="list-group-item">
                            <span><%=item.getRole_name()%></span>
                            <a href="/deletefilter?type=role&id=<%=item.getRole_id()%>" title="delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
                        </li>
                        <%}%>
                    </ul>
                    <br />
                    <form action="/filters?operation=add&type=role" method="POST">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" class="form-control" name="add-role-type-inp" id="add-role-type-inp" ><br>
                                <button class="btn btn-primary" title="add" type="submit">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </li>
                        </ul>
                    </form>
                </div>

                <div id="add-img-type-panel" class="col-lg-3 panel panel-default panel-body">
                    <% List<image_type> img_type_data = (List<image_type>) request.getAttribute("img_type_data"); %>
                    <center><strong>Image Type</strong></center><br>
                    <ul class="list-group card">
                        <% for (image_type item : img_type_data) {%>
                        <li class="list-group-item">
                            <span><%=item.getType_name()%></span>
                            <a href="/deletefilter?type=img_type&id=<%=item.getImg_type_id()%>" title="delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
                        </li>
                        <%}%>
                    </ul>
                    <br />
                    <form action="/filters?operation=add&type=img_type" method="POST">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" class="form-control" name="add-img-type-inp" id="add-img-type-inp" ><br>
                                <button class="btn btn-primary" title="add" type="submit">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </li>
                        </ul>
                    </form>
                </div>

                <div id="add-speci-type-panel" class="col-lg-3 panel panel-default panel-body">
                    <% List<specialization_tab> speci_data = (List<specialization_tab>) request.getAttribute("speci_data"); %>
                    <center><strong>Specialization Type</strong></center><br>
                    <ul class="list-group card">
                        <% for (specialization_tab item : speci_data) {%>
                        <li class="list-group-item">
                            <span><%=item.getSpecialization()%></span>
                            <a href="/deletefilter?type=speci&id=<%=item.getSpecialization_id()%>" title="delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
                        </li>
                        <%}%>
                    </ul>
                    <br />
                    <form action="/filters?operation=add&type=speci" method="POST">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" class="form-control" name="add-speci-type-inp" id="add-speci-type-inp" ><br>
                                <button class="btn btn-primary" title="add" type="submit">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </li>
                        </ul>
                    </form>
                </div>

                <div id="add-med-pract-type-panel" class="col-lg-3 panel panel-default panel-body">
                    <% List<medicine_practice_type> med_prct_data = (List<medicine_practice_type>) request.getAttribute("med_prct_data"); %>
                    <center><strong>Medicine Practice Type</strong></center><br>
                    <ul class="list-group card">
                        <% for (medicine_practice_type item : med_prct_data) {%>
                        <li class="list-group-item">
                            <span><%=item.getType()%></span>
                            <a href="/deletefilter?type=practi&id=<%=item.getMedi_pract_id()%>" title="delete" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span></a>
                        </li>
                        <%}%>
                    </ul>
                    <br />
                    <form action="/filters?operation=add&type=practi" method="POST">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <input type="text" class="form-control" name="add-parti-type-inp" id="add-speci-type-inp" ><br>
                                <button class="btn btn-primary" title="add" type="submit">
                                    <i class="glyphicon glyphicon-plus"></i>
                                </button>
                            </li>
                        </ul>
                    </form>
                </div>
                    
            </div>
        </div>
    </body>
</html>
