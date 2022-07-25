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

#complete {
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
	<img alt="" src="">
	<form action="profileUpload.do" method="post" enctype="multipart/form-data">

		<table style="text-align: center;">
			<tr>
				<td><img class="item-image" name="newImg" id="newImg"></td>
			</tr>


			<tr>
				<td colspan=2><div class="upload_btn">
						<div class="upload">
							<input type="file" name="file" accept="image/jpeg, image/png, image/gif" id="photoBtn"><label for="photoBtn">사진 첨부하기</label>
						</div>
					</div> <!-- <a href="javascript:void(0);" id="complete">업로드</a> --></td>
			</tr>
		</table>

		<script>
	   $("#photoBtn").on("change", function(event) {
	    var file = event.target.files[0];
	    var reader = new FileReader(); 
	    reader.onload = function(e) {
	        $("#newImg").attr("src", e.target.result);
	        $('#btn').attr('disabled',false);
	    }
	    reader.readAsDataURL(file);
	    });
	   

	</script>
	</form>

	<form action="">
		<table style="width: 700px; height: 150px;">
			<tbody>
				<tr>
					<th>아이템 이름 :</th>
					<td width="300px;"><input type="text" name="item-name" id="item-name" size="23" placeholder="아이템 이름 작성" maxlength="15"><span id="span-itemNameCheck"></span></td>
					<script>
																							/* 한글과 영어 숫자만 사용 가능 */	
						$('#item-name').on("keyup", function() {$(this).val( $(this).val().replace(/[^0-9|a-z|ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,"") );});
							
						$('#item-name').blur(function(){
							if($('#item-name').val()==""){
								$('#span-itemNameCheck').text('아이템 이름을 입력하세요');
								$('#span-itemNameCheck').css('color','red');
							}else{
								
			/* 				alert($('#item-name').val()); */
							$.ajax({
									url:"itemNameCheck.do",
									type:"get",
									data:"name="+$('#item-name').val(),
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
					</script>
					<th>아이템 종류 :</th>
					<td><select id="item-category" name="item-category">
							<option value="MNR">미니룸</option>
							<option value="BGM">BGM</option>
							<option value="CTM">커스텀</option>
					</select></td>
				</tr>
				<tr>
					<th>상품가격 :</th>
					<td><input type="number" name="item-price" id="item-price" size="23"> 원</td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="button" value="아이템 등록" onclick="">
		</div>
	</form>



	<script>






/* $(function(){
	var cropper;
    // 사진 업로드 버튼
    $('#photoBtn').on('change', function(){
        $('.them_img').empty().append('<img id="image" src="">');
        var image = $('#image');
        var imgFile = $('#photoBtn').val();
        var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
		
        // 이미지가 확장자 확인 후 노출
        if(imgFile.match(fileForm)) {
        	var reader = new FileReader(); 
        	reader.onload = function(event) { 
        		image.attr("src", event.target.result);
        		cropper = image.cropper( {
        			dragMode: 'move',
        			viewMode:1,
        			aspectRatio: 1,
        			autoCropArea:0.9,
        			minCropBoxWidth:200,
       				restore: false,
                    guides: false,
                    center: false,
                    highlight: false,
                    cropBoxMovable: false,
                    cropBoxResizable: false,
                    toggleDragModeOnDblclick: false
                });
            }; 
        	reader.readAsDataURL(event.target.files[0]);
        } else{
        	alert("이미지 파일(jpg, png형식의 파일)만 올려주세요");
        	$('#photoBtn').focus();
        	return; 
        }
	});
    // 사진 다시 올리기 버튼
    $('#resetPhoto').on('click', function(){
        if($('input[type="file"]').val() != ""){
        	$('#photoBtn').val('');
        	$('.them_img img').attr('src','').remove();
        	$('.btn_wrap a:last-child').removeClass('bg1');
        	$('input[type="file"]').click();
        }else{
        	//alert('업로드된 사진이 없습니다.');
        }
    });
    // 업로드 버튼
    $('#complete').on('click', function(){
    	$('.them_img').append('<div class="result_box"><img name="file" id="result" src=""></div>');
    	var image = $('#image');
    	var result = $('#result');
    	var canvas;
    	
    	if($('input[type="file"]').val() != ""){
    	canvas = image.cropper('getCroppedCanvas',{
    		width:200,
    		height:200
    	});
    	
    	const dataUrl = canvas.toDataURL(`image/jpeg`, 0.5);
    	
    	console.log("dataUrl:",dataUrl);
    	
    	
    	// 여기 0719
    	//var file = document.querySelector('input[type=file]').files[0];
		//fr.readAsDataURL(file);
		//console.log('tmp',tmp);
		// 여기 0719
    	
    	result.attr('src',canvas.toDataURL("image/jpg"));
    	canvas.toBlob(function (blob) {
    		
    		/* var formData =$("#photoBtn").serialize(); */ 
    		var formData =new FormData($('#filefrm')[0]);
    		
    		  $.ajax({
    			url: 'profileUpload.do',
           		method: 'POST',
                data: {"dataUrl":dataUrl},
                /* processData: false,
                contentType: false, */
                success: async function () {
   					await Swal.fire({
    					 icon: 'success',
    					 title: '변경 완료',
    					 position: 'top'
    					});
    					window.parent.location.href='myPage.do';
                },
                error: function () {
                	alert('업로드 실패');
                	$('.result_box').remove()
                },
    		});  
    	})
      }else{
          alert('사진을 업로드 해주세요');
          $('input[type="file"]').focus();
          return;
      }
    });
}); */
</script>

</body>
</html>