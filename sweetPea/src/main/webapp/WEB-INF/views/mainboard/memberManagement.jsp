<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
</script>
<style type="text/css">
body{
    margin-bottom: 10%;
}
		#view{
			width: 60%;
			margin: 0 auto;
			margin-bottom: 200px;
		}
		#footer{
			width: 100%;
			bottom: 0;
			left: 0;
			position: absolute;
		}
		
		
table {
  border: 1px #a39485 solid;
  font-size: .9em;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
  text-align: center;
}
/* 
th {
  text-align: left;
}
   */
thead {
  font-weight: bold;
  color: #fff;
  /* background: #73685d; */
  background: #52C3BD;
  /* background: medium turquoise;  */
}
  
 td, th {
  padding: 1em .5em;
  vertical-align: middle;
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

a {
  color: #73685d;
}
  
 /* @media all and (max-width: 768px) {
    
  table, thead, tbody, th, td, tr {
    display: block;
  }
  
  th {
    text-align: right;
  }
  
  table {
    position: relative; 
    padding-bottom: 0;
    border: none;
    box-shadow: 0 0 10px rgba(0,0,0,.2);
  }
  
  thead {
    float: left;
    white-space: nowrap;
  }
  
  tbody {
    overflow-x: auto;
    overflow-y: hidden;
    position: relative;
    white-space: nowrap;
  }
  
  tr {
    display: inline-block;
    vertical-align: top;
  }
  
  th {
    border-bottom: 1px solid #a39485;
  }
  
  td {
    border-bottom: 1px solid #e5e5e5;
  }
  
  
  } */
  
  
  
  
  
@import url(https://fonts.googleapis.com/css?family=Roboto:700);
.button {
  background: #3D4C53;
  margin : 20px auto;
  width: 15%;
  height : 5vh;
  overflow: hidden;
  text-align : center;
  transition : .2s;
  cursor : pointer;
  border-radius: 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,.2);
  float: left; 
}
.btnTwo {
  position : relative;
  width : 200px;
  height : 100px;
  margin-top: -100px;
  padding-top: 2px;
  background : #26A69A;
  left : -250px;
  transition : .3s;
}
.btnText {
  color : white;
  transition : .3s;
  margin-top : 10px;
}
.btnText2 {
  margin-top : 53px;
  margin-right : -130px;
  color : #FFF;
}
.button:hover .btnTwo{ /*When hovering over .button change .btnTwo*/
  left: -130px;
}
.button:hover .btnText{ /*When hovering over .button change .btnText*/
  margin-left : 65px;
}
.button:active { /*Clicked and held*/
  box-shadow: 0px 5px 6px rgba(0,0,0,0.3);
}
</style>
<c:if test="${device eq 'MOBILE'}">
<style>
#view{width:100%}
.button{
	width: 48%;
	height: 100%;
	margin: 0 auto;
    display: inline-block;
}
.buttonBox{
    height: 5vh;
    margin: 2vh auto;
    width: 80%;
}
.btnText{
	line-height: 5vh;
    margin: 0;
}
.buttonBox>.button:last-child {
	float: right;
}
tr,th{
	font-size: 3vw;
}
</style>
</c:if>
<script>
	function delUser($uidx,$name){
		Swal.fire({
			title: '회원삭제',
			html: '['+$name+']' + ' 회원을 정말로 탈퇴시키겠습니까?',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonText: '예',
			cancelButtonText: '아니오',
			preConfirm: () => {
				$.ajax({
					url:'delUser.do',
					type: 'get',
					data: {"uidx": $uidx},
					success: async function(data){
						if(data == 1){
							await Swal.fire({
								title: '탈퇴완료',
								text: '탈퇴 완료되었습니다',
								icon: 'success'
							})
							window.location.reload();
						}
						else{
							alert("오류!");
						}
					},
					error: function(){
						alert("오류발생");
					}
				});
			}
		});
		      
	}
</script>
</head>
<body>
<header id="header"></header>
<div id="view">
<!-- <h2>회원관리</h2><br>
<button class="btn btn-secondary" onclick="userList()">회원</button>
<button class="btn btn-secondary" onclick="deleteAccountList()">탈퇴회원</button>  -->
<div class="buttonBox">
<div class="button" onclick="userList()">
   <p class="btnText">회원</p>
   <div class="btnTwo">
     <p class="btnText2">really?</p>
   </div>
</div>
<div style="margin-left:1vw;" class="button" onclick="deleteAccountList()">
   <p class="btnText">탈퇴회원</p>
   <div class="btnTwo">
     <p class="btnText2">really?</p>
   </div>
</div>
</div>
<div id="userList">
</div>
</div>
<script>
$(function (){
	$.ajax({
		url:"userList.do",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>아이디</th>";
			html += "<th>이름</th>";
			html += "<th>성별</th>";
			html += "<th>가입일</th>";
			html += "<th></th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].id+"</td>";
				html+="<td><a href=''>"+data[i].name+"</a></td>";
				html+="<td>"+data[i].gender+"</td>";
				html+="<td>"+data[i].udate+"</td>";
				html+="<td><button onclick=delUser("+data[i].uidx+",'"+data[i].name+"')>강퇴하기</button></td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#userList").html(html);
		}
	});
})

function userList(){
	$.ajax({
		url:"userList.do",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>아이디</th>";
			html += "<th>이름</th>";
			html += "<th>성별</th>";
			html += "<th>가입일</th>";
			html += "<th></th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].id+"</td>";
				html+="<td><a href=''>"+data[i].name+"</a></td>";
				html+="<td>"+data[i].gender+"</td>";
				html+="<td>"+data[i].udate+"</td>";
				html+="<td><button onclick=delUser("+data[i].uidx+",'"+data[i].name+"')>강퇴하기</button></td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#userList").html(html);
		}
	});
}

function deleteAccountList(){
	$.ajax({
		url:"deleteAccountList.do",
		type:"get",
		success:function(data){
			var html ="";
			html += "<table>";
			html += "<thead>";
			html += "<tr>";
			html += "<th>아이디</th>";
			html += "<th>이름</th>";
			html += "<th>성별</th>";
			html += "<th>탈퇴 이유</th>";
			html += "</tr>";
			html += "</thead>";
			html += "<tbody>";
			for(var i=0; i<data.length;i++){
				html+="<tr>";
				html+="<td>"+data[i].id+"</td>";
				html+="<td><a href=''>"+data[i].name+"</a></td>";
				html+="<td>"+data[i].gender+"</td>";
				html+="<td>"+data[i].delreason+"</td>";
				html+="</tr>";
			}
			html += "</tbody>";
			html += "</table>";
			
			$("#userList").html(html);
		}
	});
} 
</script>
</body>
</html>