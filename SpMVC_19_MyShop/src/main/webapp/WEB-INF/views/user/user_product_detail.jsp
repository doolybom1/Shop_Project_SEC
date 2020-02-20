<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

#img{
	width:500px;
	height: 500px;
	background-color: gray;
}
.data-form{
	margin: 200px 500px;
	display: flex;
}
u-data{
	display: block;
}

.p-data{
	display: block;
}

</style>
<html>

<body>
<article class="data-form">
	<div>
		<img id="img">
	</div>
	<form class="u-data">
		<div class="p-data">
			${pVO.p_name}
			${pVO.p_oprice}	
		</div>
	</form>
</article>
</body>
</html>