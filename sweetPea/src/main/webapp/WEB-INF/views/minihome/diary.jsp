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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<style>
/* #tmp {
	overflow-y: scroll;
	height: 90vh;
	width: 100%;
} */
.main-content{
	/* overflow-y: scroll; */
	height: 90vh;
	width: 100%;
}

/* #boardList {
	overflow-y: scroll;
	height: 90vh;
	width: 100%;
} */

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
	/* border: 1px solid gray; */
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

.body{
font-family: ${myMini.font};
}



/* 시스템 커서 안 보이게 숨기기 */
  body {
      cursor: none;
  }
  /* 커스텀 커서 스타일 정의해주기 */
  .cursor {
      width: 1rem;
      height: 1rem;
      border: 2px solid #1d1d1d;
      border-radius: 50%;
      position: absolute;
      z-index: 1000;
      transform: translate(-50%, -50%);
      pointer-events: none;
      transition: all 0.3s ease;
      transition-property: background, transform;
      transform-origin: 100% 100%;
      backdrop-filter: sepia(20%);
      background-size: cover;
  }
  
  .link-grow {
    transform: scale(2);
    background-color: #1d1d1d;
}

/* 점선이 들어갈 ::after(pseudo)요소 만들고 크기값 설정해주기*/
  .eachdate:hover::after {
    width: calc(100% - 2rem);
    height: 3px;
    background-size: contain; /* 배경 이미지(svg)가 알맞게 들어가도록*/
  }
/* hover된 링크의 글자 색상 정의(하얀색)*/
/* .hovered-link 선택자명은 추후 JS로 추가할 예정!*/
  .hovered-link {
      color: #fff !important;
  }
/* .gnb li a:hover::after의 svg에 배경이미지 지정!*/
  .hovered-link::after { 
      background-image: url("<%=request.getContextPath()%>/resources/assets/img/portfolio/1.jpg"); 
  }
  
  .calendar{
  	border-radius: 10px;
	box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
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
<!-- 마우스 커서 -->
<div class="cursor"></div>	
<script>
let mouseCursor = document.querySelector(".cursor");
let navLinks = document.querySelectorAll(".eachdate"); //메뉴 링크
//window 객체에 scroll & mouse 이벤트를 추가하고 cursor함수 실행되도록 함
window.addEventListener("scroll", cursor);
window.addEventListener("mousemove", cursor);
//커스텀 커서의 left값과 top값을 커서의 XY좌표값과 일치시킴
function cursor(e) {
  mouseCursor.style.left = e.pageX + "px";
  mouseCursor.style.top = e.pageY - scrollY + "px";
}	
</script>
  
  
  
  
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
			
			<c:if test="${login != null }">
			<c:if test="${login.uidx == mini.uidx}">
				<script>$(".host").css("display","block");</script>
			</c:if>
			</c:if>
		</div>
	</div>
	
	<input type="button"  id='writeDiary' onclick="reload()" value="전체글">
	<script>function reload(){location.reload();}</script>
	<c:if test="${login != null }">
	<c:if test="${login.uidx == mini.uidx }">
		<input type="button" id='writeDiary' class="btn btn-secondary"
		onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=1'" value="글 작성">
	</c:if>
	</c:if>
	<hr>










<!-- 글 공간 전체 -->
<div class='main-content'>
	<!-- 달력 공간 -->
	<div class='calendar'>
		<i class='bi-caret-left-fill eachdate'  onclick='monthDown2()'></i>
			<div id="calendar"><!-- 달력 날짜 공간 --></div> 
		<i class='bi-caret-right-fill eachdate'  onclick='monthUp2()'></i>
	</div>	
	<div id="board"><!-- 글 공간 --></div>
</div>
	

	<script>
	<%
	LocalDate now = LocalDate.now(); // 현재 시간 정보 불러오기
	int year = now.getYear(); // 년
	int monthValue = now.getMonthValue(); // 월 
	int dayOfMonth = now.getDayOfMonth(); // 일
	String dayOfWeek = now.getDayOfWeek().toString(); // 일
	%>
	
	// 글 전부 불러오기
	$(function (){
		sessionStorage.removeItem("clickday");	//세션 삭제
		$.ajax({
			url: "<%=request.getContextPath()%>/miniroomboard2/boardList.do",
			type: "GET",
			data: {"category":1},
			success: function(html){
				$("#board").html(html);
			},
			error: function(){
			}
		})
	});
	
 	// 윤년 계산
	function leapyearCalc(year){
		if (year%4==0){
			if (year%100!=0){ return true; }
			else{ if(year%400==0){ return true; } }	
		} return false;
	}
	var year = <%=year%>;
	// 월별 일수
	if (leapyearCalc(year)==true){
		var lastdate = [0,31,29,31,30,31,30,31,31,30,31,30,31];
	} else{
		var lastdate = [0,31,28,31,30,31,30,31,31,30,31,30,31];
	}
	
	
 	var calcmonth = <%=monthValue%>; //월 js변수 저장
 	
 	function openlist(year,month,day){
 	 	$("#day").text(day); 
 		$.ajax({
 			url: "<%=request.getContextPath()%>/miniroomboard2/boardByDate.do",
 			type: "GET",
 			data: {"year":year, "month":month, "day":day, "category":1},
 			success: function(html){
 				console.log("글 리스트 오픈 성공");
 				$("#board").html(html);
 			},
 			error: function(){
 				console.log("답변 창 오픈 실패");
 			}
 		}) 
 	}
 
 	// 전월 이동
	function monthDown2() {
		calcmonth -= 1;
		if (calcmonth<=0){ calcmonth=12; year -= 1;}
		
		if(sessionStorage.getItem("clickday")!=null){
			var clickday=sessionStorage.getItem("clickday");
			openlist(year,calcmonth,clickday);
		}
		caledar(calcmonth,lastdate[calcmonth],<%=dayOfMonth%>);
	}
 	
	// 다음월 이동
	function monthUp2() {
		calcmonth += 1;
		if (calcmonth>=12){ calcmonth=1; year += 1;}
		
		if(sessionStorage.getItem("clickday")!=null){
			var clickday=sessionStorage.getItem("clickday");
			openlist(year,calcmonth,clickday);
		}
		caledar(calcmonth,lastdate[calcmonth],<%=dayOfMonth%>);
	}
 	
	// 달력 불러오기(자동)
 	$(function (){
		$.ajax({
			url: "<%=request.getContextPath()%>/miniroomboard2/calendar.do",
			type: "GET",
			data: {"year":<%=year%>,"month":calcmonth,"monthByDate":lastdate[calcmonth],"day":<%=dayOfMonth%>},
			success: function(html){
				$("#calendar").html(html);
			},
			error: function(){
			}
		})
	});
	
 	// 달력 불러오기(함수)
	function caledar(month,monthByDate,dayOfMonth){
		$.ajax({
			url: "<%=request.getContextPath()%>/miniroomboard2/calendar.do",
			type: "GET",
			data: {"year":year,"month":month,"monthByDate":monthByDate,"day":dayOfMonth},
			success: function(html){
				$("#calendar").html(html);
			},
			error: function(){
			}
		})
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