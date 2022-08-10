<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<style>
.body{
	overflow-y: scroll;
}
#newImg{
width: 50px;
height: 50px;
}
</style>
<body class="body">
사진첩 등록~
<br><br><h3>사진첩 등록</h3>
	
	<%-- <img alt="" src="${login.profile }"> --%>
	<form action="photoAlbumUpload.do" method="post" enctype="multipart/form-data">
	비밀글<input type="checkbox" name="secret" value="Y">
	<input id="title" name="title" placeholder="제목을 입력해 주세요">
	
	<table style="text-align:center;">
	<tr><%-- <td><img class="profile-image" src = "<spring:url value = '/images/photoAlbum/${login.profile }'/>" /></td> --%>
		<td><img class="profile-image" name="newImg" id="newImg"></td></tr>
	
	
	<tr ><td colspan=2 ><input id="input_img" multiple="multiple" type="file" name="file">
		<label class="btn btn-success" for="input_img">사진 업로드</label>
		<input type="submit" class="btn btn-success" id="btn" value="업로드" disabled="disabled"></td></tr>
	</table>
	<input type="hidden" name="category" value=${category }>
      
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