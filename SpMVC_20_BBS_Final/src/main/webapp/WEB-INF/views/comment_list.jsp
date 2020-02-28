<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<c:forEach items="${CMT_LIST}" var="cmt">
	<div class="row p-2 cmt-item" data-id="${cmt.c_id}">
		<div class="col-2"><b>${cmt.c_writer}</b></div>
		<div class="col-9">${cmt.c_subject}</div>
		<div class="col-1 cmt-item-del">&times;</div>
	</div>
</c:forEach>
