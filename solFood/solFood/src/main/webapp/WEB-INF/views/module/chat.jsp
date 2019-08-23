<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="../resources/js/sockjs.min.js"/></script>
<script type="text/javascript">

	var sock;

	$(document).ready(function() {
		
		sock = new SockJS("/echo");

		sock.onopen = function(){
			sock.send("SolFood 채팅방 입니다."+"<br/>"+" (주의) 페이지 이동 시 채팅방이 초기화 됩니다."+"<br/>");
		}
		
		sock.onmessage = function(evt){
			//alert(evt.data);
			$("#chatMessage").append(evt.data + "<br/>");
		}

		sock.onclose = function(){
			sock.send("사용자 퇴장");
		}
		
		$("#change").hide();
		
		 //키를 누를떄
        $("#message").keydown(function(key) {
            //해당하는 키가 엔터키(13) 일떄
            if(key.keyCode == 13) {
                //msg_process를 클릭해준다.
                sendMessage.click();
            }
        });
        //sendMessage를 클릭할 때
        $("#sendMessage").click(function() {
           if($("#nick").val() == "") {
				alert("닉네임을 먼저 설정해주세요.")
               }
           if($("#message").val() != "") {
				sock.send($("#nick").val() + " : " + $("#message").val());
				$("#nick").attr("disabled",true);
				$("#change").show();
				$("#message").val("");
           }
        });
   
        $("#change").click(function() {
			$("#nick").removeAttr("disabled");
			$("#change").hide();
        });
	});

</script>
<style>
	#chatMessage {
		background-color: #fff;
		border-radius: 4px;
	}
	#change{
		background-color: #fff;
	}
	#sendMessage{
		background-color: #fff;
	}
	#chatClose {
		background-color: #fff;
		border-radius: 5px;
	}
</style>
</head>
<body>
	<div align="right">
	<button id="chat" style="background-color: rgba(255,255,255, 0); border: 0; outline: 0;"><img src="../resources/image/chat.png"><br>채팅하기</button>
	</div>
		<div class="chatArea" align="center" style="width: 200px; height: 300px; font-size: 11px; border: 2px solid; border-radius: 5px; background-color: #F6F6F6; border-color: #747474;">
			<div id="chatMessage" align="left" style="overFlow: auto; width: 180px; height: 150px; max-height: 150px; border: 1px solid; margin: 10px 0px 10px 0px;"></div>
			닉네임 : <input type="text" id="nick" style="width: 80px;">
			<input type="button" id="change" value="변경"/><br>
			내용 입력 : <input type="text" id="message"/>
			<input type="button" id="sendMessage" style="margin: 5px;" value="전송"/>
			<div align="right" style="margin: 3px 5px 0px 0px;"><input type="button" id="chatClose" value="채팅방 닫기"/></div>
		</div>
	<script>
		$(document).ready(function(){
			$(".chatArea").hide();
		});
		$("#chat").click(function(){
			$(".chatArea").show();
			$("#chat").hide();
		});
		$("#chatClose").click(function(){
			$(".chatArea").hide();
			$("#chat").show();
		});
	</script>
	
	<!-- test -->
	
	
</body>
</html>
