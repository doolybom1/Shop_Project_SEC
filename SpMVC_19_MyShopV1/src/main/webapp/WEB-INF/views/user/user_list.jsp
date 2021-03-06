<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<script>
	$(function() {

		$(".search")
				.keypress(
						function(key) {
							if (key.keyCode == 13) {
								let a = $(this).val()

								if ($.trim(a) == "") {
									alert("문자를 입력하세요")
									return false;
								}

								alert("입력한 검색어는 : " + a)
								document.location.href = "${rootPath}/user/product/search?search="
										+ a
							}
						})

	})
</script>

<!-- Page Content -->
<div class="container">

	<!-- Jumbotron Header -->
	<header class="jumbotron my-4">
		<h1 class="display-3">클릭하고 주문하는데까지 1분</h1>
		<p class="lead">안사도 됩니다. 구경만 하고 가세요 !!</p>
		<a href="#" class="btn btn-primary btn-lg">추천상품 바로사기</a>
	</header>

	<!-- Page Features -->
	<div class="row text-center">
		<c:choose>
			<c:when test="${empty B2C_LIST}">
				<tr>
					<td colspan="6">상품 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="B2C" items="${B2C_LIST}" varStatus="i">
					<div class="col-lg-3 col-md-6 mb-4">
						<div class="card h-100">
							<img class="card-img-top" src="http://placehold.it/500x325"
								alt="상품이미지">
							<div class="card-body">
								<h4 class="card-title">${B2C.p_name}</h4>
								<div>
									<div class="B2C_LIST">
										<p><fmt:formatNumber value="${B2C.p_oprice}" type="currency"/></p>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<a href="${rootPath}/user/product/detail/${B2C.id}"
									class="btn basket btn-primary">보러만 가기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
