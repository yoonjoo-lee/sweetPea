<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>

<!DOCTYPE html>


<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
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
  width: 100px;
  height: 50px;
/*   width: 660px;
  height: 300px; */
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
  /* width: auto;
  height: auto; */
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
width:100px;
height:50px;
} 

/* 각 게시물 */
.eachphoto{
border-radius: 10px;
box-shadow: 2px 3px 4px 2px rgba(34, 36, 38, 0.15);
}

</style>

ddd
${list }
<c:forEach var="board" items='${list }'>
<div class="eachphoto">
<br>
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
</c:forEach>
d

