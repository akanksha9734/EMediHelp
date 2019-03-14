<%-- 
    Document   : login
    Created on : Jul 16, 2017, 10:06:20 PM
    Author     : ku1d33p
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-MediHelp | Login</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
        <link href="../../resources/css/user/login-reg.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <%@include file="../shared/header.jsp" %>
    
        <%@include file="../shared/navbar.jsp" %>
        <div class="form">      
            <ul class="tab-group">
                <li class="tab"><a href="/signup">Sign Up</a></li>
                <li class="tab active"><a href="/login">Log In</a></li>
            </ul>
            <div id="login">   
                <h1>Welcome Back!</h1>
                <form action="/login" method="post">
                    <div class="field-wrap">
                        <label>
                            Email Address<span class="req">*</span>
                        </label>
                        <input type="email" name="email" required autocomplete="off"/>
                    </div>
                    <div class="field-wrap">
                        <label>
                        Password<span class="req">*</span>
                        </label>
                        <input type="password" name="pass" required autocomplete="off"/>
                    </div>
                    <p class="forgot"><a href="signup.htm">Forgot Password?</a></p>
                    <button type="submit" class="button button-block"/>Log In</button>
                </form>
            </div>
        </div>
    </body>
</html>
