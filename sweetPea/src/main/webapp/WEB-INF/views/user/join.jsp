<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/join.css" rel="stylesheet" />
<link href="<%=request.getContextPath()%>/resources/css/nav.css" rel="stylesheet"/>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(function(){
		$("#header").load("<%=request.getContextPath()%>/resources/article/header.jsp");
		$("#footer").load("<%=request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<script>
	function join(){
		let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		let fm = document.frm;
		if($("#id").val()== "" || $("#span-id").css("color")=="rgb(255, 0, 0)"){
			$('#id').focus();
			$('#id').blur();
			$('#id').focus();
			return;
		} else if(!check.test($('#pwd').val())){
			$('#pwd').focus();
			$('#pwd').blur();
			$('#pwd').focus();
			return;
		}else if(!check.test($('#pwd').val())||$('#pwd').val()!=$('#pwd2').val()){
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
		}else if($('#address').val()==""){
			$('#address').focus();
			$('#address').blur();
			$('#address').focus();
			return ;
			
		} else if ($('#detailAddr').val()==""){
			$('#detailAddr').focus();
			$('#detailAddr').blur();
			$('#detailAddr').focus();
			return ;
			
		} else {
			var address = $("#address").val();
			var detailAddr = $('#detailAddr').val();
			var addr = address + ""+ detailAddr;
			$('#addr').val(addr);
		}
			
			fm.action = "<%=request.getContextPath()%>/user/join.do";
			fm.method = "post";
			fm.submit();
			return;
		
	}
	

</script>
<style type="text/css">
#view{
	width: 1300px;
	margin: 0 auto;
	margin-bottom: 220px;
}
</style>

<c:if test="${device eq 'MOBILE' }">
<style>
#view{
	width: 100% !important;
}
#joinBox{
	width: 92% !important;
	margin: 0 auto;
}
</style>

</c:if>

</head>
<body>
<header id="header"></header>
<br>
<br>
<div id="view">
<div id="joinBox">
	<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
	<form name="frm">
		<input type="text" name="id" id="id" placeholder="아이디" maxlength="16"><br> <span id="span-id"></span>
		<script>
	/* 영어랑 숫자만. */
		$('#id').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z]/g,"") );});
			
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
		<br> <input type="password" name="pwd" id="pwd" placeholder="비밀번호"><br> <span id="span-pwd"></span><br> <input type="password" name="pwd2" id="pwd2" placeholder="비밀번호 확인"><br> <span id="span-pwd2"></span><br>
		<script>
			let check = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,16}$/;
		$("#pwd").blur(function(){
			if(!check.test($('#pwd').val())||$("#pwd").val() == ""){
				$("#span-pwd").text("8-16자,영문 소문자, 숫자, 특수문자를 사용하세요.");
				$("#span-pwd").css("color","red");
			}else if(!check.test($('#pwd').val())||$("#pwd").val() != $("#pwd2").val()){
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
			}else if(check.test($('#pwd').val())&&$("#pwd").val() == $("#pwd2").val()){
				$("#span-pwd").text("비밀번호 일치");
				$("#span-pwd").css("color","green");
				$("#span-pwd2").text("");
			}	
		});
	</script>

		<input type="text" name="name" id="name" placeholder="이름" maxlength="6"><br> <span id="span-name"></span><br>
		<script type="text/javascript">
	/* 한글만  */
		$('#name').on("keyup", function() {$(this).val( $(this).val().replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
	</script>

		<select name="gender" id="gender">
			<option value="">성별</option>
			<option value="M">남자</option>
			<option value="W">여자</option>
		</select> <br> <span id="span-gender"></span>
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
		<br> <input type="text" name="birth" id="birth" placeholder="생년월일 (-)제외" maxlength="8"><br> <span id="span-birth"></span><br>
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
		<input type="tel" name="phone" id="phone" placeholder="연락처 (-)제외" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11"><br> <span id="span-phone"></span><br>
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
		<input type="text" name="email" id="email" placeholder="이메일"> <input type="button" id="mailCheckBtn" value="인증번호 받기" ><br> <input class="mail-check-input" placeholder="인증번호를 입력하세요." disabled="disabled"><br> <span id="span-email"></span><br>

		<script>
		$('#email').blur(function(){
			if($('#email').val()==""){
				$('#span-email').text('이메일을 입력하세요');
				$('#span-email').css('color','red');
				$('#mailCheckBtn').attr('disabled',true);
			}else if($('#email').val()!=""){
				$('#mailCheckBtn').attr('disabled',false);
			}
				
			}else if($(".mail-check-input").attr('disabled')=='disabled'){
				$('#span-email').text('이메일 인증을 진행하세요');
				$('#span-email').css('color','red');
			}
		
		})
	</script>
		<!-- <input type="text" name="addr" placeholder="주소" id="addr"><input type="button" value="검색"><br>
	<span></span><br> -->


		<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
		<input type="text" id="address" placeholder="주소" readonly>
		<input type="text" id="detailAddr" name="detailAddr" placeholder="상세주소">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
		<span id="span-address"></span>
		<br>
		<input type="hidden" name="addr" id="addr" >
	<script>
		$('#address').blur(function(){
			if($('#address').val()==""){
				$('#span-address').text('주소를 입력하세요');
				$('#span-address').css('color','red');
			}else {
				$('#span-address').text("주소입력 확인");
				$('#span-address').css('color','green');
			}
		})
		
		$('#detailAddr').blur(function(){
			if($('#detailAddr').val()==""){
				$('#span-address').text('상세주소를 입력하세요');
				$('#span-address').css('color','red');
			}else {
				$('#span-address').text("상세주소입력 확인");
				$('#span-address').css('color','green');
			}
		})
		
	</script>




<!-- 지도 API -->
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
                document.getElementById("address").value = addr;
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

		<input type="button" value="회원가입" onclick="join();">
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

$('#mailCheckBtn').click(function() {
	var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;	// 이메일 형식체크
	
	const email = $('#email').val(); // 이메일 주소값 얻어오기!
	if (!reg_email.test(email)){
		$('#email').focus();
		Swal.fire({
		      text: '이메일 형식을 지켜주세요.',
		      icon: 'error',
	    });
	}else{
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		var pjtPath = '<%=request.getContextPath()%>';
		Swal.fire({
		      text: '인증번호 전송중...',
		      didOpen: () => {
		    	    Swal.showLoading()
	  	  },
	  	backdrop: false
	  	});
		$.ajax({
			type : 'get',
			url : pjtPath + '/user/mailCheck.do?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : async function (data) {
				checkInput.attr('disabled',false);
				code =data;
				await Swal.fire({
				      text: '인증번호가 전송되었습니다.',
				      icon: 'success',
			    });
			}			
		}); // end ajax
	}
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
</div>
<br>
<footer id="footer"></footer>
</body>
</html>