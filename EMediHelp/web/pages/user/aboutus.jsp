<%-- 
    Document   : aboutus
    Created on : Jul 22, 2017, 4:26:26 AM
    Author     : ku1d33p
--%>

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
        
        <link href="../../resources/css/user/aboutus.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
        <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>
        
        <div class="about">
            <div class="container">
                <h3>
                    About Us</h3>
                <div class="about-text">
                    <div class="col-md-4 about-text-left">
                        <img src="../../resources/images/img18.jpg" class="img-responsive" alt="" />
                    </div>
                    <div class="col-md-8 about-text-right">
                        <h4>
                            "It's no coincidence that four of the six letters in health are HEAL."
                        </h4>
                        <p>
                            For millions of people, E-MediHelp is the trusted and familiar home where they know
                            they’ll find a healing touch. It connects them with everything they need to take
                            good care of themselves and their family - assessing health issues, finding the
                            right doctor, booking diagnostic tests, obtaining medicines, storing health records
                            or learning new ways to live healthier. Healthcare providers can also harness the
                            power of E-MediHelp as the definitive platform that helps them build their presence,
                            grow establishments and engage patients more deeply than ever.</p>
                        <ul>
                            <li><a href="#">We help millions of patients and thousands of doctors with a simpler,
                                easier healthcare experience.</a></li>
                            <li><a href="#">We list for free and ensure each doctor profile is verified for medical
                                license, qualification and specialisation.</a></li>
                            <li><a href="#">Remember: Laughter is the best medicine.</a></li>
                        </ul>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
                <div class="about-team">
                    <h3>
                        Meet Our Team</h3>
                    <div class="main">
                        <div id="mi-slider" class="mi-slider">
                            <ul>
                                <li>
                                    <div class="about-team-grids">
                                        <img src="../../resources/images/img10.jpg" class="img-responsive img-circle" alt="" />
                                        <div class="team-text">
                                            <h4>
                                                <b>DANIEL</b> Surgeon</h4>
                                            <p>
                                                Doctoral degree (M.D.), Residency and licensure; a fellowship and certification
                                                are also available.
                                            </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="about-team-grids">
                                        <img src="../../resources/images/img11.jpg" class="img-responsive img-circle" alt="" />
                                        <div class="team-text">
                                            <h4>
                                                <b>HERMIONE</b> Director</h4>
                                            <p>
                                                Master's degree in healthcare administration or related field, all medical and health
                                                service managers.</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="about-team-grids">
                                        <img src="../../resources/images/img12.jpg" class="img-responsive img-circle" alt="" />
                                        <div class="team-text">
                                            <h4>
                                                <b>HARRY</b> Cardiologists</h4>
                                            <p>
                                                Doctoral degree in medicine; completion of a residency program in internal medicine
                                                and cardiology.</p>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="about-skills">
                    <h3>
                        Why Choose Us</h3>
                    <div class="col-md-7 abt-skills-grids">
                        <h4>
                            We Are...</h4>
                        <div class="carr-text">
                            <h5>
                                Diverse people. One purpose.
                                <p>
                                    We are dreamers, thinkers and do-ers rolled into one.Together, we want to improve
                                    the healthcare experience for all humanity. We are guided by our values and driven
                                    by our motto to do great.
                                </p>
                        </div>
                        <div class="carr-text">
                            <h5>
                                As people</h5>
                            <p>
                                These are not just principles for our products or our company, but they are a reflection
                                of who we are as people.</p>
                        </div>
                        <div class="carr-text">
                            <h5>
                                Do Great</h5>
                            <p>
                                Do Great is our motto and is the hallmark of a true Practeon. It signifies the intrinsic
                                motivation in each Practeon to strive for excellence. Every time. This means we
                                do our best work, not for want of rewards or recognitions but because we expect
                                it of ourselves.</p>
                        </div>
                    </div>
                    <div class="col-md-5 abt-skills-grids about-text-right">
                        <h4>
                            OUR SKILLS</h4>
                        <ul>
                            <li><a href="#">Instant appointment with doctors.Guaranteed.</a></li>
                            <li><a href="#">Allows quick and easy search with speedy booking.</a></li>
                            <li><a href="#">Even maintains history of doctors visited.</a></li>
                            <li><a href="#">Tips to live a healthy life for free.</a></li>
                            <li><a href="#">The most advanced software for clinics and hospitals.</a></li>
                            <li><a href="#">State of the art business analytics for enterprises.</a></li>
                            <li><a href="#">"Stay Happy Stay Healthy"</a></li>
                        </ul>
                    </div>
                    <div class="clearfix">
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
