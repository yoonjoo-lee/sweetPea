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
</style>
</head>
<body>
	<br><br><h3>프로필 변경</h3>
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