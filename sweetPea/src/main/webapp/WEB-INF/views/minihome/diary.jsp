<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
.dropdown{
  position : relative;
  display : inline-block;
}
.dropbtn{
  display : block;
  border : 2px solid rgb(94, 94, 94);
  border-radius : 4px;
  background-color: #fcfcfc;
  font-weight: 400;
  color : rgb(124, 124, 124);
  width :20vw;
  text-align: left;
  cursor : pointer;
  font-size : 2vw;
  z-index :1;
  position : relative;
  padding: 0.5vh 0.5vw;
  text-indent: 0.5vw;
}
.dropdown-content{
  display : none;
  font-weight: 400;
  background-color: #fcfcfc;
  min-width : 20vw;
  border-radius: 8px;
  max-height : 20vh;
  overflow : scroll;
  box-shadow: 0px 0px 10px 3px rgba(190, 190, 190, 0.6);
}
.dropdown-content::-webkit-scrollbar{
  width : 5px;
  height : 10px;
}
.dropdown-content::-webkit-scrollbar-thumb{
  border-radius : 2px;
  background-color :rgb(194, 194, 194)
}
.dropdown-content div:not(:first-child){
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 2vw;
  padding: 1vh 2vw;
  cursor: pointer;
}
.dropdown-content div:not(:first-child):hover{
  background-color: rgb(226, 226, 226);
}

.dropdown-content.show{
  display : block;
  position: absolute;
}
.dropbtn_click{
	float: right;
    height: 2.5vh;
    padding-top: 0.25vw;
}
.dropdown-content div:first-child{
  font-size: 2vw;
  padding: 0;
  text-align: right;
}
.dropdown-content div span{
	cursor: pointer;
}

#writeDiary{
    height: 4.5vh;
    width: 12vw;
    float: right;
    cursor: pointer;
}
.host{
	display: none;
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
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }
</script>
</head>
<body>
	<div class="dropdown">
		<button class="dropbtn">
			<span class="dropbtn_icon"></span>
			<span class="dropbtn_content">전체글 보기</span>
			<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
		</button>
		<div class="dropdown-content">
			<div class="diary-category host" onclick="showMenu(this.innerText)"><span>+</span></div>
			<div class="diary-category" onclick="showMenu(this.innerText)">전체글 보기</div>
			<c:forEach var="cate" items="${category}">
				<div class="diary-category" onclick="showMenu(this.innerText)">${cate.subcategory}</div>
			</c:forEach>
			<c:if test="${login.uidx == mini.uidx}">
			<script>
				$(".host").css("display","block");
			</script>
			</c:if>
		</div>
	</div>
	<c:if test="${login.uidx == mini.uidx }">
	<input type="button" id='writeDiary' onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/diary_write.do?uidx=${login.uidx}&category=1'" value="글 작성">
	</c:if>
	<hr>
	
</body>
</html>