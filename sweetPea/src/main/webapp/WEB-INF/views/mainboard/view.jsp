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
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<body>
<header id="header"></header>
<table border="1">
		<tbody>
			<tr>
				<td>
					제목
				</td>
				<td>
					${vo.title }
				</td>
			</tr>
			<tr>
				<td>
					내용
				</td>
				<td>
					${vo.content }
				</td>
			</tr>
			<tr>
				<td>
					작성자
				</td>
				<td>
					${vo.name }
				</td>
			</tr>
			<tr>
				<td>
					작성일
				</td>
				<td>
					${vo.datetime }
				</td>
			</tr>
			
		</tbody>
	</table>
	<c:if test="${login.uidx eq vo.uidx }">
		<button>수정</button>
		<button>삭제</button>
	</c:if>
	<button onclick="location.href='login.do'">목록</button>
</body>
</html>