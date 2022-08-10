<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style>
/* 이미지 슬라이더 */
#slider {
  position: relative;
  overflow: hidden;
  margin: 20px auto 0 auto;
  border-radius: 4px;
  
}

#slider ul {
  position: relative;
  margin: 0;
  padding: 0;
  height: 200px;
  list-style: none;
}

#slider ul li {
  position: relative;
  display: block;
  float: left;
  margin: 0;
  padding: 0;
  width: 660px;
  height: 300px;
 /*  background: #ccc; */
  text-align: center;
  line-height: 300px;
}

a.control_prev, a.control_next {
  position: absolute;
  /* top: 40%; */
  z-index: 999;
  display: block;
  padding: 100% 3%;
  width: auto;
  height: auto;
  /* background: #2a2a2a; */
  color: #2a2a2a;
  text-decoration: none;
  font-weight: 600;
  font-size: 18px;
  opacity: 0.8;
  cursor: pointer;
}

a.control_prev:hover, a.control_next:hover {
  /* opacity: 1; */
  background: silver;
  -webkit-transition: all 0.2s ease;
}

a.control_prev {
  border-radius: 0 2px 2px 0;
}

a.control_next {
  right: 0;
  border-radius: 2px 0 0 2px;
}

.image{
width:400px;
height:300px;
}

/* 프로필 사진 */
.profile{
    width: 40px;
    height: 40px;
    border-radius: 70%;
    overflow: hidden; 
}
.profile-img{
  width: 100%;
  height: 100%;
  object-fit: cover;
}

/* 사용자 정보 상단 */
#user{
display: inline-block;
vertical-align: middle;
}
.manage{
float: right;
}
/* 글작성 */
.uploadIcon{
text-align: right;
}

/* 각 게시물 */
.eachphoto{
border-radius: 10px;
box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
}
</style>
</head>
<body>
<h1 class="uploadIcon"><i class="bi bi-plus-square-fill" style="color:grey;" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/photoAlbumUpload.do?uidx=${login.uidx}&category=2'"></i></h1>

<c:forEach var="board" items='${list }'>
<div class="eachphoto">
<br>
<div class="profile" id="user"><img class="profile-img" src="${board.profile }" alt=''></div>
<div id="user"><b>${board.name }</b></div>
<div id="user" class="manage"  style="color:grey;">
<i class="bi bi-eraser"></i><i class="bi bi-trash" onclick="deletephoto(${board.mbidx })"></i> 
</div>

<div id="slider" class="slider${board.mbidx }">
  <a class="control_next" id="next${board.mbidx }">&gt;</a>
  <a class="control_prev" id="prev${board.mbidx }">&lt;</a>
  <ul class="ul${board.mbidx }">
	<script>
	var content = '${board.content }';
	var files = content.split('|');
	
	for (var i=0; i<files.length-1; i++){
	 	document.write('<li class="li${board.mbidx }"><img alt="img" class="image" src="<%=request.getContextPath() %>/miniroomboard2/imageView.do?originFileName='+files[i]+'"/></li>')
	}
	</script>
  </ul>  
</div>

<script>
/* 이미지 슬라이더 */
jQuery(document).ready(function ($) {
		var slideCount = $('.li${board.mbidx }').length;
		var slideWidth = $('.li${board.mbidx }').width;
		var slideHeight = 300;
		var sliderUlWidth = slideCount * slideWidth;
		
		$('.slider${board.mbidx }').css({ width: slideWidth, height: slideHeight });
		$('.ul${board.mbidx }').css({ width: sliderUlWidth, marginLeft: - slideWidth });
	    $('.li${board.mbidx }:last-child').prependTo('.ul${board.mbidx }');
		/* 이미지 왼쪽 이동 */
	    function moveLeft() {
	        $('.ul${board.mbidx }').animate({
	            left: + slideWidth
	        }, 200, function () {
	            $('.li${board.mbidx }:last-child').prependTo('.ul${board.mbidx }');
	            $('.ul${board.mbidx }').css('left', '');
	        });
	    };
		/* 이미지 오른쪽 이동 */
	    function moveRight() {
	        $('.ul${board.mbidx }').animate({
	            left: - slideWidth
	        }, 200, function () {
	            $('.li${board.mbidx }:first-child').appendTo('.ul${board.mbidx }');
	            $('.ul${board.mbidx }').css('left', '');
	        });
	    };

	    $('a#next${board.mbidx }').click(function () {
	        moveLeft();
	    });

	    $('a#prev${board.mbidx }').click(function () {
	        moveRight();
	    });

	});   
</script> 
<b>${board.name }</b>&nbsp;${board.title }<br>${board.date }<br><br>
</div>
</c:forEach>
<script>
/* 게시물 삭제 */
async function deletephoto(mbidx){
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
				location.href="<%=request.getContextPath()%>/miniroomboard2/photoDelete.do?mbidx="+mbidx+"";
		    Swal.fire(
		      '삭제 성공!',
		      '삭제에 성공하였습니다.',
		      'success'
		    )
		  }
		})
}
</script>
</body>
</html>