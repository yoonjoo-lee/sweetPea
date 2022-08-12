<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>

<style>
.diary-box{
	border-radius: 10px;
	box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
}
</style>
<!-- 글 -->
<div class='diary'>
	<c:forEach var="board" items='${list }'>
		<c:if test="${board.secret=='Y' && login.uidx == mini.uidx}">
			<div class='diary-box'>
				<div class='diary-date' id='bold-text'>
					<i class='bi-lock-fill'>비밀이야 </i>${board.date }<span style='float: right;'> 
					<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i> 
					<i class='bi-trash' onclick='deleteDiary(${board.mbidx })'></i></span>
				</div>
				<div class='diary-text' id='basic-text'>${board.content }</div>
			</div>
		</c:if>
		<c:if test="${board.secret!='Y'}">
			<div class='diary-box'>
				<div class='diary-date' id='bold-text'>
					${board.date }<span style='float: right;'> 
					<c:if test="${login.uidx == mini.uidx }">
					<i class='bi-pencil' onclick='modifydiary("+data[i].mbidx+","+data[i].title+","+data[i].content+")'></i> 
<%-- 					<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i>  
					<a class='bi-pencil' href='<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"'></a>--%>
					<i class='bi-trash'onclick='deleteDiary(${board.mbidx })'></i>
					</c:if>
					</span>
				</div>
				<div class='diary-text' id='basic-text'>${board.content }</div>
			</div>
		</c:if>
	</c:forEach>
</div>
<script>
/* 게시물 수정 */
function modifydiary(mbidx, title, content){
	location.href="<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+mbidx+"&title="+title+"&content="+content+"";
}

/* 게시물 삭제 */
async function deleteDiary(mbidx){
	Swal.fire({
		  title: '정말로 삭제하시겠습니까?',
		  text: "되돌릴 수 없어요!",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: '삭제'
		}).then((result) => {
		  if (result.isConfirmed) {
				location.href="<%=request.getContextPath()%>/miniroomboard2/deleteDiary.do?mbidx="+mbidx+"";
		    Swal.fire(
		      '삭제 성공!',
		      '삭제에 성공하였습니다.',
		      'success'
		    )
		  }
		})
}
</script>

