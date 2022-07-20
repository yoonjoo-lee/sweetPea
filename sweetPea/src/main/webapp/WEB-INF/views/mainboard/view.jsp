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
<div class="nameDiv"><b>${vo.name }</b>&nbsp ${vo.datetime }</div>
</div>

<div class="contentDiv">${vo.content}</div>
</div>
</c:if>

<c:if test="${vo.category==6}">
	<div class="viewDiv">
	<div class="titleDiv"><h3>${vo.title }</h3>
	<div class="nameDiv"><b>신고자: ${vo.reportername}, 트롤: ${vo.trollname }</b>&nbsp ${vo.datetime }</div>
	</div>
	
	<div class="contentDiv">접수글: ${vo.content}
	<br>
	신고 내용: ${vo.reportcontent }
	</div>
	</div>
	
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
	<c:if test="${vo.category==6}">
		<button class="btn btn-sm btn-secondary" onclick="">접수</button>
		<button class="btn btn-sm btn-secondary" onclick="">거절</button>
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

function deletecheck(){
	var check = confirm("정말로 삭제하시겠습니까?");	
	if (check){
		location.href="delete.do?bidx=${vo.bidx}&category=${vo.category}";
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
/* 

async function reportfn(){
	const { value: formValues } = await Swal.fire({
		  title: 'Multiple inputs',
		  html:
		    '<input id="swal-input1" class="swal2-input">' +
		    '<input id="swal-input2" class="swal2-input">',
		  focusConfirm: false,
		  preConfirm: () => {
		    return [
		      document.getElementById('swal-input1').value,
		      document.getElementById('swal-input2').value
		    ]
		  }
		})

		if (formValues) {
		  Swal.fire(JSON.stringify(formValues))
		}
	
	const { value: text } = await Swal.fire({
		  input: 'textarea',
		  inputLabel: 'Message',
		  inputPlaceholder: 'Type your message here...',
		  inputAttributes: {
		    'aria-label': 'Type your message here'
		  },
		  showCancelButton: true
		})
		

		if (text) {
		  Swal.fire(text)
		}
	
	const { value: fruit } = await Swal.fire({
	  title: 'Select field validation',
	  input: 'select',
	  inputOptions: {
	    'Fruits': {
	      apples: 'Apples',
	      bananas: 'Bananas',
	      grapes: 'Grapes',
	      oranges: 'Oranges'
	    },
	    'Vegetables': {
	      potato: 'Potato',
	      broccoli: 'Broccoli',
	      carrot: 'Carrot'
	    },
	    'icecream': 'Ice cream'
	  },
	  inputPlaceholder: 'Select a fruit',
	  showCancelButton: true,
	  inputValidator: (value) => {
	    return new Promise((resolve) => {
	      if (value === 'oranges') {
	        resolve()
	      } else {
	        resolve('You need to select oranges :)')
	      }
	    })
	  }
	})

	if (fruit) {
	  Swal.fire(`You selected: ${fruit}`)
	}
} */
</script>
</body>
</html>