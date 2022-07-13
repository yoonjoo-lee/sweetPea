<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
	#img{
		width: 30%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4,h5{
		text-align: center;
	}
	.inputBox,.checkPwdBox{
		width: 60%;
		margin: 0 auto;
	}
	.checkPwdBox>input{
		display: block;
		width: 60%;
		height: 2em;
		margin: 0.8em auto;
		text-indent: 0.5em;
	}
	.checkPwdBox>input[type=button]{
		width: 62%;
		height: 2.5em;
		margin: 0.8em auto;
	}
	.inputIdx,.inputBox>input{
		font-size: 1em;
		width: 100%;
		height: 2em;
		border: 1px solid black;
		margin: 1em 0;
		display: block;
	}
	.inputIdx>p{
		display: inline-block;
		margin: 0.3em 0.8em;
	}
	.inputIdx>input{
		border: 0;
		padding: 0;
		height: 85%;
		width: 60%;
		font-size: 1em;
	}
	.afterCheckBox{
		display: none;
	}
</style>
<script>
	$(async function(){
		let {value:password} = await Swal.fire({
			title: '비밀번호 확인',
			  input: 'password',
			  inputLabel: '회원정보 수정을 위한 비밀번호를 입력해주세요',
			  inputPlaceholder: '비밀번호',
			  inputAttributes: {
			    maxlength: 20,
			    autocapitalize: 'off',
			    autocorrect: 'off'
			  },
			  position: 'top'
		});
		let pwd = password;
		$.ajax({
			type : 'get',
			url : "<%=request.getContextPath()%>/user/pwdCheck.do?uidx="+${login.uidx}+"&pwd="+pwd,
			success : async function (data) {
				if(data==0){
					await Swal.fire({
						  icon: 'error',
						  title: '실패',
						  text: '비밀번호가 일치하지 않습니다',
						  position: 'top'
						});
					window.location.reload();
				}else{
					$(".afterCheckBox").attr("style","display:block");
				}
			}
		});
	});
</script>
</head>
<body>
	<br><br><br>
	<div class="afterCheckBox">
		<img alt="" src="<%=request.getContextPath()%>/resources/images/camelon.png" id="img">
		<h4>회원 정보 수정</h4>
		<br>
		<div class="inputBox">
			<div class = "inputIdx">
				<p>이름 :</p>
				<input type="text" name="name" value="${vo.name}">
			</div>
			<div class = "inputIdx">
				<p>성별 :</p>
				<select name="gender" id="gender">
					<option value="">성별</option>
					<option value="M">남자</option>
					<option value="W">여자</option>
				</select>
			</div>
			<div class = "inputIdx">
				<p>생년월일 :</p>
				<input type="text" name="birth" value="${vo.birth}">
			</div>
			<div class = "inputIdx">
				<p>Phone :</p>
				<input type="text" name="phone" value="${vo.phone}">
			</div>
			<div class = "inputIdx">
				<p>이메일 :</p>
				<input type="text" name="email" value="${vo.email}">
			</div>
			<div class = "inputIdx">
				<p>주소 :</p>
				<input type="text" name="addr" id="addr" value="${vo.addr}">
			</div>
			<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
			<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		</div>
	</div>
	
	
	
	
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
</body>
</html>