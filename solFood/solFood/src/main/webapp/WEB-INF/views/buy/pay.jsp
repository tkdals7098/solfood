<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="javax.servlet.http.HttpServletRequest" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>iamport pay page</title>
	
	<link href="../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="../../resources/js/jquery-3.3.1.min.js"></script>
	<script src="../../resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script>
		var totalPrice = <%= request.getParameter("totalPrice") %>; 
		var account_user = <%= request.getParameter("account_user") %>;
		var account_name= "";
		var account_email = "";
		var account_tel = "";
		var account_address = "";
		var account_postcode= "000";
		
		$(document).ready(function(){
			buyInfoList(account_user);
			iamportPay();
		});
		
		//------------------------------------------------------------------
		//	buyInfoList()--> buyInfo 불러오기
		//------------------------------------------------------------------
		function buyInfoList(account_user){		
			var json= {"account_user":account_user};
			
			$.ajax({
				type: "post",
				url: "/cart/pay2.do",
				data: json,
				success: function(data){
					var html= "";
					
					account_name= data[0].account_name;
					account_email= data[0].account_email;
					account_tel= data[0].account_tel;
					account_address= data[0].account_address;
					
					html+= "<p>이름:"+ account_name +"</p>";
					html+= "<p>이메일:"+ account_email +"</p>";
					html+= "<p>전화:"+ account_tel +"</p>";
					html+= "<p>주소:"+ account_address +"</p>";
					
					$("#buyInfo").html(html);
				},
				error: function(){
				}
			});			
		}
		
		//------------------------------------------------------------------
		//	iamportPay()--> 해당 정보로 결제 진행하기
		//------------------------------------------------------------------
		function iamportPay(){		
			var IMP = window.IMP; 
			IMP.init('imp09017184'); 	
			
			IMP.request_pay({
			    pg : 'html5_inicis', 	
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:'+ account_name,
			    amount : totalPrice,										
			    buyer_email : account_email,
			    buyer_name : account_name,
			    buyer_tel : account_tel,
			    buyer_addr : account_address,
			    buyer_postcode : account_postcode,
			    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        location.href="/buy/buy.do?account_user="+ account_user;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
			});		
		}
		
	</script>
</head>
<body>
	<h3>여기는 결제창</h3>
	가맹점 식별코드: imp09017184
	
	<%-- pay에 필요한 정보 추출 --%>
	<div id="buyInfo">
	</div>
	
</body>
</html>