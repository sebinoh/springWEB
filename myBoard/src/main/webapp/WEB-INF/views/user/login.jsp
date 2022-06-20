<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--============================ Vue.js CDN 방식 ===========================================-->
	<!--  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script> -->
	<!--============================ Vue.js CDN 방식 ===========================================-->
	
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/53a8c415f1.js" crossorigin="anonymous"></script>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${path}/resources/image/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${path}/resources/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<!-- <script src="${path}/resources/js/login.js"></script>  --> 
<!--===============================================================================================-->
	<link href="${path}/resources/css/loginStyle.css" rel="stylesheet"/> 	
</head>
<body>
	<script type="text/javascript">
		var message = '${msg}';
		if(message != ""){
			alert(message);
			console.log(message);
		}
	</script>

	<div class="wrap">
        <div class="login">
            <h2>Log-in</h2>
            <div class="login_sns">
            <li><a href=""><i class="fab fa-instagram"></i></a></li>
            <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
            <li><a href=""><i class="fab fa-twitter"></i></a></li>
            </div>
			<div class="login_id">
            <form method="POST">
                <h4>E-mail</h4>
                <input type="email" name="email" placeholder="Email">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="password" placeholder="Password">
            </div>
            <div class="login_etc">
                <div class="forgot_pw">
                	<a href="signUp">Join Us !</a>
            	</div>
            </div>
            <div class="submit">
                <input type="submit" value="submit">
            </div>
			</form>
			</div>
        </div>
    </div>
</body>
</html>