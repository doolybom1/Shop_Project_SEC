<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" 
			prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  
			prefix="sec"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>			

	<style>
		section{
			margin:10px auto;
			width:70%;
		}
		
		form {
			width:100%;
			margin:10px auto;
		}
		
	
		
		form input.auth {
			display: block;
		}
		
		#info-form{
			width: 600px;
		}

	</style>
<section>
	<form:form modelAttribute="userVO" id="info-form">
	<div class="form-group input-group-prepend">
		<span class="input-group-text btn-outline-primary">UserName</span>
		<form:input path="username" readonly="true" class="form-control "/>
	</div>

	<div class="form-group input-group-prepend">
		<span class="input-group-text btn-outline-primary">Email</span>
		<form:input path="email" class="form-control"/>
	</div>
	<div class="form-group input-group-prepend">
		<span class="input-group-text btn-outline-primary">Phone</span>
		<form:input path="phone" class="form-control"/>
	</div>
	<div class="form-group input-group-prepend">
		<span class="input-group-text btn-outline-primary">address</span>
		<form:input path="address" class="form-control"/>
	</div>
	<div class="form-group input-group-prepend">
		<span class="input-group-text btn-outline-primary">계정활성화</span>
		<form:checkbox path="enabled" class="form-control"/>
	</div>

	<div id="auth_box" class="form-group">
	<button id="auth_append" type="button" class="btn btn-primary mb-1">권한 정보 입력 추가</button>
	<c:if test="${not empty userVO.authorities}">
		<c:forEach items="${userVO.authorities}" var="auth">
			<input name="auth" 
					value="${auth.authority}" 
					class="auth form-control">
		</c:forEach>
	</c:if>
	</div>
	<div>
		<button type="button" id="btn_save" class="btn btn-primary">저장</button>
	</div>
	</form:form>
</section>





