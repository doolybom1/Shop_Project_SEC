<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 홈페이지</title>
</head>
<body>
<h3>학생 점수</h3>
<hr>

<form action="/app/number/score_input" method="post">
	<label>국어 </label><input name="ko" placeholder="국어점수" value="<c:out value="${scoreVO.ko}" default="0"/>"><br>
	<label>영어 </label><input name="en" placeholder="영어점수" value="<c:out value="${scoreVO.en}" default="0"/>"><br>
	<label>수학 </label><input name="ma" placeholder="수학점수" value="<c:out value="${scoreVO.ma}" default="0"/>"><br>
	<label>과학 </label><input name="sc" placeholder="과학점수" value="<c:out value="${scoreVO.sc}" default="0"/>"><br>
	<label>음악 </label><input name="mu" placeholder="음악점수" value="<c:out value="${scoreVO.mu}" default="0"/>"><br>
	<button>계산</button>
</form>
<hr>
<div><b>총점 :</b>${scoreVO.sum}</div>
<div><b>평균 :</b>${scoreVO.avg}</div>

</body>
</html>