<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<!--============================ Vue.js CDN 방식 ===========================================-->
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<!--============================ Vue.js CDN 방식 ===========================================-->
	<!--=========================== related Bootstrap ==================================-->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<!--=========================== related Bootstrap ==================================-->
	<!-- <link href="${path}/resources/css/board.css" rel="stylesheet"/> 	 -->
	
	<title>글 상세보기</title>
	
</head>
<body>
	<script type="text/javascript">
		var message = '${msg}';
		if(message != "")
			alert(message);
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
	      <form class="d-flex">
	        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        <button class="btn btn-outline-success" type="submit">Search</button>
	      </form>
	    </div>
	  </div>
	</nav>
	<!--====================================== nav바 =====================================-->
	<div class="container" style="padding-top: 50px;">
		<div>
			<p style="font-size: 4vw; font-weight: bold;">${data.title}</p>
		</div>
		<div class="row">
			<div class="col-2">
				<p>${data.writer_name}</p>
			</div>
			<div class="col-2">
				<p><fmt:formatDate value="${data.write_date}" pattern="yyyy-mm-dd" /></p>
			</div>
		</div>
		<div style="padding-top: 30px; padding-bottom: 30px;">
		     <p>${data.content}</p>
		 </div>
	</div>
	<!--=================================== 삭제 버튼 ======================================-->
	<div class="container" id="app">
		<template v-if="showDeleteBtn">
		<div class="row">
			<div class="col-2">
				<form method="post" action="/delete/${data.board_id}">
					<button id="delete_button" type="submit" class="btn btn-danger" style="width: 100%">삭제</button>
				</form>
			</div>
			<div class="col-2">
				<form method="post" action="/put/${data.board_id}">
					<button id="modify_button" type="submit" class="btn btn-warning" style="width: 100%">수정</button>
				</form>
			</div>
		</div>
		</template>
	</div>
	<!--=================================== 삭제 버튼 ======================================-->
</body>
<script>
	
	var user = '${userInfo}';
	var userId = '${userInfo.id}';
	var writerId = '${data.writer}';
	new Vue({
		el: "#app",
		data: {
			showDeleteBtn : false
		},
		mounted(){
			this.checkLogin();
			this.checkOwner();
		},
		methods:{
			checkLogin:function(){
				if(user != ""){	//로그인 되어있음
					this.loginData = "Logout";
					this.link ="logout";
					
				}
			},
			checkOwner:function(){
				if(userId == writerId){
					this.showDeleteBtn = true;	//삭제 버튼 보이기
				}
			}
		}
				
	})
</script>
</html>