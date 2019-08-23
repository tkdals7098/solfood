<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pay</title>
<meta name="bootpay-application-id" content="[5d19ae1db6d49c3e5dbf2a80]">
<script type="text/javascript" src="http://code.jquery,com/jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://cdn.bootpay.co.kr/js/bootpay-1.12.min.js"></script>


<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>


<script>
function buyBtnclick(){
	

BootPay.request({
	price: '1000',
	application_id: "5d19ae1db6d49c3e5dbf2a80",
	name: '블링블링 마스카라',
	pg: '',
	method: '',.
	show_agree_window: 0, 
	items: [
		{
			item_name: '나는 아이템', 
			qty: 1, 
			unique: '123', 
			price: 1000, 
			cat1: 'TOP', 
			cat2: '티셔츠', 
			cat3: '라운드 티', 
		}
	],
	user_info: {
		username: '사용자 이름',
		email: '사용자 이메일',
		addr: '사용자 주소',
		phone: '010-1234-4567'
	},
	order_id: '고유order_id_1234', 
	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	account_expire_at: '2018-05-25',
	extra: {
	    start_at: '2019-05-10',
		end_at: '2022-05-10',
        vbank_result: 1, 
        quota: '0,2,3'
	}
}).error(function (data) {
	
	console.log(data);
}).cancel(function (data) {
	
	console.log(data);
}).ready(function (data) {
	
	console.log(data);
}).confirm(function (data) {
	
	console.log(data);
	var enable = true; 
	if (enable) {
		this.transactionConfirm(data);
	} else {
		this.removePaymentWindow();
	}
}).close(function (data) {
   
    console.log(data);
}).done(function (data) {
	
	console.log(data);
});

}
</script>
</head>

<body>

</body>
</html>