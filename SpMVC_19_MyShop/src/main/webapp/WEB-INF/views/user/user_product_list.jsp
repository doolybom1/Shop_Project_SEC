<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>
$(function() {
	$(".pro_tr").click(function() {
		let id = $(this).attr("data-id")
		document.location.href = "${rootPath}/user/product/detail/" + id
	})
})
</script>

<style>
.list-body {
	width:1200px;
	overflow: auto;
}
.list-body th{
	
	background-color:#212529; 
	color: white;
	text-align: center;
}

.pro_tr{
	background-color: #f8f9fa;
	text-align: center;
}

.pro_tr:hover{
	cursor: pointer;
	background-color: gray;
}	
.p_oprice{
	border-left: 1px solid black;
}

</style>
<table class="list-body" >
	<tr>
		<th>상품이름</th>
		<th>판매가격</th>
	</tr>
	<c:choose>
		<c:when test="${empty PRO_LIST}">
			<tr>
				<td colspan="2">상품정보가 없습니다.</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="PRO" items="${PRO_LIST}" varStatus="i">
			<tr class="pro_tr" data-id="${PRO.id}">
				<td class="p_name">${PRO.p_name}</td>
				<td class="p_oprice">${PRO.p_oprice}</td>
			</tr>		
			</c:forEach>	
		</c:otherwise>
	</c:choose>
</table>

