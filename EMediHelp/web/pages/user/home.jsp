<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>E-MediHelp</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
    <link href="../../resources/css/user/home.css" rel="stylesheet" type="text/css" />
    <script src="../../resources/js/slider/slider.js" type="text/javascript"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="../shared/header.jsp" %>
    
    <%@include file="../shared/navbar.jsp" %>    
    <div id="slider-container" class="slider">
        
        <div class="slider-sliding-div">
            <img src="../../resources/images/High-Tech-Medical-1200x500.jpg" alt="" class="slider-sliding-imgs" />
        </div>        
        <div class="slider-sliding-div">
            <img src="../../resources/images/images5.jpg" alt="" class="slider-sliding-imgs" />
        </div>
        <div class="slider-sliding-div">
            <img src="../../resources/images/images6.jpg" alt="" class="slider-sliding-imgs" />
        </div>
        <div class="slider-sliding-div">
            <img src="../../resources/images/images3.jpg" alt="" class="slider-sliding-imgs" />
        </div>
        
    </div>
   
    <!--content1-->
    <div id="content1">
        <div id="feature-div1" class="feature-div">
            <div id="feature-div1-img" class="fa fa-hospital-o">
            </div>
            <span class="feature-heading">Caring for the health of whole family</span> <span
                class="feature-disc">We are a small, warm, multilingual private practice located in a vibrant, diverse, multiethnic community. We are dedicated to providing accessible, high-quality care.
Our providers spend time with patients, really listening to make sure all issues are addressed. From the youngest angel of your family to the eldest head of your family, everyone is under our concern.
</span>
        </div>
        <div id="feature-div2" class="feature-div">
            <div id="feature-div2-img" class="fa fa-user-md">
            </div>
            <span class="feature-heading">One therapeutist for the whole family</span> <span
                class="feature-disc">Family counseling aims to promote understanding and collaboration among family members in order to solve the problems of one or more individuals. For example, if a child is having social and academic problems, therapy will focus on the family patterns that may contribute to the child's acting out, rather than evaluating the child's behavior alone.
</span>
        </div>
        <div id="feature-div3" class="feature-div">
            <div id="feature-div3-img" class="fa fa-medkit">
            </div>
            <span class="feature-heading">Efficient one stop medical care</span> <span class="feature-disc">
                The unique benefit of the service is that it brings a multi-disciplinary team, including doctors, specialist nurses and radiographers together in one area to ensure patients are able to have their initial consultation, a variety of diagnostic tests, investigations and their follow-up consultation in the same day, reducing the need for multiple visits.
</span>
        </div>
        <div id="feature-div4" class="feature-div">
            <div id="feature-div4-img" class="fa fa-heartbeat">
            </div>
            <span class="feature-heading">Personal approach to medical questions</span> <span
                class="feature-disc">In addition to the young person who presents with a specific complaint, the physician has much to discuss with ‘healthy’ youth in the office. It is in fact during these adolescent years that behaviour such as eating habits, safe sex practices and physical activity regimens become established.</span>
        </div>
    </div>
    
    <!--content2-->
    <div id="content2">
       <div id="content2-container">
            <center>
                <h1>
                        About Us
                </h1>
            </center>
            <div id="about-us-div1" class="about-us-div">
                <div id="about-us-div1-img" class="about-us-div-img">
                        <i id="icon1" class="fa fa-ambulance"></i>
                </div>
                <div id="about-us-div1-title" class="about-us-div-title">
                        <span>Medical Transport</span>
                </div>
            </div>
            <div id="about-us-div2" class="about-us-div">
                <div id="about-us-div2-img" class="about-us-div-img">
                        <i id="icon2" class="fa fa-stethoscope"></i>
                </div>
                <div id="about-us-div2-title" class="about-us-div-title">
                        <span>Clinic personal</span>
                </div>
            </div>
            <div id="about-us-div3" class="about-us-div">
                <div id="about-us-div3-img" class="about-us-div-img">
                        <i id="icon3" class="fa fa-heartbeat"></i>
                </div>
                <div id="about-us-div3-title" class="about-us-div-title">
                        <span>Heart Problems</span>
                </div>
            </div>
            <div id="about-us-div4" class="about-us-div">
                <div id="about-us-div4-img" class="about-us-div-img">
                        <i id="icon4" class="fa fa-hospital-o"></i>
                </div>
                <div id="about-us-div4-title" class="about-us-div-title">
                        <span>Hospital Details</span>
                </div>
            </div>
       </div>
    </div>
    
    <%@include file="../shared/section.jsp" %>
    
    <%@include file="../shared/footer.jsp" %>
        
    <!--<%-- slider script starts --%>-->

    <!--<script type="text/javascript" src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>-->
    <script type="text/javascript" src="../../resources/js/slider/slick.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.slider').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 2000,
                arrows: false,
                dots: true
            });
        });
    </script>
    <!--<%-- slider script ends --%>-->
</body>
</html>
