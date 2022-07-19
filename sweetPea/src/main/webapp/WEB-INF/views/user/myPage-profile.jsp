<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- css -->
<link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">

<!-- js -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://fengyuanchen.github.io/cropper/js/cropper.js"></script>

<style type="text/css">
.profile-image{
width: 250px;
height: 250px;
}

/* label{
	width: 100px;
	height: 30px;
	cursor: pointer;
	text-align: center;
	display: block;
	margin: 15px auto;
	border: 1px solid gray;
	border-radius: 5px;
	background-color: #5cb85c;
	padding-top: 10px;
   
} */
input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}
body{
text-align: center;
}
table{
margin-top: 5%;
margin-left:20%;
}







.photo_box{margin:0 auto ;max-width:500px;} 
.upload_btn{overflow:hidden;width:100%;}
.upload_btn #photoBtn{display:none;}
.upload_btn .upload, .upload_btn a{float:left;width:calc(50% - 10px);text-align:center;text-decoration: none;color:#fff;padding:15px 0;}
.upload_btn .upload{background-color:steelblue;} 
.upload_btn a{margin-left:20px; background:#ccc;}
.photo_them{position:relative;margin-top:20px;width:100%;height:250px;background:#eee;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:20px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: steelblue;}
</style>
</head>
<body>


<form action="profileUpload.do" method="post" id="filefrm" enctype="multipart/form-data">
<div class="photo_box">
  <div class="upload_btn">
    <div class="upload">
    	<input type="file" name="file" accept="image/jpeg, image/png, image/gif" capture="camera" id="photoBtn"><label for="photoBtn">사진 첨부하기</label>
    </div>
  	<a href="javascript:void(0);" id="resetPhoto">다시 올리기</a>
  </div>
  <div class="photo_them">
    <div class="them_img">
    	<%-- <img id="image" src="<spring:url value = '/images/profile/${login.profile }'/>"> --%>
    	<img id="image" src=${login.profile }>
    </div>
  </div>
  <a href="javascript:void(0);" id="complete">업로드</a>
</div>
</form>

<script>
//여기 0719
const fr = new FileReader();

fr.onload = (base64) => {
  const image = new Image();

  image.src = base64.target.result;

  image.onload = (e) => { 
    const $canvas = document.createElement(`canvas`);
    const ctx = $canvas.getContext(`2d`);
   
    $canvas.width = e.target.width;
    $canvas.height = e.target.height;
    
    ctx.drawImage(e.target, 0, 0);

    // 용량이 줄어든 base64 이미지
    console.log($canvas.toDataURL(`image/jpeg`, 0.5));
    const tmp = $canvas.toDataURL(`image/jpeg`, 0.5);
  }
}
//여기 0719


$(function(){
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
    	
    	/* 
    	const maxSize = 400; //최대px 400px 기준
    	let width = image.width; //5575px
    	let height = image.height; //3923px
    	if (width > height) { 
    	    if (width > maxSize) {
    	        height *= maxSize / width;
    	        width = maxSize;
    	    }
    	} else {
    	    if (height > maxSize) {
    	        width *= maxSize / height;
    	        height = maxSize;
    	     }
    	}
    	canvas.width = width;
    	canvas.height = height;
    	canvas.getContext('2d').drawImage(image, 0, 0, width, height);
    	
    	
    	 */
    	
    	
    	
    	
    	
    	if($('input[type="file"]').val() != ""){
    	canvas = image.cropper('getCroppedCanvas',{
    		width:200,
    		height:200
    	});
    	
    	const dataUrl = canvas.toDataURL();
    	
    	
    	//console.log(dataUrl);
    	
    	
    	
    	
    	var file = document.querySelector('input[type=file]').files[0];
    	fr.readAsDataURL(file);
    	console.log('file',file);
    	
/*     	fr.readAsDataURL($('input[type="file"]').val()); */
    	
    	// 여기 0719
    	var file = document.querySelector('input[type=file]').files[0];
		fr.readAsDataURL(file);
		console.log('tmp',tmp);
		// 여기 0719
    	
    	result.attr('src',canvas.toDataURL("image/jpg"));
    	canvas.toBlob(function (blob) {
    		
    		
    		
    		
    		
    		
    		
    		/* var formData =$("#photoBtn").serialize(); */ 
    		var formData =new FormData($('#filefrm')[0]);
    		
    	//console.log("dataUrl",dataUrl);
    		  $.ajax({
    			url: 'profileUpload.do',
           		method: 'POST',
                data: {"dataUrl":tmp},
                /* processData: false,
                contentType: false, */
                success: function () {
                	alert('업로드 성공');
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
});


/* function getThumbFile(_IMG){
	  //canvas에 이미지 객체를 리사이징해서 담는 과정
	  var canvas = document.createElement("canvas");
	  canvas.width = '100px'; //리사이징하여 그릴 가로 길이
	  canvas.height ='100px'; //리사이징하여 그릴 세로 길이
	  canvas.getContext("2d").drawImage(_IMG, 0, 0, 400, 400);

	  //canvas의 dataurl를 blob(file)화 하는 과정
	  var dataURL = canvas.toDataURL("image/png"); //png => jpg 등으로 변환 가능
	  var byteString = atob(dataURI.split(',')[1]);
	  var mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
	  var ab = new ArrayBuffer(byteString.length);
	  var ia = new Uint8Array(ab);
	  for (var i = 0; i < byteString.length; i++) {
	    ia[i] = byteString.charCodeAt(i);
	  }

	  //리사이징된 file 객체
	  var tmpThumbFile = new Blob([ab], {type: mimeString});
	 
	  consol.log("tmpThumbFile:", tmpThumbFile);
	  return tmpThumbFile;
	} */
</script>


	<br><br><h3>프로필 변경</h3>
	
	<img alt="" src="${login.profile }">
	<form action="profileUpload.do" method="post" enctype="multipart/form-data">

	<table style="text-align:center;">
	<tr><td><img class="profile-image" src = "<spring:url value = '/images/profile/${login.profile }'/>" /></td>
		<td><img class="profile-image" name="newImg" id="newImg"></td></tr>
	
	
	<tr ><td colspan=2 ><input id="input_img" type="file" name="file">
		<label class="btn btn-success" for="input_img">사진 업로드</label>
		<!-- <br> -->
		<input type="submit" class="btn btn-success" id="btn" value="업로드" disabled="disabled"></td></tr>
	</table>
      
		<script>
		   $("#input_img").on("change", function(event) {
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
</body>
</html>