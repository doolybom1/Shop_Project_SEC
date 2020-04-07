<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>나의 홈페이지</title>
<style>
	.userName{
		color: blue;
		font-weight: bold;
	}
	
	.from , .to{
		padding: 5px;
	}
		
	#message_list{
		margin: 0 auto;
		height: 30vh;
		overflow: auto;
		border-top:1px solid green;
		border-left:1px solid green;
		border-right:1px solid green;
	}
	#message{
		border-left:1px solid green;
		border-right:1px solid green;
		border-bottom: 1px solid green;
		color: white;
	}
	
	#message:hover::placeholder{
		color: white;
	}
	#message:hover{
		background-color: #007bff;
		color: white;
	}


</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


<script>
	var socket = new SockJS('http://192.168.4.12:8080/socket/chat');
	//var socket = new SockJS('http://localhost:8080/socket/chat');
	// 소켓 서버에 접속 시작
	socket.onopen = function() {
		let userName = prompt("채팅방 입장!! 이름을 입력하세요")
		if(userName && userName != ""){
			socket.send("userName:" + userName)
		}
		socket.send("getUserList:" + userName);
	};

	
	// 서버로부터 수신되는 이벤트(server -> client)
	socket.onmessage = function(e) {
		console.log('message', e.data);
		
		// 문자열형으로 수신된 json 문자열을 json 객체로 변환
		let mJson = JSON.parse(e.data)
		if(mJson.msg && mJson.msg == 'userName'){
			
			//alert(mJson.userName)
			$("#userName").val(mJson.userName)
			$("#userName").prop("readonly", true)
			return false;
		}
		
		//alert(mJson.msg)
		if(mJson.msg && mJson.msg == 'userList'){
			//alert(mJson.userList)
			let userList = JSON.parse(mJson.userList)
			
			// js코드 메서드
			// userList 객체 그룹중에서 각 요소의 키값만 추출하여 배열로 만들어 달라
			let userListKeys = Object.keys(userList)
			
			//let options = $("<option/>",{value:all,text:"전체"})
			$("#toList").empty()
			$("#toList").append(
				$("<option/>",
				{
					value:"all",
					text:"전체"
				})
			)
			
			
			for(let i = 0; i < userListKeys.length; i++){
				//console.log(userListKeys[i]);
				console.log("사용자 이름 : ", userList[userListKeys[i]].userName)
				
				$("#toList").append(
					$("<option/>",{
						value:userListKeys[i],
						text:userList[userListKeys[i]].userName
					})
				)
			}
			return false;
		}
		
		let html = "<div class='from text-right'>" 
		html += "<span class='userName'>" 
		html += mJson.userName
		html += ": </span>"
		html += mJson.message
		html += "</div>"
		
		$("#message_list").append( html + "<br/>")
		$("#message_list").scrollTop(
			$("#message_list").prop('scrollHeight')
		)
		
	};

	// 소켓 서버와 접속종료
	//sock.onclose = function() {
	//	console.log('close');
	//};
</script>
<script>
	$(function() {
		$(document).on("submit","form",function(event){
			event.preventDefault();
			//let message = $("#message").val()
			//$("#message_list").append("나 >> " + message +"<br/>")
			//socket.send(message);
			//$("message").val("")
		})
		
		$(document).on("click", "#btn_send", function(){
			
			let toUserId = $("#toList").val()
			let toUserName = $("#toList option:checked").text()
			
			let userName =$("#userName").val()
			if(userName == ""){
				alert("보내는 사람 이름을 입력하세요");
				return false;
			}
			
			// userName과 message를 묶어서 JSON 데이터로 생성
			let message = {
				userName : userName,
				toUser : toUserId,
				message : $("#message").val()
			}
			
			let html = "<div class='to'>"
			html += "<span class='userName'>"
			html += "나 : "
			html += "</span>"
			html += message.message
			html += "<span>("
			html += toUserName
			html += ")</span>"
			html += "</div>"
			
			$("#message_list").append(html)
			$("#message_list").scrollTop(
				$("#message_list").prop('scrollHeight')
			)
			
			
			// socket을 통햇 json 데이터를 보내기 위해 json형 문자열로 변환시킨 후 전송
			socket.send(JSON.stringify(message))
			$("#message").val("")
		})
		//socket.send("getUserList")
	})
</script>
</head>
<body>
	<header class="jumbotron bg-success">
		<h2 class="text-white text-center">CHAT SERVICE</h2>
	</header>
	
	<form>
	<section class="container-fluid">
		<div id="message_list">
		</div>
		<div class="form-group input_message">
			<!--  <label for="message">메시지</label>-->
			<input id="message" class="form-control" placeholder="메시지 입력">
		</div>
	</section>
	<section class="container-fluid">
		
			<div class="form-group">
				<label for="userName">FROM</label>
				<input id="userName" class="form-control" placeholder="보내는 사람">			
			</div>
			<div class="form-group">
				<label for="toList">받는사람</label>
				<select id="toList" class="form-control">
					<option value="all">전체</option>
				</select>
			</div>
			
			<button id="btn_send" class="btn btn-primary">전송</button>
	</section>
	</form>
	
</body>
</html>