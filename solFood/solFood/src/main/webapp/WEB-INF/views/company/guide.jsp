<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SolFood</title>
<style>
	.main {
		background-color: #EAEAEA;
	}
	
	.guide1 {
		width: 350px;
		height: 350px;
		background-color: #fff;
		font-family: 맑은 고딕;
		margin: 0px 15px 0px 15px;
		border-radius: 4px;
	}
</style>
</head>
<body>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
<header>
	<%@ include file = "../module/Top.jsp" %>
</header>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Header ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
<br><br>
<div class="col-xs-2 col-xs-offset-10" style="font-size: 12px; font-weight: normal;"><a href="${path}/" style="font-family: 맑은 고딕; font-size: 15px; font-weight: bold;">홈</a>&nbsp; > &nbsp; 이용안내</div>
<div class="col-xs-12" align="center" style="font-family: 맑은 고딕; font-size: 30px; font-weight: bold;">
이용안내
</div>
<br><br><br><br><br><br>
<div class="main" align="center">
<br><br><br><br>

<div class="row" align="center">

	<div class="col-xs-4 col-xs-offset-2 guide1" align="center">
<br><br>
		<div align="left"><font size="5">&nbsp;&nbsp;&nbsp;<b>회원 / 혜택</b></font></div>
		<div class="col-xs-offset-8"><img src="../resources/image/target.png"></div>
<br><br><br>
		<div class="col-xs-offset-1" align="left" style="font-weight: normal;"><font size="3">SolFood에 회원가입 하시면<br>
		 가입 즉시 게시판 이용 및 각종 할인 쿠폰과<br>적립금, 이벤트 혜택을 받으실 수 있습니다.<br>
		 쿠폰과 적립금은 로그인 하신 후<br>마이페이지에서 확인하실 수 있습니다.</font>
		</div>
	</div>

	<div class="col-xs-4 guide1" align="center">
<br><br>
		<div align="left"><font size="5">&nbsp;&nbsp;&nbsp;<b>주문 / 결제</b></font></div>
		<div class="col-xs-offset-8"><img src="../resources/image/cart.png"></div>
<br><br><br>
		<div class="col-xs-offset-1" align="left" style="font-weight: normal;"><font size="3">상품 주문은 <br>
		 <b>장바구니에 상품 담기</b> > <b>회원 혹은 비회원 주문</b> > <br>
		 <b>주문서 작성</b> > <b>결제 방법 선택 및 결제</b> > <br>
		 <b>주문 완료</b>로 이루어집니다.</font>
		</div>
	</div>
</div>



<br><br>

<div class="row" align="center">

	<div class="col-xs-4 col-xs-offset-2 guide1" align="center">
<br><br>
		<div align="left"><font size="5">&nbsp;&nbsp;&nbsp;<b>배송</b></font></div>
		<div class="col-xs-offset-8"><img src="../resources/image/delivery-truck.png"></div>
<br><br><br>
		<div class="col-xs-offset-1" align="left" style="font-weight: normal;"><font size="3">
		 SolFood는 싱싱한 유기농 식품을<br>고객님의 식탁까지 빠르고 안전하게<br>배달하기 위해 항상 노력합니다.
		 특수 지역 배송을 받으시는 경우,<br>배송 요청사항란에 특수정보를 기입해주셔야<br>보다 신속한 배송이 가능합니다.
		 </font>
		</div>
	</div>
	
	<div class="col-xs-4 guide1" align="center">
<br><br>
		<div align="left"><font size="5">&nbsp;&nbsp;&nbsp;<b>취소 / 교환 / 환불</b></font></div>
		<div class="col-xs-offset-8"><img src="../resources/image/box-closed.png"></div>
<br><br>
		<div class="col-xs-offset-1" align="left" style="font-weight: normal;"><font size="3">
		 주문 취소는 배송 단계별로 방법이 상이합니다.<br>-[입금확인]단계:[마이페이지 > 주문내역 <br>
		 상세페이지]에서 직접 취소 가능<br>
		 -[입금확인]이후 단계:고객센터로 문의<br>
		 <br>
		 받으신 상품의 이상이 있거나 궁금한 사항이 <br>
		 있다면 언제든지 1:1 문의 게시판에 문의해주세요.
		 </font>
		</div>
	</div>	
</div>
<br><br><br><br>
</div>


<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
<footer>
	<%@ include file = "../module/Bottom.jsp" %>
</footer>
<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ Footer ■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■-->
</body>
</html>