<%-- 
    Document   : contactus
    Created on : Jul 19, 2017, 3:22:23 AM
    Author     : ku1d33p
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-MediHelp | Contact Us</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
        
        <link href="../../resources/css/user/contactus.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="../shared/header.jsp" %>
    
        <%@include file="../shared/navbar.jsp" %>
        
        <div id="contact-form">
            <div>
                <h1>Nice to Meet You!</h1> 
                <h4>Have a question or just want to get in touch?</h4> 
            </div>
            <p id="failure">Oopsie...message not sent.</p>  
            <p id="success">Your message was sent successfully. Thank you!</p>
            <form method="post" action="/">
                <div>
                    <label for="name">
                        <span class="required">Name: *</span> 
                        <input type="text" id="name" name="name" value="" placeholder="Your Name" required="required" tabindex="1" autofocus="autofocus" />
                    </label> 
                </div>
                <div>
                    <label for="email">
                        <span class="required">Email: *</span>
                        <input type="email" id="email" name="email" value="" placeholder="Your Email" tabindex="2" required="required" />
                    </label>  
                </div>
                <div>		          
                    <label for="subject">
                        <span><font color="#C0C0C0">Subject:</font> </span>
                        <input type="text" id="subject" name="subject" value="" placeholder="Subject" required="required" tabindex="1" />
                    </label>
                </div>
                <div>		          
                    <label for="message">
                        <span class="required">Message: *</span> 
                        <textarea id="message" name="message" placeholder="Please write your message here." tabindex="5" required="required"></textarea> 
                    </label>  
                </div>
                <div>		           
                    <button name="submit" type="submit" id="submit" >SEND</button> 
                </div>
            </form>
	</div>
            
        <%@include file="../shared/footer.jsp" %>
    </body>
</html>
