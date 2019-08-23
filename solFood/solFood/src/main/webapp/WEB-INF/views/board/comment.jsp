<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>

<script src="../resources/js/jquery-3.3.1.min.js"></script>
<script src="../resources/bootstrap/bootstrap/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() { //페이지 로딩되면 뜨게 만듬	
		getCommentList();
	});
	
	
	function getCommentList() {
		var account_user= document.getElementsByName("account_user_login")[0].value;						// 로그인한 사람 아이디
		var board_num = document.getElementsByName("board_num")[0].value;
		
		var json = {"board_num" : board_num, "account_user":account_user};

		$.ajax({
					type : 'post',
					url : '/board/commentList', //boardControlller에 commentList
					data : json,
					// data:$("#commentForm").serialize(),				// contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
					// data:$("#board_num").serialize(),

					success : function(data) {
						var html = "";
						var commentCount = data.length;
						//console.log(data);

						if (data.length > 0) {
							/*
							for (i = 0; i < data.length; i++) {
								html += "<table class='table'><h6><strong>"
										+ data[i].account_user
										+ "</strong></h6>";
								html += data[i].reply_num + "  ";
								html += "<div class = 'media text-muted pt-3' id= 'comment"+data[i].reply_num+"'>";
								html += data[i].reply_content;
								html += "<button class='btn btn-xs btn-link' onClick= 'cm_updateForm("
										+ data[i].reply_num + ")'>수정</button>";
								html += "<button  class ='btn btn-xs btn-link' onClick= 'cm_delete("
										+ data[i].reply_num + ")'>삭제</button>";
								html += "<tr><td>";
								html += "</td></tr>";
								html += "</div>";
								html += "</table>";
							}
							*/
							
								// 영민수정
								for(var i=0; i<data.length; i++){
									if(data[i].account_user== account_user){ 		//data[i].account_user는 리플을 단 아이디, 그냥account_user는 로그인한 아이디 둘이 같으면 수정삭제가 보여진다 
										html += "<table class='table'><h6><strong>"+ data[i].account_user+ "</strong></h6>";
										html += "<div class = 'media text-muted pt-3' id= 'comment"+data[i].reply_num+"'>";
										html += data[i].reply_content;
										html += "<button class='btn btn-xs btn-link' onClick= 'cm_updateForm("
												+ data[i].reply_num + ")'>수정</button>";
										html += "<button  class ='btn btn-xs btn-link' onClick= 'cm_delete("
												+ data[i].reply_num + ")'>삭제</button>";
										html += "<tr><td>";
										html += "</td></tr>";
										html += "</div>";
										html += "</table>";
									} else {
										html += "<table class='table'><h6><strong>"+ data[i].account_user+ "</strong></h6>";
										html += data[i].reply_num+ "  ";
										html += "<div class = 'media text-muted pt-3' id= 'comment"+data[i].reply_num+"'>";
										html += data[i].reply_content;
										html += "<tr><td>";
										html += "</td></tr>";
										html += "</div>";
										html += "</table>";
									}
								}
						} else {

							html += "<div>";
							html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
							html += "</table></div>";
							html += "</div>";
						}

						$("#commentCount").html(commentCount);
						$("#commentList").html(html); // # -> id라는 뜻 

					},
					error : function(request, status, error) {
					}
				});
	}
	/*
	 * 댓글 등록하기(Ajax)
	 */

	//댓글 작성 테스트
	function cm_insert(board_num) { 
		var account_user= document.getElementsByName("account_user_login")[0].value;					
		var reply_content= document.getElementsByName("board_num")[0].value;
		
		// 삭제하기
		//alert(account_user);
		
		var json= {"account_user":account_user, "reply_content":reply_content, "board_num":board_num};

		$.ajax({
			type : 'POST', //POST방식으로 
			url : '/board/commentInsert', //url주소는 클라이언트가 HTTP요청을 보낼 서버의 주소
			data : $("#commentForm").serialize(), // 데이터 HTTP요청과 함께 서버로 보낼 데이터를 전달합니다
			success : function(data) { //HTTP요청이 성공했을때 실행할 함수를 정의
				if (data == "success") //성공하면 
				{
					getCommentList(); //리스트를 뿌려준다
					$("#reply_content").val("");//reply_content를 초기화
				}
			},
			error : function(request, status, error) {
				alert("로그인이 필요합니다 로그인부터 해주시기 바랍니다");
				//alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	//펀션으로 댓글 수정창 나오게 함
	function cm_updateForm(reply_num) {
		var html = " ";
		html = "<input type='text' width='100' name='reply_reComment"+ reply_num +"' id='reply_reComment"+ reply_num +"'>";
		html += "<button type='button' onClick='reply_updateComment("
				+ reply_num + ")'>수정</button>";
		html += "<button type='button' onClick='getCommentList()'>취소</button>";
		$("#comment" + reply_num).html(html);
	}
	//댓글 수정
	function reply_updateComment(reply_num) {
		var reply_reComment = document.getElementsByName("reply_reComment"
				+ reply_num)[0].value;
		var json = {
			"reply_num" : reply_num,
			"reply_reComment" : reply_reComment
		};

		$.ajax({
			type : 'POST',
			url : '/board/commentUpdate',
			data : json,
			
			success : function() {
				getCommentList();
				// $("#reply_content").val("");	
			},
			error : function() {
				alert("reply_reComment 실패");
			}
		});
	}

	// 댓글삭제
	function cm_delete(reply_num) {
		var json = {
			"reply_num" : reply_num
		};
		if (confirm("삭제하시겠습니까??")) {
			$.ajax({
				type : 'POST',
				url : '/board/commentDelete',
				data : json,
				success : function() {
					alert("삭제 성공");
					getCommentList();
				},
				error : function() {
					alert("삭제 실패");
				}
			});
		}
	}
</script>


<%-- =============================== top =========================================--%>

</head>
<body>
	<div class="container">
		<form id="commentForm" name="commentForm" method="post">
			 <input  type="hidden" class="form-control"
				name="account_user_login" maxlength="50" value="${login.account_user}"> 
		<%-- 	<input type="hidden" id="board_num" name="board_num"
				value="${view.board_num }" /> --%>
				
		<%-- 	<c:set var="account_user" value="${login.account_user}" /> --%>

			<br> <br>
			<div>
				<div>
					<span><strong>Comments</strong></span>
				

					댓글수 : <span id="commentCount"></span> <input type="hidden"
						id="board_num" name="board_num" value="${view.board_num}" />
				</div>
				<div>
					<table class="table">
						<tr>
							<td><textarea style="width: 1100px" rows="3" cols="30"
									id="reply_content" name="reply_content" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="cm_insert('${view.board_num}')"			
										class="btn pull-right btn-success">등록</a>
								</div></td>
						</tr>
					</table>
				</div>
			</div>
			<input type="hidden" id="board_num" name="board_num"
				value="${view.board_num }" />

		</form>
	</div>
	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList"></div>
		</form>
	</div>
</body>
</html>