<%-- 
    Document   : article
    Created on : Jul 20, 2017, 11:45:55 PM
    Author     : ku1d33p
--%>

<%@page import="db.dblogin"%>
<%@page import="db.image"%>
<%@page import="db.blog"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>E-MediHelp</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

            <link href="../../resources/css/user/article.css" rel="stylesheet" type="text/css"/>
            <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
            <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
            <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div id="news-container">
            <div id="news-container-left">  

                <% if (request.getSession().getAttribute("sessionId") != null) {%>
                <div class="panel panel-body ">
                    <center>Add Article</center>
                    <form action="/article" method="post">
                        <div class="row">
                            <span>Article heading</span>
                            <input type="text" class="form-control" name="heading" required />
                        </div>
                        <div class="row">
                            <span>Article heading</span>
                            <textArea class="form-control" name="articledetail" rows="10" ></textArea>
                        </div>
                        <div class="row">
                            <input type="submit" class="btn btn-default" />
                        </div>
                    </form>
                </div>
                <%}
                %>

                <% List<blog> blog_data = (List<blog>) request.getAttribute("blog_data"); %>
                <% List<dblogin> log_data = (List<dblogin>) request.getAttribute("log_data"); %>
                <% for (blog blog_item : blog_data) {%>
                <div id='bl-post<%=blog_item.getBl_id()%>' class="news-post-container">
                    <span id="news_post_heading" class="news-post-heading"><%=blog_item.getHeading()%></span><br />
                    <div class="news-post-time-stamp-container">
                        <div class="news-post-time-stamp-container-left">
                            <i class="glyphicon glyphicon-calendar"></i>
                        </div>
                        <div class="news-post-time-stamp-container-right">
                            <span id="time_stamp_label" class="time-stamp-date-label"><%=blog_item.getAdded_on()%></span>
                        </div>
                    </div>
                    <img id="news_post_banner_image" src="../../resources/images/High-Tech-Medical-1200x500.jpg" class="news-post-banner-image" width="800px" height="" /><br />
                    <span id="news_post_discription" class="news-post-discription"><%=blog_item.getDetail()%></span><br />
                    <% for (dblogin log_item : log_data) {
                            if (log_item.getLog_id() == blog_item.getAdded_by()) {%>
                            <span class="news-post-discription"><i class="glyphicon glyphicon-pencil"></i>
                        <%=log_item.getFull_name().toUpperCase()%>
                            </span>
                    <%break;
                                    }
                                }%>
                    <div class="news-post-container-hr"></div>
                </div>
                <%}%>

            </div>
            <div id="news-container-right">
                <span id="news-recent-post-heading">Recent Articles</span>
                <div id="recent-post-container">
                    <%int count = 0;
                        for (blog item : blog_data) {
                            if (count < 5) {%>
                            <a id="blog_post_hyperlink" Class="recent-post-link" href="#bl-post<%=item.getBl_id()%>"><%=item.getHeading()%></a>
                            <hr class="recent-post-hr" />
                    <%count++;
                            } else {
                                break;
                            }
                        }%>
                    
                </div>
            </div>
        </div>

        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
