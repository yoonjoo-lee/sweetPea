<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>

<h3>프로필 변경하귀</h3>
<form action="changeProfile.do" method="post" enctype="multipart/form-data">
	<table style="text-align: center;">
		<tr>
			<td><img class="profile-image" name="newImg" id="newImg"></td>
		</tr>
		<tr>
			<td colspan=2><input id="input_img" type="file" name="file" accept="image/jpeg, image/png, image/gif"> <label class="btn btn-success" for="input_img">사진 업로드</label> <input type="submit" class="btn btn-success" id="btn" value="업로드" disabled="disabled"></td>
		</tr>
	</table>

	<script>
		$("#input_img").on("change", function(event) {
			var file = event.target.files[0];
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#newImg").attr("src", e.target.result);
				$('#btn').attr('disabled', false);
			}
			reader.readAsDataURL(file);
		});
	</script>
</form>
</body>
</html>