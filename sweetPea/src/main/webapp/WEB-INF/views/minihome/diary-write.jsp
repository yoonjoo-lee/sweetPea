<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
	
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
*:not(hr){margin: 0;}
h3{
	margin: 1vh 0;
    font-size: 3vh;
}
#title-box{ 
    width:100%; 
    display:flex; 
    justify-content: center;
}

#title{ 
    width:78%; 
    height:4.5vh; 
    border:1px #D8D8D8 solid; 
    border-radius: 5px; 
    padding:0 10px; 
    margin-bottom:10px;
    margin-right: 2vw; 
    font-size:2vw; 
}
h3>button{
	float: right;
    width: 15vw;
    height: 4.5vh;
}


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

.dropdown-content div{
  display : block;
  text-decoration : none;
  color : rgb(37, 37, 37);
  font-size: 2vw;
  padding: 1vh 2vw;
  cursor: pointer;
}
.dropdown-content div:hover{
  background-color: rgb(226, 226, 226);
}

.dropdown-content.show{
  display : block;
  position: absolute;
  z-index: 9999;
}
.dropbtn_click{
	float: right;
    height: 2.5vh;
    padding-top: 0.25vw;
}
</style>

<script>
$(function(){
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
			var dropbtn_icon = document.querySelector('.dropbtn_icon');
			var dropbtn_content = document.querySelector('.dropbtn_content');
			var dropbtn_click = document.querySelector('.dropbtn_click');
			var dropbtn = document.querySelector('.dropbtn');
			
			dropbtn_icon.innerText = '';
			dropbtn_content.innerText = value;
			dropbtn_content.style.color = '#252525';
			dropbtn.style.borderColor = '#3992a8';
    }
	
	$('#summernote').summernote({
        height: 380,
        maxHeight: 400,
        toolbar: [
        	  ['style', ['style']],
        	  ['font', ['bold', 'underline', 'clear']],
        	  ['color', ['color']],
        	  ['para', ['ul', 'ol', 'paragraph']],
        	  ['table', ['table']],
        	  ['insert', ['link', 'picture', 'video']],
        	  ['height', ['height']]
        	],
        placeholder: '내용을 입력하세요'
    });
});
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
<form action="<%=request.getContextPath()%>/miniroomboard2/diary_write.do" method="post">
	<h3>글쓰기<button type="submit">작성</button></h3>
	<hr>
	
	<div id="title-box">
		<input id="title" name="title" placeholder="제목을 입력해 주세요">
		비밀글<input type="checkbox" name="secret" value="Y">
		<div class="dropdown">
		<button class="dropbtn" type="button" >
			<span class="dropbtn_icon"></span>
			<span class="dropbtn_content">카테고리1</span>
			<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
		</button>
		<div class="dropdown-content">
			<c:forEach var="cate" items="${subcategory}">
				<div class="diary-category" onclick="showMenu(this.innerText)">${cate.subcategory}</div>
			</c:forEach>
		</div>
	</div>
	</div>
		<textarea id="summernote" name="content"></textarea>
	<input type="hidden" name="category" value=${category }>
</form>
</body>
</html>