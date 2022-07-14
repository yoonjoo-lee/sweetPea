<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page session="true" %>
    <!-- jstl 사용하기 위해서는 아래 taglib 구문 넣어줘야함 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
		$("#reply").load("<%= request.getContextPath()%>/resources/article/reply.jsp");
	});
</script>
<style type="text/css">
#view{
	width: 60%;
	margin: 0 auto;
	margin-bottom: 15em;
}
#footer{
	width: 100%;
	bottom: 0;
	left: 0;
	position: absolute;
	
}
</style>
<body>
<header id="header"></header>
<br>
<div id="view">
<div style="border:1px solid grey">
<table class="table table-sm">
		<tbody>
			<tr>
				
				<td>
					<h3>${vo.title }</h3>
					<b>${vo.name }</b>&nbsp ${vo.datetime }
				</td>
			</tr>
			<tr  style="height:300px">
				<td >
						${vo.content}
					<%-- <textarea id="summernote" readonly>${vo.content }</textarea> --%>
				</td>
			</tr>
			
			
		</tbody>
	</table>
</div>
	<c:if test="${login.uidx eq vo.uidx }">
		<button onclick="location.href='modify.do?bidx=${vo.bidx }'">수정</button>
		<button onclick=deletecheck()>삭제</button>
	</c:if>
	<button onclick="location.href='list.do?category=${vo.category }'">목록</button>
	<div id="reply">
	
	</div>
</div>
<br>
<footer id="footer"></footer>
<script>

function deletecheck(){
	var check = confirm("정말로 삭제하시겠습니까?");	
	if (check){
		location.href="delete.do?bidx=${vo.bidx}&category=${vo.category}";
	} 
	
};
</script>
</body>
</html>