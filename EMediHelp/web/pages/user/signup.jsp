<%-- 
    Document   : signup
    Created on : Jul 16, 2017, 10:21:29 PM
    Author     : ku1d33p
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-MediHelp | Signup</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <link href="../../resources/css/user/login-reg.css" rel="stylesheet" type="text/css"/>
        <link href="../../resources/css/user/master.css" rel="stylesheet" type="text/css"/>
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

    </head>
    <body>

        <%@include file="../shared/header.jsp" %>

        <%@include file="../shared/navbar.jsp" %>

        <div class="form">
            <ul class="tab-group">
                <li class="tab active"><a href="/signup">Sign Up</a></li>
                <li class="tab"><a href="/login">Log In</a></li>
            </ul>
            <div id="signup">   
                <h1>Sign Up for Free</h1>
                <form action="/signup" method="post">
                    <div class="top-row">
                        <div class="field-wrap">
                            <label>
                                First Name<span class="req">*</span>
                            </label>
                            <input type="text" name="fname" required autocomplete="off" />
                        </div>
                        <div class="field-wrap">
                            <label>
                                Last Name<span class="req">*</span>
                            </label>
                            <input type="text" name="lname" required autocomplete="off"/>
                        </div>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Email Address<span class="req">*</span>
                        </label>
                        <input type="email" name="mail" required autocomplete="off"/>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Date of Birth<span class="req">*</span>
                        </label>
                        <input type="date" name="dob" required autocomplete="off"/>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Contact Number<span class="req">*</span>
                        </label>
                        <input type="text" pattern="[1-9]{1}[0-9]{9}" name="contact" required autocomplete="off"/>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Set A Password<span class="req">*</span>
                        </label>
                        <input type="password" id="password" name="pass" onkeyup='check();' required autocomplete="off"/>
                    </div>
                    <div class="field-wrap">
                        <label>
                            Confirm Password<span id="message" class="req">*</span>
                        </label>
                        <input type="password" id="confirm_password" onkeyup='check();' required autocomplete="off"/>
                    </div>
                    <button type="submit" class="button button-block"/>Get Started</button>
                </form>
            </div>
        </div>
    </body>
</html>
