<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
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
	<script src="${path}/resources/js/login.js"></script>
<!--===============================================================================================-->
	<link href="${path}/resources/css/signUpStyle.css" rel="stylesheet"/> 	
</head>
<body>
	<script type="text/javascript">
		var message = '${msg}';
		if(message != ""){
			alert(message);
		}	
	</script>

	<div class="wrap">
        <div class="login">
            <h2>Sign-Up</h2>
			<div class="login_id">
            <form method="POST">
                <h4>E-mail</h4>
                <input type="text" name="email" placeholder="이메일을 적어주세요">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="pwd" placeholder="비밀번호를 입력하세요">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="pwd_check" placeholder="비밀번호 한번 더 !">
            </div>
            <div class="login_id">
            <h4>name</h4>
                <input type="text" name="username" placeholder="이름을 적어주세요">
            </div>
            <div class="login_id">
            <input type="date" name="birth" placeholder="생년월일을 입력해주세요">
            </div>
            <div class="submit">
                <input type="submit" value="Sign Up">
			</form>
			</div>
        </div>
    </div>
</body>
</html>