<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf" %>
<style>
	body{
        background-color: rgb(245,246,247);
    }
    .join{
        width: 410px;
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
    }
    .join h2{
        font-size: 30px;
        color: #1a73e8;
        text-align: center;
        border-bottom: 2px solid #1a73e8;;
        line-height: 1;
        padding: 0 0 10px;
    }
    .join li{
        padding: 0 0 12px;
    }
    
    .join li input{
        font-size: 15px;
        width: 100%;
        height: 45px;
        box-sizing: border-box;
        text-indent: 16px;
    }
    
    .join li input::-webkit-input-placeholder{
        font-size: 16px; 
        color: gray;
    }
    
    .join ul{
        padding: 0;
        list-style: none;
        
    }
    
    .join button{
        width: 100%;
        height: 50px;
        background-color: #1a73e8;
        color: white;
        font-size: 18px;
    }
    .join div {
        padding: 0 18px 0;
        display: flex;
        justify-content: center;
    }
    .join div a{
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
    
    #btn-join:hover, #btn-loss:hover{
    	cursor: pointer;
    }
 	
 	#btn-join, #btn-loss{
 		margin: 0 3px;
 		border: none;
 		width: 100%;
 	}
 	
 	.btn-form{
 		padding-right: 0 !important;
 		padding-left: 0 !important;
 	}
 	.message{
 		color: black;
 		font-weight: bold;
 		font-size: 0.3rem;
 	}
 
 	
</style>
<script>
$(function(){
	$(document).on("click","#btn-join",function(){
		
		// 유효성검사
		// id,password가 입력되지 않았을때 경고
		let username = $("#username")
		let password = $("#password")
		let re_password = $("#re_password")
		
		if(username.val() == "") {
			alert("아이디를 입력하세요")
			username.focus()
			return false;
		}
		
		if(password.val() == "") {
			alert("비밀번호를 입력하세요")
			password.focus()
			return false;
		}
		
		if(re_password.val() == "") {
			alert("비밀번호를 확인하세요")
			re_password.focus()
			return false;
		}
		
		if(password.val() != re_password.val()){
			alert("비밀번호와 비밀번호 확인이 다릅니다")
			password.focus()
			return false;
		}
		$("form").submit()
	})
	
	// 현재 입력박스에서 포커스가 벗어났을때 발생하는 이벤트
	$(document).on("blur", "#username", function() {
		let username = $(this).val()
		if(username == ""){
			$("#m_username").text("아이디는 반드시 입력해야 합니다")
			return false;
		}
		
		$.ajax({
			url : "${rootPath}/user/idcheck",
			method : "GET",
			data: {username : username},
			success: function(result) {
				if(result == "USE"){
					$('#m_username').text("이미 가입된 사용자 이름입니다")
					$('#m_username').css("color","red")
					return false;
				}
			},
			error:function(){
				alert("서버통신오류")
			}
		})
	})
})
</script>
</head>
<body>
	<form:form method="POST" action="${rootPath}/user/join">
	<section class="join">
		<h2>회원가입</h2>
		<ul>
			<!-- 
				토큰을 담아서 보내줌
				<li><input type="text" name="${_csrf.parameterName}" value="${_csrf.token}"></li>
				form 태그를 사용하면 위와 같이 작성하지 않아도 값을 알아서 보내줌 
			-->
			<li><input id="username" name="username" placeholder="User ID"></li>
			<li><input type="password" id="password" name="password" placeholder="password"></li>
			<li><input type="password" id="re_password" name="re_password" placeholder="re_password"></li>
			<li><div class="message" id="m_username"></div></li>
		</ul>
		<div class="btn-form">
			<button type="button" id="btn-join">회원가입</button>
			<button type="button" id="btn-loss">ID/비밀번호찾기</button>
		</div>
	</section>
	</form:form>
</body>
</html>