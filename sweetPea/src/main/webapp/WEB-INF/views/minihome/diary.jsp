<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>
<%@ page import="java.time.LocalDate"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style>
#boardList {
	overflow-y: scroll;
	height: 90vh;
	width: 100%;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropbtn {
	display: block;
	border: 2px solid rgb(94, 94, 94);
	border-radius: 4px;
	background-color: #fcfcfc;
	font-weight: 400;
	color: rgb(124, 124, 124);
	width: 25vw;
	text-align: left;
	cursor: pointer;
	font-size: 2vw;
	z-index: 1;
	position: relative;
	padding: 0.5vh 0.5vw;
	text-indent: 0.5vw;
}

.dropdown-content {
	display: none;
	font-weight: 400;
	background-color: #fcfcfc;
	min-width: 25vw;
	border-radius: 8px;
	max-height: 20vh;
	overflow: scroll;
	box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}

.dropdown-content::-webkit-scrollbar {
	width: 5px;
	height: 10px;
}

.dropdown-content::-webkit-scrollbar-thumb {
	border-radius: 2px;
	background-color: rgb(194, 194, 194)
}

.dropdown-content div:not(:first-child) {
	display: block;
	text-decoration: none;
	color: rgb(37, 37, 37);
	font-size: 2vw;
	padding: 1vh 0 1vh 2vw;
	cursor: pointer;
}

.dropdown-content div:not(:first-child):hover {
	background-color: rgb(226, 226, 226);
}

.dropdown-content.show {
	display: block;
	position: absolute;
}

.dropbtn_click {
	float: right;
	height: 2.5vh;
	padding-top: 0.25vw;
}

.dropdown-content div:first-child {
	font-size: 2vw;
	padding: 0;
	text-align: right;
}

.dropdown-content div span {
	cursor: pointer;
}

#writeDiary {
	height: 4.5vh;
	width: 12vw;
	float: right;
	cursor: pointer;
}

.host {
	display: none;
}

#inputCategory {
	width: 15vw;
	font-size: 2vw;
	padding: 0;
}

.inputBtn {
	width: 2vw;
	float: right;
	padding-top: 0.4vw;
	padding-right: 0.2vw;
}

/* 다이어리 css */
.calendar {
	margin: 20px 20px 10px 20px;
	flex: 0.1;
	border: 1px solid gray;
	display: flex;
	align-items: center;
	justify-content: space-evenly;
}

.day {
	flex: 0.125;
	margin: 10px;
	text-align: center;
}

.month {
	flex: 0.875;
	margin: 10px;
}

.diary {
	margin: 10px 20px 20px 20px;
	flex: 0.9;
}

.diary-box {
	border: 1px solid gray;
	margin-bottom: 20px;
	padding: 20px;
}

.diary-date {
	font-size: 0.75rem;
}

.diary-text {
	text-align: center;
}

.secret-button button {
	padding: 10px;
	background-color: white;
	color: white;
	border: none;
}

.secret-button button:hover {
	background-color: rgb(255, 70, 70);
	transition: 800ms ease-in all;
}

.icon {
	margin-right: 5px;
}

@font-face {
	font-family: 'BMJUA';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/BMJUA.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.body {
	font-family: 'BMJUA';
}
</style>
<script>
window.onload=()=>{
    document.querySelector('.dropbtn_click').onclick = ()=>{
      dropdown();
    }
    document.getElementsByClassName('diary-category').onclick = ()=>{
      showMenu(value);
    };
    dropdown = () => {
      var v = document.querySelector('.dropdown-content');
      var dropbtn = document.querySelector('.dropbtn')
      v.classList.toggle('show');
      dropbtn.style.borderColor = 'rgb(94, 94, 94)';
    }

	showMenu=(value)=>{
		if(value != '+'){
			var dropbtn_icon = document.querySelector('.dropbtn_icon');
			var dropbtn_content = document.querySelector('.dropbtn_content');
			var dropbtn_click = document.querySelector('.dropbtn_click');
			var dropbtn = document.querySelector('.dropbtn');
			
			dropbtn_icon.innerText = '';
			dropbtn_content.innerText = value;
			dropbtn_content.style.color = '#252525';
			dropbtn.style.borderColor = '#3992a8';
		}
    }
  }
  window.onclick= (e)=>{
    if(!e.target.matches('.dropbtn_click')){
      var dropdowns = document.getElementsByClassName("dropdown-content");

      var dropbtn_icon = document.querySelector('.dropbtn_icon');
      var dropbtn_content = document.querySelector('.dropbtn_content');
      var dropbtn_click = document.querySelector('.dropbtn_click');
      var dropbtn = document.querySelector('.dropbtn');

      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show') && e.target.id != 'plusCategory' && e.target.id != 'inputCategory' && e.target.className != 'inputBtn'
        	&& e.target.className != 'inputBtn host') {
        	openDropdown.classList.remove('show'); 
        }
      }
    }
  }
</script>
<script>
	function newCategory(){
		$(".dropdown-content").append("<div class='diary-category'><input type='text' id='inputCategory' placeholder='생성하기'>"
			+"<img class='inputBtn' src='<%=request.getContextPath()%>/resources/images/plus.png' onclick='plusCategory()'></div>");
		$("#inputCategory").focus();
	}
	
	async function delCategory(e){
		var $name = $(e).parent().text();
		await Swal.fire({
			title: '정말로 삭제하시겠습니까?',
			text: "카테고리 삭제시, 해당카테고리에 있던 게시물들도 전부 삭제됩니다",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제',
			cancelButtonText: '취소',
			position: 'top',
			width: '30em'
		}).then((result) => {
			if (result.isConfirmed) {
				
				$.ajax({
					url:"delCategory.do",
					type:"get",
					data:{	"subcategory"	: $name,
							"uidx"	: ${mini.uidx}
					},
					success: async function(data){
						if(data == 1){
						await Swal.fire({
						    title: '삭제완료',
						    text: '카테고리가 삭제되었습니다',
						    icon: 'success',
						    position: 'top',
						    width: '25em',
						});
						window.location.reload();
						}
						else{
							alert("오류!");
						}
					}
				});
			  }
	    });
	}
	
	function plusCategory(){
		var $new = $("#inputCategory").val();
		$.ajax({
			url:"plusCategory.do",
			type:"get",
			data:{	"subcategory"	: $new,
					"uidx"	: ${mini.uidx}
			},
			success: function(data){
				if(data==1){
					window.location.reload();
				}
				else{
					alert("오류!");
				}
			}
		});
	}
	
	var $val = 0;
	function changeCategory(e){
		$val = $(e).parent().text();
		console.log($val);
		$(e).parent().html("<input type='text' id='inputCategory' value='"+$val+"'>"
			+"<img class='inputBtn' src='<%=request.getContextPath()%>/resources/images/left.png' onclick='changeCategoryAction()'>");
		$("#inputCategory").focus();
	}
	
	function changeCategoryAction(){
		var $change = $("#inputCategory").val();
		 $.ajax({
			url:"changeCategory.do",
			type:"get",
			data:{	"subcategory"	: $change,
					"uidx"	: ${mini.uidx},
					"beforeSubcategory" : $val
			},
			success: function(data){
				if(data==1){
					window.location.reload();
				}
				else{
					alert("오류!");
				}
			}
		}); 
	}
</script>
</head>
<body class="body">

	<div class="dropdown">
		<button class="dropbtn">
			<span class="dropbtn_icon"></span> 
			<span class="dropbtn_content">전체글 보기</span> 
			<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
		</button>
		
		<div class="dropdown-content" id="content-list">
			<div class="diary-category host" onclick="showMenu(this.innerText)">
				<span id="plusCategory" onclick="newCategory()">+</span>
			</div>
			
			<div class="diary-category" onclick="showMenu(this.innerText)">전체글 보기</div>
			<c:forEach var="cate" items="${category}">
				<div class="diary-category" onclick="showMenu(this.innerText)">${cate.subcategory}
						<img src="<%=request.getContextPath()%>/resources/images/delete.png" class="inputBtn host" 
						onclick="delCategory(this)"><img src="<%=request.getContextPath()%>/resources/images/pencil.png"
						class="inputBtn host" onclick="changeCategory(this)">
				</div>
			</c:forEach>
			
			<c:if test="${login.uidx == mini.uidx}">
				<script>$(".host").css("display","block");</script>
			</c:if>
		</div>
	</div>
	
	<c:if test="${login.uidx == mini.uidx }">
		<input type="button" id='writeDiary' 
		onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=1'" value="글 작성">
	</c:if>
	<hr><div id="boardList"></div>

	<script>
	// 시간 정보
	<%
		LocalDate now = LocalDate.now(); // 현재 시간 정보 불러오기 
		int year = now.getYear(); // 년
		int monthValue = now.getMonthValue(); // 월 
		int dayOfMonth = now.getDayOfMonth(); // 일
		String dayOfWeek = now.getDayOfWeek().toString(); // 일
	%>
		
	var calcmonth = <%=monthValue%>;
	let name = '${login.name}';
	      
	// 윤년 계산
	function leapyearCalc(year){
		if (year%4==0){
			if (year%100!=0){ return true; }
			else{ if(year%400==0){ return true; } }	
		} return false;
	}
   
	// 전월 이동
	function monthDown() {
		calcmonth -= 1;
		if (calcmonth<=0){ calcmonth=12; }
		callBoard();
	}

	// 다음월 이동
	function monthUp() {
		calcmonth += 1;
		if (calcmonth>=12){ calcmonth=1; }
		callBoard();
	}
   
	// 월별 일수
	if (leapyearCalc(<%=year%>)==true){
		var lastdate = [0,31,29,31,30,31,30,31,31,30,31,30,31];
	} else{
		var lastdate = [0,31,28,31,30,31,30,31,31,30,31,30,31];
	}

	/* 글 모두 가져와서 화면 #boardList 에 출력 */
	$(function (){
		$.ajax({
			url:"<%=request.getContextPath()%>/miniroomboard2/miniroomboardList.do",
			type:"get",
			success:function(data){
				var html ="";
				html+="<div class='main-content'>";
				html+="<div class='calendar'>";
				html+="<i class='bi-caret-left-fill' onclick='monthDown()'></i>";
				html+="<div class='day' id='bold-text'><span id='demo'>"+calcmonth+"</span>.<%=dayOfMonth%><br><%=dayOfWeek%></div>";
				html+="<div class='month' id='basic-text'>";
				for (var i=1; i<=lastdate[<%=monthValue%>];i++){
					html+= i;
					html+= " ";
				}
				html+="</div>";
				html+="<i class='bi-caret-right-fill' onclick='monthUp()'></i>";
				html+="</div>";
			         
			     
				html+="<div class='diary'>";
				for(var i=0; i<data.length;i++){
					// 비밀글
					if (data[i].secret=='Y' && ${login.uidx == mini.uidx}){
						html+="<div class='diary-box'>";
						html+="<div class='diary-date' id='bold-text'><i class='bi-lock-fill'></i>"+data[i].date+"<span style='float:right;'>"
						html+="<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i>"
						html+="<i class='bi-trash' onclick='deleteDiary("+data[i].mbidx+")'></i></span></div>";
						html+="<div class='diary-text' id='basic-text'>"+data[i].content+"</div>";
						html+="</div>";
					}
					// 안 비밀글 
					if (data[i].secret!='Y'){
						html+="<div class='diary-box'>";
						html+="<div class='diary-date' id='bold-text'>"+data[i].date+"<span style='float:right;'>"
						html+="<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i>"
						html+="<i class='bi-trash' onclick='deleteDiary("+data[i].mbidx+")'></i></span></div>";
						html+="<div class='diary-text' id='basic-text'>"+data[i].content+"</div>";
						html+="</div>";
					}
				}
				html+="</div>";
				html+="</div>";
				
				$("#boardList").html(html);
			}
		});
	})
	
	/* 글 모두 가져와서 화면 #boardList 에 출력 */
	function callBoard(){
		$.ajax({
			url:"<%=request.getContextPath()%>/miniroomboard2/miniroomboardList.do",
			type:"get",
			success:function(data){
				var html ="";
				html+="<div class='main-content'>";
				html+="<div class='calendar'>";
				html+="<i class='bi-caret-left-fill' onclick='monthDown()'></i>";
				html+="<div class='day' id='bold-text'><span id='demo'>"+calcmonth+"</span>.<%=dayOfMonth%><br><%=dayOfWeek%></div>";
				html+="<div class='month' id='basic-text'>";
				for (var i=1; i<=lastdate[calcmonth];i++){
					html+= i;
					html+= " ";
				}
				html+="</div>";
				html+="<i class='bi-caret-right-fill' onclick='monthUp()'></i>";
				html+="</div>";
			         
			     
				html+="<div class='diary'>";
				for(var i=0; i<data.length;i++){
					// 비밀글
					if (data[i].secret=='Y' && ${login.uidx == mini.uidx}){
						html+="<div class='diary-box'>";
						html+="<div class='diary-date' id='bold-text'><i class='bi-lock-fill'></i>"+data[i].date+"<span style='float:right;'>"
						html+="<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i>"
						html+="<i class='bi-trash' onclick='deleteDiary("+data[i].mbidx+")'></i></span></div>";
						html+="<div class='diary-text' id='basic-text'>"+data[i].content+"</div>";
						html+="</div>";
					}
					// 안 비밀글 
					if (data[i].secret!='Y'){
						html+="<div class='diary-box'>";
						html+="<div class='diary-date' id='bold-text'>"+data[i].date+"<span style='float:right;'>"
						html+="<i class='bi-pencil' onclick='location.href=`<%=request.getContextPath()%>/miniroomboard2/modify.do?mbidx="+data[i].mbidx+"&title="+data[i].title+"&content="+data[i].content+"`'></i>"
						html+="<i class='bi-trash' onclick='deleteDiary("+data[i].mbidx+")'></i></span></div>";
						html+="<div class='diary-text' id='basic-text'>"+data[i].content+"</div>";
						html+="</div>";
					}
				}
				html+="</div>";
				html+="</div>";
				
				$("#boardList").html(html);
			}
		});
	}
	
	// 글 삭제
	function deleteDiary(mbidx){
		var check = confirm("정말로 삭제하시겠습니까?");	
		if (check){
			location.href="<%=request.getContextPath()%>/miniroomboard2/deleteDiary.do?mbidx="+mbidx+"";
		} 
	}
</script>
</body>
</html>