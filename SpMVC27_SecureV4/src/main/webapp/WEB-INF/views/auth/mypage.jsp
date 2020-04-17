<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf" %>
<script>
$(function() {
	$("input").prop("readonly", true)
	
	$(document).on("click", "#btn_update",function(){
		let pass = $("#password").val() 
		if( pass == ""){
			alert("수정하려면 비밀번호를 입력후 \n" +"다시 수정 버튼을 클릭하세요")
			$("div.password").css("display","block")
			$("#password").prop("readonly",false)
			$("#password").focus()
			return false;
		}
		if(pass != ""){
			
			$.ajax({
				url: '${rootPath}/user/password',
				method: 'POST',
				data: {
					password:pass,
					"${_csrf.parameterName}" : "${_csrf.token}"
				},
				success: function(result) {
					if(result == "PASS_OK"){
						$("input").prop("readonly",false)
						$("input").css("color","blue")
						$("button#btn_save").prop("disabled",false)
						$("button#btn_update").prop("disabled",true)
					}else{
						alert("비밀번호가 일치하지 않습니다")
					}
				},
				error:function(){
					alert("서버통신오류")
				}
			})
		}
	})
})

</script>
<style>
	section{
		position: fixed;
		top: 70px;
		left: 0;
		width: 100%;
		text-align: center;
	}
	.form-control{
		width: 500px;
		margin: 0 auto;
	}
	
	form{
		width:100%;
		
	}
	form div.password{
		display: none;	
	}
	
	form input.auth{
		display: block;
		margin: 0 auto;
	}
	
</style>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/include/include-nav.jspf" %>
	<section class="container-fluid">
		<form:form modelAttribute="userVO">
			<div class="form-group">
				<form:input path="username" class="form-control"/>
			</div>
			<div class="password form-group">
				<input id="password" type="password" placeholder="비밀번호 입력 .." class="form-control"/>
			</div>
			<div class="form-group">
				<form:input path="email" class="form-control" placeholder="E-mail" />
			</div>
			<div class="form-group">
				<form:input path="phone" class="form-control" placeholder="전화번호"/>
			</div>
			<div class="form-group">
				<form:input path="address" class="form-control" placeholder="주소"/>
			</div>
			
			<div>
				<button type="button" class="btn btn-primary" id="btn_update">수정</button>
				<button type="submit" class="btn btn-danger" id="btn_save" disabled="disabled">저장</button>
				<button type="button" class="btn btn-dark" id="btn_loss_pass">비밀번호 찾기</button>
			</div>
		</form:form>
	</section>
</body>
</html>