<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf" %>
<style>
	body{
        background-color: rgb(245,246,247);
    }
    .login{
        width: 410px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
    .login h2{
        font-size: 30px;
        color: #1a73e8;
        text-align: center;
        border-bottom: 2px solid #1a73e8;;
        line-height: 1;
        padding: 0 0 10px;
    }
    .login li{
        padding: 0 0 12px;
    }
    .login li input{
        font-size: 15px;
        width: 100%;
        height: 45px;
        box-sizing: border-box;
        text-indent: 16px;
    }
    .login li input::-webkit-input-placeholder{
        font-size: 16px; 
        color: gray;
    }
    .login ul{
        padding: 0;
        list-style: none;
        
    }
    
    .login button{
        width: 100%;
        height: 50px;
        background-color: #1a73e8;
        color: white;
        font-size: 18px;
    }
    .login div {
        padding: 0 18px 0;
        display: flex;
        justify-content: center;
    }
    .login div a{
        padding: 10px;
        position: relative;
        bottom: 1rem;
    }
    div a{
        text-decoration: none;
    }
    a:hover{
        font-weight: bold;
    }
    #lb:hover{
        font-weight: bold;
    }
    section.login{
        border-radius: 5px;
    }
    
    .lo:hover, .jo:hover{
    	cursor: pointer;
    }
 	
 	.lo, .jo{
 		margin: 0 3px;
 		border: none;
 	}
 	.button-box{
 		padding-right: 0 !important;
 		padding-left: 0 !important;
 	}
</style>
<script>
	$(function() {
		$(document).on("click","button.jo", function() {
			document.location.href = "${rootPath}/user/join"
		})
	})
</script>
</head>
<body>
	<form action="/user/login" method="POST" class="login-form">
		<section class="login">
		<h2>로그인</h2>		
		<ul>
			<li><input id="username" name="username" placeholder="User ID"></li>
			<li><input type="password" id="password" name="password" placeholder="password"></li>
		</ul>
		<div class="button-box">
			<button class="lo">로그인</button>
			<button class="jo" type="button">회원가입</button>
		</div>
		</section>
	</form>
</body>
</html>