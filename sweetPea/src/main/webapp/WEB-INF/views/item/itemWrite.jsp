<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<title>item Write</title>
<style type="text/css">
body {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}
table td {
	text-align:right;
	
}
/* .photo_box {
	margin: 0 auto;
	max-width: 500px;
} */
.upload_btn {
	overflow: hidden;
	width: 100%;
	font-weight:900; 
}

.upload_btn #photoBtn {
	display: none;
}

.upload_btn .upload, .upload_btn a {
	float: left;
	width: calc(50% - 10px);
	text-align: center;
	text-decoration: none;
	color: #fff;
	padding: 15px 0;
}

.upload_btn .upload {
	background-color: steelblue;
}

.upload_btn a {
	margin-left: 20px;
	background: #ccc;
}

/* .photo_them {
	position: relative;
	margin-top: 20px;
	width: 100%;
	height: 250px;
	background: #eee;
} */

/* .them_img, .result_box {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.result_box {
	background: #fff;
}

.them_img img, .result_box img {
	display: block;
	margin: 0 auto;
	height: 100%;
} */
/* .upload{
	width:250px;
} */
/* #photoBtn, .upload_btn {
	display: block;
	margin-top: 20px;
	padding: 15px 0;
	width: 100%;
	text-align: center;
	color: #fff;
	text-decoration: none;
	background-color: steelblue;
} */
.upload_btn input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.upload_btn label {
	color: #fff;
	background-color: #5cb85c;
	border-color: #4cae4c;
	display: inline-block;
	padding: .5em .75em;
	font-size: x-large;
	line-height: normal;
	vertical-align: middle;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* 아이템 이미지 크기 조절 */
.item-image {
}

.tagify {
	width: 100%;
	max-width: 250px;
}

/* 아이템등록 버튼  */
.btnWrite_container {
	position: absolute;
	/*  left: 0;
  right: 0;
  top: 30%; */
}

.btnWrite {
	border: none;
	display: block;
	text-align: center;
	cursor: pointer;
	text-transform: uppercase;
	outline: none;
	overflow: hidden;
	position: relative;
	color: #fff;
	font-weight: 700;
	font-size: 15px;
	background-color: #222;
	padding: 17px 60px;
	margin: 0 auto;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.20);
}

.btnWrite span {
	position: relative;
	z-index: 1;
}

.btnWrite:after {
	content: "";
	position: absolute;
	left: 0;
	top: 0;
	height: 490%;
	width: 140%;
	background: #78c7d2;
	-webkit-transition: all .5s ease-in-out;
	transition: all .5s ease-in-out;
	-webkit-transform: translateX(-98%) translateY(-25%) rotate(45deg);
	transform: translateX(-98%) translateY(-25%) rotate(45deg);
}

.btnWrite:hover:after {
	-webkit-transform: translateX(-9%) translateY(-25%) rotate(45deg);
	transform: translateX(-9%) translateY(-25%) rotate(45deg);
}

table th {
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
.item-image{
	max-width: 100%;
}
table{
	width: 100% !important;
}
th{
	font-size: 3.5vw;
}
td{
    height: 5vh;
    text-align: left !important;
}
td>input,td>select{
    height: 5vh !important;
    margin: 1vh 0;
}
#price{
	width: 80% !important;
}

.btnWrite_container {
    position: inherit;
    margin: 0 auto !important;
}
</style>
</c:if>


</head>
<body>


	<br>
	<h4>
		<b>아이템 이미지 </b>
	</h4>
	<!-- 사진 업로드 -->
	<img alt="" src="${vo.img }">
	<form name="frm" onSubmit="return false;">

		<table style="text-align: center;">
			<tr>
				<td style="text-align:center;"><img class="item-image" name="img" id="newImg" width="450" height="300"></td>
			</tr>


			<tr>
				<td colspan=2 style="width: 40vW">
					<div class="upload_btn" style="text-align:center;">
						<input type="file" name="file" accept="image/jpeg, image/png, image/gif" id="write_file"><label for="write_file">ADD </label>
					</div>
				</td>
			</tr>
		</table>
		<!-- 아이템 내용들 -->
		<table style="width: 700px;">
			<tbody>
				<tr>
					<th>아이템 이름 :</th>
					<td width="500px;"><input type="text" name="name" id="name" size="23" placeholder="아이템 이름 작성 max.15" style="width: 98%; height: 3vh;" maxlength="15" required></td>
				</tr>
				<tr>
					<td></td>
					<td width="500px;"><span id="span-itemNameCheck"></span></td>
				</tr>
				<tr>
					<th>아이템 종류 :</th>
					<td width="500px;"><select id="category" name="category" style="width: 100%; height: 3vh;">
							<c:if test="${login.pea_super == 'Y'}">
								<option value="1">미니룸</option>
							</c:if>
							<option value="3">커스텀</option>
					</select></td>

				</tr>
				<tr>
					<th>미니룸 종류 :</th>
					<td width="500px;"><select id="subcategory" name="subcategory" style="width: 100%; height: 3vh;">
							<option value="1">테마배경</option>
							<option value="2">미니룸배경</option>
							<option value="3">캐릭터</option>
							<option value="4">글꼴</option>
							<option value="5">가구</option>
					</select></td>
				</tr>
				<tr>
					<th>완두콩 :</th>
					<td width="500px;"><input type="text" name="price" id="price" size="23" placeholder="완두콩 갯수  max.99개" style="width: 94%; height: 3vh;" maxlength="2" required> 개</td>
				</tr>
				<tr>
					<th></th>
					<td width="500px;"><span id="span-price"></span></td>
				</tr>
				<!-- 해시태그 나중에 작업 -->
<!-- 				<tr>
					<th>해시태그 :</th>
					<td><input id="tag" name="tag"></td>
				</tr> -->
				<tr>
					<th>만든이</th>
					<td><input type="text" name="maker" id="maker" size="23" maxlength="10" placeholder="만든이" required></td>
				</tr>
				<tr>
					<td width="300px;"></td>
					<td><span id="span-maker"></span></td>
				</tr>
			</tbody>
		</table>
		<br> <br> <br>
		<div>
			<!-- <input type="button" value="아이템 등록" onclick=""> -->
		</div>
	</form>
	<div class="btnWrite_container" style="margin-left: 40vw;">
		<button class="btnWrite" onclick="itemWrite()">
			<span>아이템 등록</span>
		</button>
	</div>

	<script>
	
	
	/* 태그 스크립트 */
		var input = document.querySelector('input[name=tag]')

		new Tagify(input, {
		  whitelist: ['봄','여름','가을','겨울','10개','20개','30개','40개','50개'],
		  userInput: false
		})
	
	
	/* ajax로 input값 입력하기 값 확인하기  */
	/* 완두콩 가격  */
	$('#price').blur(function(){
		if($('#price').val()==""){
			$('#span-price').text('완두콩 몇개로 정할까요?');
			$('#span-price').css('color','red');
		}else{
			$('#span-price').text('이 완두콩 갯수로 등록 돼요!');
			$('#span-price').css('color','green');
			
		}
	})
	
	/* 만든이  */
	$('#maker').blur(function(){
		if($('#maker').val()==""){
			$('#span-maker').text('누가 만들었을까요?');
			$('#span-maker').css('color','red');
		}else{
			$('#span-maker').text('당신이군요!');
			$('#span-maker').css('color','green');
		}
	})
	
		/* 사진 업로드 jQuery */
		$("#write_file").on("change", function(event) {
			var file = event.target.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#newImg").attr("src", e.target.result);
				$('#btn').attr('disabled', false);
			}
			reader.readAsDataURL(file);
		});

		/* price 숫자만 넣기 */
		$('#price').on("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
		/* 만든이 한글과 영어 숫자 사용 가능 */
		$('#maker').on(
				"keyup",
				function() {
					$(this).val(
							$(this).val().replace(
									/[^0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ""));
				});

		/* 아이템 이름 중복 확인 및 ajax */
		/* 한글과 영어 숫자만 사용 가능 */
		$('#name').on(
				"keyup",
				function() {
					$(this).val(
							$(this).val().replace(
									/[^0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, ""));
				});

		$('#name').blur(function() {
			if ($('#name').val() == "") {
				$('#span-itemNameCheck').text('아이템 이름을 해볼까요?');
				$('#span-itemNameCheck').css('color', 'red');
			} else {

				/* 				alert($('#item-name').val()); */
				$.ajax({
					url : "itemNameCheck.do",
					type : "get",
					data : "name=" + $('#name').val(),
					success : function(data) {
						if (data == 1) {
							$('#span-itemNameCheck').text('중복된 아이템 이름이에요~');
							$('#span-itemNameCheck').css('color', 'red');
						} else {
							$('#span-itemNameCheck').text('사용가능한 아이템 이름이네요!');
							$('#span-itemNameCheck').css('color', 'green');
						}
					}
				});
			}
		});

		/* input태그 값이 없으면  focus  */

		function itemWrite() {
			let fm = document.frm;
			if ($('#name').val() == ""
					|| $('#span-itemNameCheck').css('color') == "rgb(255,0,0)") {
				$('#name').focus();
				$('#name').blur();
				$('#name').focus();
				return;
			} else if ($('#price').val() == ""
					|| $('#span-price').css('color') == "rgb(255,0,0)") {
				$('#price').focus();
				$('#price').blur();
				$('#price').focus();
				return;
			} else if ($('#maker').val() == ""
					|| $('#span-maker').css('color') == 'rgb(255,0,0)') {
				$('#maker').focus();
				$('#maker').blur();
				$('#maker').focus();
				return;
			}

			fm.action = "<%=request.getContextPath()%>/item/itemFile.do";
			fm.method = "post";
			fm.enctype = "multipart/form-data";
			fm.submit();
			return;
		}
	</script>







</body>
</html>











