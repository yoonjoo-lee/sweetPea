<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script>
function popup(obj) {
	$(obj).css("display", "flex");
}

function closePopup(obj) {
	$(obj).css("display", "none");
}


function modalInfo() {
	$(".modal-info").css("display", "none");
}

function modalImage() {
	$(".modal-image").css("display", "none");
}

function modalClose() {
	$(".modal-subscribe").css("display", "none");
	location.reload();
}

function profileImageUpload(pageUserId, principalId) {
	
	
	if(pageUserId != principalId){
		alert("프로필 사진을 수정할 수 없는 유저입니다.");
		return;
	}
	
	$("#userProfileImageInput").click();

	
	$("#userProfileImageInput").on("change", (e) => {
		let f = e.target.files[0];

		if (!f.type.match("image.*")) {
			alert("이미지를 등록해야 합니다.");
			return;
		}
		
		// 서버에 이미지를 전송
		let profileImageForm = $("#userProfileImageForm")[0];

		
		// FormData 객체를 이용하면 form 태그의 필드와 그 값을 나타내는 일련의 key/value 쌍을 담을 수 있다.
		let formData = new FormData(profileImageForm);
		
		$.ajax({
			type: "put",
			url: `/api/user/profileImage/${principalId}`,
			data: formData,
			contentType: false, // 필수 : x-www-form-urlencoded로 파싱되는 것을 방지
			processData: false,  // 필수: contentType을 false로 줬을 때 QueryString 자동 설정됨. 해제
			enctype: "multipart/form-data",
			dataType: "text"
		}).done(res=>{
			alert(res);
			location.href = `/user/profile/${principalId}`;
		}).fail(error=>{
			alert(error.responseText);
		});


	});
}
</script>
</head>
<body>

<section class="profile">
	<!--유저정보 컨테이너-->
	<div class="profileContainer">

		<!--유저이미지-->
		<div class="profile-left">
			<div class="profile-img-wrap story-border" onclick="popup('.modal-image')">
			
				
				<form id="userProfileImageForm">
					<input type="file" name="profileImageFile" style="display: none;"
						id="userProfileImageInput" />
				</form>

				<img class="profile-image" src="<%=request.getContextPath()%>/resources/upload/1.png"
					onerror="this.src='/images/person.jpeg'" id="userProfileImage" />
					
			</div>
		</div>
		<!--유저이미지end-->

		<!--유저정보 및 사진등록 구독하기-->
		<div class="profile-right">
			<div class="name-group">
				<h2>${profileDto.name}</h2>
				
				
						<button class="cta" onclick="location.href='/image/upload'">사진등록</button>
						<button class="modi" onclick="popup('.modal-info')">
						<i class="fas fa-cog"></i>
						</button>

			</div>

			<div class="subscribe">
				<ul>
					<li><a href=""> 게시물<span></span>
					</a></li>
				</ul>
			</div>
		</div>
		<!--유저정보 및 사진등록 구독하기-->

	</div>
</section>

<!--로그아웃, 회원정보변경 모달-->
<div class="modal-info" onclick="modalInfo()">
	<div class="modal">
		<button onclick="location.href='/user/update/${principal.id}'">회원정보 변경</button>
		<button onclick="location.href='/logout'">로그아웃</button>
		<button onclick="closePopup('.modal-info')">취소</button>
	</div>
</div>
</body>
</html>