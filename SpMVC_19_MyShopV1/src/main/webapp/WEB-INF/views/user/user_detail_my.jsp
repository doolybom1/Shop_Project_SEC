<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#img{
	width:500px;
	height: 500px;
	border:none;
}
.data-form{
	width: 1000px;
	margin: 200px 500px;
	display: flex;
}
.p-data{
	padding: 3rem;
}
.u-data{
	display: flex;
}


.p-txt{
	display:inline-block;
	width:300px;
	font-size: 30px;
	font-style: Malgun Gothic;
	font-weight:bold;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}
.btn-button{
	text-align: center;
}

.basket,.buy{
	background-color: #f2f4f7;
	border-style: none;
	font-size: 20px;
	padding: 1rem 3rem; 
}
.buy{
	background-color: red;
	color: white;
}
.catagory{
	width: 100%;
	margin-bottom: 10px;
}
.mp{
	display: flex;
	margin-bottom: 10px;
}
.minus,.plus{
	padding: 10px 1rem;
	
}
.num{
	width: 50px;
	text-align: center;
}

</style>
<html>

<body>
<article class="data-form">
	<div>
		<div id="img">${pVO.p_detail}</div>
	</div>
	<form class="u-data">
		<div class="p-data">
			<label class="p-txt">상품이름 : ${pVO.p_name}</label><br>
			<hr>
			<label class="p-txt">상품가격 : ${pVO.p_oprice}</label>
			<hr>
					
			<select class="catagory">
				<option selected="selected">관련된 물품을 선택하세요</option>
				<option>1</option>
				<option>2</option>
				<option>3</option>
			</select>	
			
			<div class="mp">
				<button class="minus">-</button>
				<input type="text" name="num" value="1" class="num"></input>
				<button class="plus">+</button>
			</div>
			
			<div class="btn-button">
				<button class="buy">구매하기</button>
				<button class="basket">장바구니</button>
			</div>	
			
		</div>
	</form>
	
</article>
</body>
</html>