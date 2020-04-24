<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/include-head.jspf"%>
<style>

#body {
	position: fixed;
	top: 60px;
	left: 0;
	width: 100%;
	height: 100%;
	display: flex;
}

#body menu {
	margin: 5px;
}

#body menu li {
	list-style: none;
}

#body menu li a {
	display: inline-block;
	padding: 5px 10px;
	text-decoration: none;
	width: 80%;
	margin-left: 10px;
	border-bottom: 2px solid transparent;
}

#body menu li a:hover {
	border-bottom: 2px solid blue;
	transition: ease 0.3s;
}

#body article {
	flex: 3;
	margin: 5px;
}

body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}


</style>

</head>
<script>
$(function(){
	$(document).on("click","#user_list",function(){
		$.get("${rootPath}/admin/user_list",function(result){
			$("#admin_content").html(result)
		})
	})
	
	$(document).on("click","tr.tr_user",function(){
		let username = $(this).data("id")
		$.get("${rootPath}/admin/user_detail_view/" + username, 
				function(result){
			$("#admin_content").html(result)
		})
	})
	$(document).on("click","button#btn_save",function(){
		
		let formdata = $("form").serialize()
		$.post("${rootPath}/admin/user_detail_view",formdata,
				function(result){
			$("#admin_content").html(result)
			alert("Update 성공!!")
		})
	
	})
	// $("#auth_append").click();
	$(document).on("click","#auth_append",function(){
			let auth_input = $("<input/>",
					{class:"auth form-control",name:"auth"})
			// auth_input.append($("<p/>",
			//		{text:'제거',class:'auth_delete'}))		
			$("div#auth_box").append(auth_input)
	})
})
</script>
</head>
<body>
	<script>
			function openNav() {
			  document.getElementById("mySidenav").style.width = "200px";
			}
			
			function closeNav() {
			  document.getElementById("mySidenav").style.width = "0";
			}
	</script>
	<%@ include file="/WEB-INF/views/include/include-nav.jspf"%>
	<section id="body">
		<menu id="menu">
			<div id="mySidenav" class="sidenav">
			  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
			  <a href="javascript:void(0)" id="user_list">User List</a>
			  <a href="#">메뉴1</a>
			  <a href="#">메뉴2</a>
			</div>
			<span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776; 관리자페이지</span>
		</menu>
		<article id="admin_content"></article>
	</section>
</body>
</html>





