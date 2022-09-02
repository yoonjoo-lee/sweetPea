<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">


<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</head>
<style>
.body {
	/* overflow-y: scroll; */
	font-family: ${myMini.font};
}
/* 사진업로드 style */
.photo_box{margin:0 auto ;max-width:500px;} 
.upload_btn{overflow:hidden;width:100%;margin-top:20px;}
.upload_btn #input_img{display:none;}
.upload_btn .upload, .upload_btn a{float:left;width:100%;text-align:center;text-decoration: none;color:#fff;padding:15px 0;}
/* .upload_btn .upload, .upload_btn a{float:left;width:calc(50% - 10px);text-align:center;text-decoration: none;color:#fff;padding:15px 0;} */
.upload_btn .upload{background-color:#007500;} 
.upload_btn a{margin-left:20px; background:#ccc;}
.photo_them{position:relative;margin-top:0px;width:100%;height:250px;background:#eee;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:0px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: #007500;}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
.photo_box{
	width: 90%;
    max-width: none;
}
.photo_them{
	height: 30vh;
}
.them_img img{
    max-width: 100%;
}
</style>
</c:if>
</head>


<body class="body">
<br><h3 style="text-align:center;">사진첩 수정하기</h3>

<form 
<c:if test="${device eq 'MOBILE'}">
action="<%=request.getContextPath()%>/miniroomboard2/photoAlbumUpload.do"
</c:if>
<c:if test="${device eq 'PC'}">
action="photoAlbumUpload.do"
</c:if>
 method="post" enctype="multipart/form-data">
<div class="photo_box">
			<input id="input_img" multiple="multiple" type="file" style="display:none;" name="file" accept="image/jpeg, image/png, image/gif"> 
	<div class="upload_btn" id="uploadButton" style="cursor:pointer">
		<div class="upload">
			<label for="input_img">사진 업로드</label>
		</div>
	</div>
	<div class="photo_them">
		<div class="them_img">
			<img class="profile-image" name="newImg" id="newImg">
		</div>
	</div>
	<div class="form-floating">
		<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="title">${vo.title }</textarea>
		<label for="floatingTextarea">제목</label>비밀글<input type="checkbox" name="secret" value="Y" style="cursor:pointer">
	</div>
	<input type="submit" class="btn btn-success" id="complete" value="업로드" disabled="disabled" style="cursor:pointer">
</div>
<input type="hidden" name="category" value=${category }>


		<script>
			$("#input_img").on("change", function(event) {
				var file = event.target.files[0];
			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#newImg").attr("src", e.target.result);
					$('#complete').attr('disabled', false);
					
				}
				reader.readAsDataURL(file);
			});
			$("#uploadButton").on("click",function(){
				$("#input_img").click();
			});
		</script>
	</form>

	
	
</body>
</html>