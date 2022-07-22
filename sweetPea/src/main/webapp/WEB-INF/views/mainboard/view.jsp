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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
/* tabla{
	border-radius: 10px;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
} */
.viewDiv{
	height: 400px;
	border-radius: 10px;
	box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
}
.titleDiv{
	padding: 20px;
}
.nameDiv{
	font-size: 15px;
	color: grey;
}
.contentDiv{
	padding-left: 20px;
}
</style>
<body>
<header id="header"></header>
<br>
<div id="view">

<c:if test="${vo.category!=6}">
<div class="viewDiv">
<div class="titleDiv"><h3>${vo.title }</h3>
<div class="nameDiv">
  <a class="btn btn-info btn-sm dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
    ${vo.name }
  </a>
  <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
    <li><a class="dropdown-item" onclick="openMini()">미니홈피</a></li>
    <li><a class="dropdown-item" href="#">선물하기</a></li>
  </ul>
&nbsp ${vo.datetime }</div>
</div>

<div class="contentDiv">${vo.content}</div>
</div>
</c:if>

<c:if test="${vo.category==6}">
	<c:if test="${vo.reply!=1 }">
		<h6>신고 처리가 완료된 건입니다.</h6	>
	</c:if>
	<div class="viewDiv">
	<div class="titleDiv"><h3>${vo.title }</h3>
	<div class="nameDiv"><b>신고자: ${vo.reportername}, 트롤: ${vo.trollname }</b>&nbsp ${vo.datetime }</div>
	</div>
	
	<div class="contentDiv">접수글: ${vo.content}
	<br>
	신고 내용: ${vo.reportcontent }
	</div>
	</div>
	<form action="" id="reportfrm">
		<input type="hidden" name="troll" value="${vo.troll }">
		<input type="hidden" name="ridx" value="${vo.ridx }">
	</form>
</c:if>

<%-- <div style="border:1px solid grey">
<table class="table table-sm">
		<tbody>
			<tr>
				
				<td>
					<h3>${vo.title }</h3>
					<b>${vo.name } </b>&nbsp ${vo.datetime }
				</td>
			</tr>
			<tr  style="height:300px">
				<td >
						${vo.content}
					<textarea id="summernote" readonly>${vo.content }</textarea>
				</td>
			</tr>
			
			
		</tbody>
	</table>
</div> --%>




<br>
	<c:if test="${login.uidx eq vo.uidx }">
		<button class="btn btn-sm btn-secondary" onclick="location.href='modify.do?bidx=${vo.bidx }'">수정</button>
		<button class="btn btn-sm btn-secondary" onclick=deletecheck()>삭제</button>
	</c:if>
	<c:if test="${login != null}">
		<button class="btn btn-sm btn-secondary" onclick="reportfn()">신고</button>
	</c:if>
	<button class="btn btn-sm btn-secondary "  onclick="location.href='list.do?category=${vo.category }'">목록</button>
	<c:if test="${vo.category==6 && vo.reply==1}">
		<button class="btn btn-sm btn-danger" onclick="withdrawal()">접수 </button> <!-- 트롤 탈퇴시키기 -->
		<button class="btn btn-sm btn-warning" onclick="warningtroll()">경고</button> <!-- 트롤한테 경고 메시지 보내기 -->
		<button class="btn btn-sm btn-success" onclick="">거절</button> <!-- 신고자한테 거절 메시지 보내기 -->
	</c:if>
	
	<c:if test="${vo.category != 1}">
		<c:if test="${ vo.pea_super=='Y' || vo.category==2 || vo.category==3 }">
			<div id="reply"></div>	
		</c:if>
	</c:if>

</div>
<br>
<footer id="footer"></footer>
<script>

function openMini(){
	var popupX = (document.body.offsetWidth / 2) - (1100 / 2);
	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음
	var popupY= (window.screen.height / 2) - 350;
	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
	var uidx = ${login.uidx};
	
	var mobile = (/iphone|ipad|ipod|android/i.test(navigator.userAgent.toLowerCase()));
	 
	if (mobile) { 
		window.location.href="<%=request.getContextPath()%>/mini/main.do?uidx=${vo.uidx}";
	}else{
		window.open('<%=request.getContextPath()%>/mini/main.do?uidx=${vo.uidx}','name',
				'resizable=no width=1300 height=650,left='+popupX+',top='+popupY);
	}
}

function deletecheck(){
	var check = confirm("정말로 삭제하시겠습니까?");	
	if (check){
		location.href="delete.do?bidx=${vo.bidx}&category=${vo.category}";
	} 
}

/* 신고 접수 */
function withdrawal(){
	const swalWithBootstrapButtons = Swal.mixin({
		  customClass: {
		    confirmButton: 'btn btn-success',
		    cancelButton: 'btn btn-danger'
		  },
		  buttonsStyling: false
		})

		swalWithBootstrapButtons.fire({
		  title: '정말 신고 접수하시겠습니까?',
		  text: "접수된 회원은 즉각 탈퇴 조치됩니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonText: '신고 접수',
		  cancelButtonText: '취소',
		  reverseButtons: true
		}).then((result) => {
		  if (result.isConfirmed) {
		    swalWithBootstrapButtons.fire(
		      '접수 완료',
		      '신고된 회원이 탈퇴되었습니다.',
		      'success'
		    )
		      $("#reportfrm").attr("action","withdrawal.do");
	          $("#reportfrm").attr("method","POST");
	          $("#reportfrm").submit();
		  } else if (
		    /* Read more about handling dismissals below */
		    result.dismiss === Swal.DismissReason.cancel
		  ) {
		    swalWithBootstrapButtons.fire(
		      '취소',
		      '신고 접수가 취소되었습니다.',
		      'error'
		    )
		  }
		})
}

/* 신고 경고 (트롤에게) */
async function warningtroll(){
	const { value: text } = await Swal.fire({
		  input: 'textarea',
		  inputLabel: '경고',
		  inputPlaceholder: '경고 메시지를 남겨주세요.',
		  inputAttributes: {
		    'aria-label': 'Type your message here'
		  },
		  showCancelButton: true
		})

		if (text) {
		  Swal.fire(text)
		  
		  $("#reportfrm").attr("action","warningtroll.do?warningmessage="+text);
          $("#reportfrm").attr("method","POST");
          $("#reportfrm").submit();
		}
}

async function reportfn(){
   /* const login = '${login.name}'; */
   const { value: formValues } = await Swal.fire({
        title: '신고',
        html:
         '<form id="frm">'+
          '<textarea id="content" name="content" class="swal2-input" rows=6 cols=30></textarea>' +
          '<select id="report" name="report" class="swal2-input" style="width:22rem">'+
          '<option value="1">욕설/비방</option>'+
          '<option value="2">악성루머</option>'+
          '<option value="3">광고글도배</option>'+
          '<option value="4">기타</option>'+
          '<input type="hidden" name="title" value="신고">'+
          '<input type="hidden" name="rbidx" value='+${vo.bidx }+'>'+
          '<input type="hidden" name="troll" value='+${vo.uidx}+'>'+
          '<input type="hidden" name="uidx" value='+${login.uidx}+'>'+
          '<input type="hidden" name="category" value='+${vo.category}+'>'+
          '</form>',
        focusConfirm: false,
        backdrop: false,
        showCancelButton: true,
        preConfirm: () => {
          return [
            document.getElementById('content').value,
            document.getElementById('report').value,
            
          ]
        }
      })
          $("#frm").attr("action","report.do?bidx="+${vo.bidx});
          $("#frm").attr("method","POST");
          $("#frm").submit();

        if (formValues) {
          await Swal.fire({
          	text: '신고완료',
          });
          const sw1 = $("#content").val();
          const sw2 = $("#report").val();
         // alert(sw1,sw2);
        }
      
}


</script>
</body>
</html>