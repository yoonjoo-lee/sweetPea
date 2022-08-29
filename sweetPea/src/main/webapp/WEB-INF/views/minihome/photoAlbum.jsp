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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<!--slick slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


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
.photo-profile{
    width: 40px;
    height: 40px;
    border-radius: 70%;
    overflow: hidden; 
}
.photo-profile-img{
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

body{
font-family: ${myMini.font};
}





.post-slider{
  border:1px solid red;
}
.post-slider .post-wrapper{
  width:84%;
  height:350px;
  margin:0px auto;
  border:1px dashed red;
}
.post-slider .post-wrapper .post{
  width:300px;
  height:350px;
  display:inline-block;
  background:gray;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
#mainBox{
	margin:0;
}
h1{
	margin:0;
}
.bi-plus-square-fill{
    font-size: 4vh;
    float: right;
    margin: 1vh;
}
img{
	width: 100px;
	height: 100px;
}

</style>
</c:if>

</head>
<body>
<c:if test="${mini.uidx==login.uidx }">
<h1 class="uploadIcon" style="cursor:pointer"><i class="bi bi-plus-square-fill" style="color:grey;" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/photoAlbumUpload.do?uidx=${login.uidx}&category=2'"></i></h1>
</c:if>

<!-- <div class="post-slider">
        <h1 class="sider-title">Treding Posts</h1>
        <div class="post-wrapper">
          <div class="post">1</div>
          <div class="post">2</div>
          <div class="post">3</div>
          <div class="post">4</div>
          <div class="post">5</div>
        </div>
</div>
<script>
$('.post-wrapper').slick({
	  slidesToShow: 1,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	});
</script> -->

<!-- 게시물이 없을 경우 -->
<c:if test="${list.size() == 0}">
<div class="eachphoto"><br><br>
<div style="text-align:center;">등록된 게시물이 없어요:(</div>
<br><br></div>
</c:if>





<c:forEach var="board" items='${list }'>
<div class="eachphoto">
<br>

<!-- 프로필 사진 -->
<div class="photo-profile" id="user">
<c:if test="${board.miniProfile == null}">
	<img class="photo-profile-img" src="<%=request.getContextPath()%>/resources/upload/1.png">
</c:if>
<c:if test="${board.miniProfile != null}">
	<img class="photo-profile-img" src="<%=request.getContextPath() %>/miniroomboard2/getProfile.do?originFileName=${board.miniProfile}" onclick="clickBtn('<%=request.getContextPath()%>/miniroomboard2/changeProfile.do'),clickThis(this)">
</c:if>
</div>

<div id="user"><b>${board.name }</b></div>
<div id="user" class="manage"  style="color:grey;">
<c:if test="${board.secret eq 'Y' }"><i class='bi-lock-fill'>비밀글 </i></c:if>
<c:if test="${login.uidx == mini.uidx }">
<i class="bi bi-eraser" style="cursor:pointer" onclick="location.href='<%=request.getContextPath() %>/miniroomboard2/photoAlbumModify.do?mbidx=${board.mbidx }'"></i>
<i class="bi bi-trash" style="cursor:pointer" onclick="deletephoto(${board.mbidx })"></i> 
</c:if>
</div>

<div id="slider" class="slider${board.mbidx }">
  <a class="control_next" id="next${board.mbidx }">&gt;</a>
  <a class="control_prev" id="prev${board.mbidx }">&lt;</a>
	<script>
	var content = '${board.content }';
	var files = content.split('|');
	$(".slider"+${board.mbidx}).append('<ul class="ul${board.mbidx }">');
	for (var i=0; i<files.length-1; i++){
	 	$(".ul"+${board.mbidx}).append('<li class="li${board.mbidx }"><img alt="img" class="image" src="<%=request.getContextPath() %>/miniroomboard2/imageView.do?originFileName='+files[i]+'"/></li>');
	}
	</script>  
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
		    Swal.fire(
		      '삭제 성공!',
		      '삭제에 성공하였습니다.',
		      'success'
		    )
				location.href="<%=request.getContextPath()%>/miniroomboard2/photoDelete.do?mbidx="+mbidx+"";
		  }
		})
}
</script>
</body>
</html>