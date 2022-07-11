<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/join.css" rel="stylesheet" />
<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<script>
	function join(){
		let fm = document.frm;
		if($("#id").val()== "" || $("#span-id").css("color")=="rgb(255, 0, 0)"){
			$('#id').focus();
			$('#id').blur();
			$('#id').focus();
			return;
		} else if($('#pwd').val()=="" || $("#span-pwd").css("color")=="rgb(255, 0, 0)"){
			$('#pwd').focus();
			$('#pwd').blur();
			$('#pwd').focus();
			return;
		}else if($('#pwd2').val()== "" || $('#pwd').val()!=$('#pwd2').val()){
			$('#pwd2').focus();
			$('#pwd2').blur();
			$('#pwd2').focus();
			return;
		}else if($('#name').val()=="" || $("#span-name").css("color")=="rgb(255, 0, 0)"){
			$('#name').focus();
			$('#name').blur();
			$('#name').focus();
			return;
		}else if($('#gender').val()=="" || $("#span-gender").css("color")=="rgb(255, 0, 0)"){
			$('#gender').focus();
			$('#gender').blur();
			$('#gender').focus();
			return;
		}else if($('#birth').val()=="" || $("#span-birth").css("color")=="rgb(255, 0, 0)"){
			$('#birth').focus();
			$('#birth').blur();
			$('#birth').focus();
			return;
		}else if($('#phone').val()=="" || $("#span-phone").css("color")=="rgb(255, 0, 0)"){
			$('#phone').focus();
			$('#phone').blur();
			$('#phone').focus();
			return;
		}else if($('#email').val()=="" || $("#span-email").css("color")=="rgb(255, 0, 0)"){
			$('#email').focus();
			$('#email').blur();
			$('#email').focus();
			return;
		}else if($('#addr').val()==""){
			$('#addr').focus();
			$('#addr').blur();
			$('#addr').focus();
			return;
			
		}
			fm.action = "<%=request.getContextPath()%>/user/join.do";
			fm.method = "post";
			fm.submit();
			return;
		
	}
	

</script>
</head>
<body>
<header id="header"></header>
<br><br>
<div id="joinBox">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<form name="frm" >
		<input type="text" name="id" id="id" placeholder="아이디" ><br>
		<span id="span-id"></span>
		<script type="text/javascript">
			$('#id').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z]/g,"") );});
			/* $('#id').on("keyup", function() {$(this).val( $(this).val().replace(/[ㄱ-ㅎ|ㅏ-|가-힣|!-/|:-@|[-`|{-~]/g,"") );}); */
		</script>

		<script>
			$('#id').blur(function(){
				if($('#id').val()==""){
					$('#span-id').text('아이디를 입력하세요');
					$('#span-id').css('color','red');
				}else{
					$.ajax({
						url:"idCheck.do",
						type:"get",
						data:"id="+$('#id').val(),
						success: function(data){
							if(data==1){
								$('#span-id').text('중복된 아이디입니다.');
								$('#span-id').css('color','red');
							}else{
								$('#span-id').text('사용가능한 아이디입니다.');
								$('#span-id').css('color','green');
							}
						}
					});
				}
			});
		</script>
		<br>
		<input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br>
		<span id="span-pwd"></span><br>
		<input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인"><br>
		<span id="span-pwd2"></span><br>

		<script>
			$("#pwd").blur(function(){
				if($("#pwd").val() == ""){
					$("#span-pwd").text("비밀번호를 입력하세요");
					$("#span-pwd").css("color","red");
				}else if($("#pwd").val() != $("#pwd2").val()){
					$("#span-pwd").text("비밀번호 확인필요");
					$("#span-pwd").css("color","red");			
				}else{
					$("#span-pwd").text("비밀번호 일치");
					$("#span-pwd").css("color","green");
				}
			});
			$("#pwd2").blur(function(){
				if($("#pwd2").val() == ""){
					$("#span-pwd2").text("비밀번호 확인을 입력하세요");
					$("#span-pwd2").css("color","red");
				}else if($("#pwd").val() != $("#pwd2").val()){
					$("#span-pwd").text("비밀번호 확인필요");
					$("#span-pwd").css("color","red");
					$("#span-pwd2").text("");
				}else if($("#pwd").val() == $("#pwd2").val()){
					$("#span-pwd").text("비밀번호 일치");
					$("#span-pwd").css("color","green");
					$("#span-pwd2").text("");
				}	
			});
		</script>
		<input type="text" name="name" id="name" placeholder="이름" >
		<br><span id="span-name"></span><br>
		<script type="text/javascript">
			$('#name').on("keyup", function() {$(this).val( $(this).val().replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
		</script>
		
		<select name="gender" id="gender">
			<option value="">성별</option>
			<option value="M">남자</option>
			<option value="W">여자</option>
		</select>
		<br>
		<span id="span-gender"></span>
		<script>
			$('#name').blur(function(){
				if($('#name').val()==""){
					$('#span-name').text("이름을 입력하세요.");
					$('#span-name').css('color','red');
				}else{
					$('#span-name').text("이름 입력 완료");
					$('#span-name').css('color','green');
				}
			})
		  
			$('#gender').on('change',function(){
		
				if($('#gender').val()==""){
					$('#span-gender').text("성별을 선택하세요.");
					$('#span-gender').css('color','red');
				}else{
					$('#span-gender').text("선택완료");
					$('#span-gender').css('color','green');
				}
			})
		</script>
	<!-- 	<input type="radio" name="gender" id="gender" value="M" checked>남자
		<input type="radio" name="gender" id="gender" value="F">여자 -->
		<br>
		<input type="text" name="birth" id="birth" placeholder="생년월일 (-)제외" ><br>
		<span id="span-birth"></span><br>
		<script>
			$('#birth').blur(function(){
				if($('#birth').val()==""){
					$('#span-birth').text('생년월일을 입력하세요');
					$('#span-birth').css('color','red');
				}else{
					$('#span-birth').text('입력완료');
					$('#span-birth').css('color','green');
				}
			})
			
		</script>
		<input type="tel" name="phone" id="phone" placeholder="연락처 (-)제외" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"><br>
		<span id="span-phone"></span><br>
		<script>
			$('#phone').blur(function(){
				if($('#phone').val()==""){
					$('#span-phone').text('연락처를 입력하세요');
					$('#span-phone').css('color','red');
				}else {
					$('#span-phone').text('입력완료');
					$('#span-phone').css('color','green');
				}
			})
		</script>
		<input type="text" name="email" id="email" placeholder="이메일">
		<input type="button" id="mailCheckBtn" value="인증번호 받기" ><br>
		<input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled"><br>
		<span id="span-email"></span><br>
		
		<script>
			$('#email').blur(function(){
				if($('#email').val()==""){
					$('#span-email').text('이메일을 입력하세요');
					$('#span-email').css('color','red');
				}else if($(".mail-check-input").attr('disabled')=='disabled'){
					$('#span-email').text('이메일 인증을 진행하세요');
					$('#span-email').css('color','red');
				}
			
			})
		</script>
		<!-- <input type="text" name="addr" placeholder="주소" id="addr"><input type="button" value="검색"><br>
		<span></span><br> -->
	
	
	<input type="text" id="addr" name="addr" placeholder="주소">
	<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br><br>
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3239a3373f05b6e77a023666bc916273&libraries=services"></script>
	<script>
	    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
	        mapOption = {
	            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
	            level: 5 // 지도의 확대 레벨
	        };
	
	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
	
	
	    function sample5_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수
	
	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("addr").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	                    if (status === daum.maps.services.Status.OK) {
	
	                        var result = results[0]; //첫번째 결과의 값을 활용
	
	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    }
	                });
	            }
	        }).open();
	    }
	</script>
	
		<input type="button" value="회원가입" onclick="join();" >
	</form>
</div>






<!--  -->
<!--  -->
<!--  -->
<!-- 이메일 인증 스크립트. -->
<!--  -->
<!--  -->
<!--  -->


<script type="text/javascript">
$('')



$('#mailCheckBtn').click(function() {
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
	var pjtPath = '<%= request.getContextPath()%>';
	
	$.ajax({
		type : 'get',
		url : pjtPath + '/user/mailCheck.do?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}			
	}); // end ajax
}); // end send eamil
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#span-email');
	
	if(inputCode === code){
		$resultMsg.text('인증번호가 일치합니다.');
		$resultMsg.css('color','green');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#userEamil1').attr('readonly',true);
		$('#userEamil2').attr('readonly',true);
		$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	}else{
		$resultMsg.text('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});
</script>

<br>
<footer id="footer"></footer>
</body>
</html>