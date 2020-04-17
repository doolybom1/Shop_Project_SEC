<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<style>
	section{
		margin: 10px auto;
		width: 70%;
	}

	.form-control{
		width: 100%;
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
	
	form label{
		display: inline-block;
		width: 150px;
		text-align: right;
	}
	
	.save{
		text-align: left;
	}
	
	.account{
		display: flex;
		
	}
	
</style>

<section class="container-fluid">
	<form:form modelAttribute="userVO">
		<div class="form-group">
			<form:input path="username" class="form-control" readonly="readonly"/>
		</div>
		<div class="form-group">
			<form:input path="email" class="form-control" />
		</div>
		<div class="form-group">
			<form:input path="phone" class="form-control" />
		</div>
		<div class="form-group">
			<form:input path="address" class="form-control" />
		</div>
		<div class="form-group account">
			<label for="enabled">계정활성화</label>
			<form:checkbox path="enabled" class="form-control" />
		</div>
		<div id="auth_box" class="form-group">
		<button id="auth_append" type="button">권한 정보추가</button>
		<c:if test="${not empty userVO.authorities}">
			<c:forEach items="${userVO.authorities }" var="auth">
				<input name="auth" value="${auth.authority}" class="auth form-control">
			</c:forEach>
		</c:if>
		</div>
		<div class="save">
			<button type="button" class="btn btn-danger" id="btn_save">저장</button>
		</div>
	</form:form>
</section>
