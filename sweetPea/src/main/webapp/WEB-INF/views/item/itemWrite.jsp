<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<title>item Write</title>
<style type="text/css">
body {
	text-align: center;
}

table {
	margin-left: auto;
	margin-right: auto;
}

.photo_box {
	margin: 0 auto;
	max-width: 500px;
}

.upload_btn {
	overflow: hidden;
	width: 100%;
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

.photo_them {
	position: relative;
	margin-top: 20px;
	width: 100%;
	height: 250px;
	background: #eee;
}

.them_img, .result_box {
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
}
/* .upload{
	width:250px;
} */
#photoBtn, .upload_btn {
	display: block;
	margin-top: 20px;
	padding: 15px 0;
	width: 100%;
	text-align: center;
	color: #fff;
	text-decoration: none;
	background-color: steelblue;
}

/* 아이템 이미지 크기 조절 */
.item-image {
	width: 250px;
	height: 250px;
}
</style>

</head>
<body>


	<br>
	<h4>
		<b>아이템 이미지</b>
	</h4>
	<!-- 사진 업로드 -->
	<img alt="" src="${vo.img }">
	<form name="frm" onSubmit="return false;">

		<table style="text-align: center;">
			<tr>
				<td><img class="item-image" name="img" id="newImg"></td>
			</tr>


			<tr>
				<td colspan=2><div class="upload_btn">
						<div class="upload">
							<input type="file" name="file" accept="image/jpeg, image/png, image/gif, audio/mp3, audio/wav, audio/mp4" id="photoBtn"><label for="photoBtn">아이템 파일 및 오디오</label>
						</div>
					</div></td>
			</tr>
		</table>
		<!-- 아이템 내용들 -->
		<table style="width: 700px; height: 150px;">
			<tbody>
				<tr>
					<th>아이템 이름 :</th>
					<td width="300px;"><input type="text" name="name" id="name" size="23" placeholder="아이템 이름 작성" maxlength="15"></td>
				</tr>
				<tr>
					<td width="300px;"></td>
					<td><span id="span-itemNameCheck"></span></td>
				</tr>
				<tr>
					<th>아이템 종류 :</th>
					<td><select id="category" name="category">
							<option value="1">미니룸</option>
							<option value="2">BGM</option>
							<option value="3">커스텀</option>
					</select></td>
				</tr>
				<tr>
					<th>완두콩 :</th>
					<td><input type="text" name="price" id="price" size="23" maxlength="2"> 개</td>
				</tr>
				<tr>
					<th>해시태그 :</th>
					<td><select id="tag" name="tag">
							<option value="1">미니룸</option>
							<option value="2">BGM</option>
							<option value="3">커스텀</option>
					</select></td>
				</tr>
				<tr>
					<th>만든이</th>
					<td><input type="text" name="maker" id="maker" size="23" maxlength="10" placeholder="만든이"></td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="button" id="btn" disabled="disabled" onclick="itemWrite()" value="아이템 등록">
			<!-- <input type="button" value="아이템 등록" onclick=""> -->
		</div>
	</form>

	<script>
/* 사진 업로드 jQuery */
$("#photoBtn").on("change", function(event) {
 var file = event.target.files[0];
 var reader = new FileReader(); 
 reader.onload = function(e) {
     $("#newImg").attr("src", e.target.result);
     $('#btn').attr('disabled',false);
 }
 reader.readAsDataURL(file);
 });



          /* price 숫자만 넣기 */
       $('#price').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9]/g,"") );});
          /* 만든이 한글과 영어 숫자 사용 가능 */
       $('#maker').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});

/* 아이템 이름 중복 확인 ajax */
																				/* 한글과 영어 숫자만 사용 가능 */	
	$('#name').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
		
	$('#name').blur(function(){
		if($('#name').val()==""){
			$('#span-itemNameCheck').text('아이템 이름을 입력하세요');
			$('#span-itemNameCheck').css('color','red');
		}else{
			
/* 				alert($('#item-name').val()); */
		$.ajax({
				url:"itemNameCheck.do",
				type:"get",
				data:"name="+$('#name').val(),
				success: function(data){
					if(data==1){
						$('#span-itemNameCheck').text('중복된 아이템 이름입니다.');
						$('#span-itemNameCheck').css('color','red');
					}else{
						$('#span-itemNameCheck').text('사용가능한 아이템 이름입니다.');
						$('#span-itemNameCheck').css('color','green');
					}
				}
			});
		}
	});
	
	
	function itemWrite(){
		let fm = document.frm;
		if($('#name').val == "" || $('#span-itemNameCheck').css('color')=="rgb(255,0,0)"){
				$('#name').focus();
				$('#name').blur();
				$('#name').focus();
				return;
			}else if ($('#price').val== ""){
				$('#price').focus();
				$('#price').blur();
				$('#price').focus();
				return;
			}else if ($('#maker').val==""){
				$('#maker').focus();
				$('#maker').blur();
				$('#maker').focus();
				return;
			}
			
		fm.action="<%=request.getContextPath()%>/item/itemWrite.do";
		fm.method="post";
		/* fm.enctype="multipart/form-data";  */
		fm.submit();
		return;
		}
		
	
</script>







</body>
</html>











