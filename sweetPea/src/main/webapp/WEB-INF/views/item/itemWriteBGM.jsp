<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/@yaireo/tagify"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
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

.tagify {
	width: 100%;
	max-width: 250px;
}
</style>

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
				<td><img class="item-image" name="img" id="newImg"></td>
			</tr>


			<tr>
				<td colspan=2><div class="upload_btn">
						<div class="upload" style="width:100%;">
							<input type="file" name="file" accept="audio/mp3, audio/wav, audio/mp4" id="photoBtn"><label for="photoBtn">BGM FILE</label>
						</div>
					</div></td>
			</tr>
		</table>
		<!-- 아이템 내용들 -->
		<table style="width: 700px; height: 170px;">
			<tbody>
				<tr>
					<th width="200px">아이템 이름 :</th>
					<td width="500px;"><input type="text" name="name" id="name" size="23" placeholder="아이템 이름 작성" maxlength="15" required></td>
				</tr>
				<tr>
					<td width="200px;"></td>
					<td width="500px;"><span id="span-itemNameCheck"></span></td>
				</tr>
				<tr>
					<th width="200px;">아이템 종류 :</th>
					<td width="500px;"><select id="category" name="category">
							<option value="1">미니룸</option>
							<option value="2">BGM</option>
							<option value="3">커스텀</option>
					</select></td>
				</tr>
				<tr>
					<th width="200px;">완두콩 :</th>
					<td width="500px;"><input type="text" name="price" id="price" size="23" maxlength="2" required> 개</td>
				</tr>
				<tr>
					<td width="200px;"></td>
					<td width="500px;"><span id="span-price"></span></td>
				</tr>
				<tr>
					<th>해시태그 :</th>
					<td><input id="tag" name="tag"></td>
				</tr>
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
			<input type="button" id="btn" disabled="disabled" onclick="itemWrite()" value="아이템 등록">
			<!-- <input type="button" value="아이템 등록" onclick=""> -->
		</div>
	</form>

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
	
	/* 아이템 이름 중복 확인 및 ajax */
																					/* 한글과 영어 숫자만 사용 가능 */	
		$('#name').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
			
		$('#name').blur(function(){
			if($('#name').val()==""){
				$('#span-itemNameCheck').text('아이템 이름을 해볼까요?');
				$('#span-itemNameCheck').css('color','red');
			}else{
				
	/* 				alert($('#item-name').val()); */
			$.ajax({
					url:"itemNameCheck.do",
					type:"get",
					data:"name="+$('#name').val(),
					success: function(data){
						if(data==1){
							$('#span-itemNameCheck').text('중복된 아이템 이름이에요~');
							$('#span-itemNameCheck').css('color','red');
						}else{
							$('#span-itemNameCheck').text('사용가능한 아이템 이름이네요!');
							$('#span-itemNameCheck').css('color','green');
						}
					}
				});
			}
		});
		
		
		/* input태그 값이 없으면  focus  */
		
		function itemWrite(){
			let fm = document.frm;
			if($('#name').val() == "" || $('#span-itemNameCheck').css('color')=="rgb(255,0,0)"){
					$('#name').focus();
					$('#name').blur();
					$('#name').focus();
					return;
				}else if ($('#price').val() == ""||$('#span-price').css('color')=="rgb(255,0,0)"){
					$('#price').focus();
					$('#price').blur();
					$('#price').focus();
					return;
				}else if ($('#maker').val() ==""||$('#span-maker').css('color')=='rgb(255,0,0)'){
					$('#maker').focus();
					$('#maker').blur();
					$('#maker').focus();
					return;
				}
				
			fm.action="<%=request.getContextPath()%>/item/itemFile.do";
			fm.method = "post";
			fm.enctype = "multipart/form-data";
			fm.submit();
			return;
		}
	</script>







</body>
</html>











