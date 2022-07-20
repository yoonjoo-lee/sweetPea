<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.3.3.min.js" type="application/javascript"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<input type="hidden" id="item_name">
<c:if test="${price == 100}">
	<script>
		$("#item_name").val('완두콩1개');
	</script>
</c:if>
<c:if test="${price == 1000}">
	<script>
		$("#item_name").val('완두콩10개');
	</script>
</c:if>
<c:if test="${price == 3000}">
	<script>
		$("#item_name").val('완두콩30개');
	</script>
</c:if>
<c:if test="${price == 5000}">
	<script>
		$("#item_name").val('완두콩50개');
	</script>
</c:if>
<c:if test="${price == 10000}">
	<script>
		$("#item_name").val('완두콩100개');
	</script>
</c:if>
<c:if test="${price == 20000}">
	<script>
		$("#item_name").val('완두콩200개');
	</script>
</c:if>
<c:if test="${price == 30000}">
	<script>
		$("#item_name").val('완두콩300개');
	</script>
</c:if>
<c:if test="${price == 50000}">
	<script>
		$("#item_name").val('완두콩500개');
	</script>
</c:if>
<c:if test="${price == 70000}">
	<script>
		$("#item_name").val('완두콩700개');
	</script>
</c:if>
<c:if test="${price == 100000}">
	<script>
		$("#item_name").val('완두콩1000개');
	</script>
</c:if>
<script>
var $name = $("#item_name").val();

BootPay.request({
	price: ${price}, 
	application_id: "62d74a86e38c3000215afd75",
	name: $name, 
	pg: 'inicis',
	method: '', 
	show_agree_window: 0, 
	items: [
		{
			item_name: '완두콩10개', 
			qty: 1, 
			unique: '123', 
			price: 1000,

		}
	],
	user_info: {
		username: 'uidx',
		email: 'beomjun12@naver.com',
		addr: 'addr',
		phone: '010-1234-4567'
	},
	order_id: 'id', 
	params: {callback1: '1', callback2: '2', customvar1234: ''},
	account_expire_at: '2022-07-20', 
	extra: {
	    start_at: '2022-07-20', 
		end_at: '2025-07-20', 
        vbank_result: 1, 
        quota: '0,2,3', 
		theme: 'purple', 
		custom_background: '#00a086', 
		custom_font_color: '#ffffff' 
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
		BootPay.transactionConfirm(data); 
	} else {
		BootPay.removePaymentWindow(); 
	}
}).close(function (data) {
    console.log(data);
}).done(function (data) {
	console.log(data);
});
</script>  