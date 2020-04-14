<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<style>
*{
	margin: 0;
	padding: 0;
}


body, html{
	
	margin: 2rem auto;
	width: 800px;
}


.container{
	margin: 0 auto;
}
</style>
</head>
<body>
	<section class="sec-form">
		<form class="container">
			<div class="form-group">
				<input type="hidden" class="form-control" id="id" value="${userVO.id}">
			</div>
			<div class="form-group">
				<label for="username">username</label> 
				<input type="text" class="form-control" id="username" value="${userVO.username}">
			</div>
			<div class="form-group">
				<label for="password">password</label> 
				<input type="password" class="form-control" id="password" value="${userVO.password}">
			</div>
			<div class="form-group">
				<label for="email">email</label> 
				<input type="email" class="form-control" id="email" value="${userVO.email}">
			</div>
			<div class="form-group">
				<label for="phone">phone number</label> 
				<input type="text" class="form-control" id="phone" value="${userVO.phone}">
			</div>

			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</section>
</body>
</html>