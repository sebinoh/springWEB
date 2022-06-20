<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!--============================ Vue.js CDN 방식 ===========================================-->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!--============================ Vue.js CDN 방식 ===========================================-->
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!-- <link href="${path}/resources/css/board.css" rel="stylesheet"/> 	 -->
	<title>게시판</title>
</head>
<body>
	<script type="text/javascript">
		var message = '${msg}';
		if(message != ""){
			alert(message);
		}	
	</script>
	<!--====================================== nav바 =====================================-->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	  <div class="container-fluid">
	    <a class="navbar-brand" href="#">스프링체험</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
	      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="#">Home</a>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link" href="#">Link</a>
	        </li>
	        <li class="nav-item dropdown">
	          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	            Dropdown
	          </a>
	          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
	            <li><a class="dropdown-item" href="#">Action</a></li>
	            <li><a class="dropdown-item" href="#">Another action</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <li><a class="dropdown-item" href="#">Something else here</a></li>
	          </ul>
	        </li>
	        <li class="nav-item">
	          <a class="nav-link disabled">Disabled</a>
	        </li>
	      </ul>
	      <form id="login" class="d-flex" :action="link">
	        <a id="userName" class="nav-link active" aria-current="page"
	         style="font-weight: bold; color: black; padding-right: 5vw" href="#">${userInfo.name}</a>
	       <button id="logoutBtn" class="btn btn-success" type="submit">
	       {{loginData}}
	       </button>
	      </form>
	    </div>
	  </div>
	</nav>
	<!--====================================== nav바 =====================================-->
	<!--================================ 게시판 로고 이미지 ====================================-->
		<img src="${path}/resources/image/board_pic.png"
		class="img-fluid mx-auto d-block" alt="borad logo picture" style="width: 80%; padding-top: 20px; padding-bottom: 20px;">
	<!--================================ 게시판 로고 이미지 ====================================-->
	<!--=================================== 글쓰기 버튼 ======================================-->
	<div class="container" style="width: 80%; padding-left: 0; padding-bottom: 5px;">
		<form method="GET" action="write">
			<button type="submit" class="btn btn-success">글쓰기</button>
		</form>
	</div>
	<!--=================================== 글쓰기 버튼 ======================================-->
	<!--================================== 게시글 테이블 =======================================-->
		<div id="app" class="login">
			<table class="table table-hover table-bordered table-striped"
			style="width:80%; margin-left:auto; margin-right:auto; padding-bottom: 15px;">
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록날짜</th>
				<c:forEach items="${data}" var = "row">
							<tr>
								<td>${row.num}</td>
								<td><a style="color: black;" href="bbs/${row.board_id}">${row.title}</a></td>
								<td>${row.name}</td>
								<td><fmt:formatDate value="${row.write_date}" pattern="yyyy-MM-dd"/></td>		
							</tr>
				</c:forEach>
			</table>
		</div>
	<!--================================== 게시글 테이블 =======================================-->
		
</body>
<script>
	
	var user = '${userInfo}';
	new Vue({
		el: "#navbarSupportedContent",
		data:{
			loginData:"Login",
			link:"login"	//Login/Logout 버튼에 대한 action값
		},
		mounted(){
			this.checkLogin();
			
		},
		methods:{
			checkLogin:function(){
				if(user != ""){	//로그인 되어있음
					this.loginData = "Logout";
					this.link ="logout";
				}	
			},
			
		}
	
	})
</script>
</html>