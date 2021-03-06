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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

<br><h4><b>????????? ??????</b></h4>
(????????? ???????????? ???????????? ???????????? ??????/?????? ????????????.)<br><br>
<form action="profileUpload.do" method="post" id="filefrm" enctype="multipart/form-data">
<div class="photo_box">
  <div class="upload_btn">
    <div class="upload">
    	<input type="file" name="file" accept="image/jpeg, image/png, image/gif" capture="camera" id="photoBtn"><label for="photoBtn">?????? ????????????</label>
    </div>
  	<a href="javascript:void(0);" id="resetPhoto">?????? ?????????</a>
  </div>
  <div class="photo_them">
    <div class="them_img">
    	<%-- <img id="image" src="<spring:url value = '/images/profile/${login.profile }'/>"> --%>
    	<img id="image" src=${login.profile }>
    </div>
  </div>
  <a href="javascript:void(0);" id="complete">?????????</a>
</div>
</form>

<script>

$(function(){
	var cropper;
    // ?????? ????????? ??????
    $('#photoBtn').on('change', function(){
        $('.them_img').empty().append('<img id="image" src="">');
        var image = $('#image');
        var imgFile = $('#photoBtn').val();
        var fileForm = /(.*?)\.(jpg|jpeg|png)$/;
		
        // ???????????? ????????? ?????? ??? ??????
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
        	alert("????????? ??????(jpg, png????????? ??????)??? ???????????????");
        	$('#photoBtn').focus();
        	return; 
        }
	});
    // ?????? ?????? ????????? ??????
    $('#resetPhoto').on('click', function(){
        if($('input[type="file"]').val() != ""){
        	$('#photoBtn').val('');
        	$('.them_img img').attr('src','').remove();
        	$('.btn_wrap a:last-child').removeClass('bg1');
        	$('input[type="file"]').click();
        }else{
        	//alert('???????????? ????????? ????????????.');
        }
    });
    // ????????? ??????
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
    	
    	
    	// ?????? 0719
    	//var file = document.querySelector('input[type=file]').files[0];
		//fr.readAsDataURL(file);
		//console.log('tmp',tmp);
		// ?????? 0719
    	
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
    					 title: '?????? ??????',
    					 position: 'top'
    					});
    					window.parent.location.href='myPage.do';
                },
                error: function () {
                	alert('????????? ??????');
                	$('.result_box').remove()
                },
    		});  
    	})
      }else{
          alert('????????? ????????? ????????????');
          $('input[type="file"]').focus();
          return;
      }
    });
});
</script>


	<%-- <br><br><h3>????????? ??????</h3>
	
	<img alt="" src="${login.profile }">
	<form action="profileUpload.do" method="post" enctype="multipart/form-data">

	<table style="text-align:center;">
	<tr><td><img class="profile-image" src = "<spring:url value = '/images/profile/${login.profile }'/>" /></td>
		<td><img class="profile-image" name="newImg" id="newImg"></td></tr>
	
	
	<tr ><td colspan=2 ><input id="input_img" type="file" name="file">
		<label class="btn btn-success" for="input_img">?????? ?????????</label>
		<!-- <br> -->
		<input type="submit" class="btn btn-success" id="btn" value="?????????" disabled="disabled"></td></tr>
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
	
	</form> --%>
	
</body>
</html>