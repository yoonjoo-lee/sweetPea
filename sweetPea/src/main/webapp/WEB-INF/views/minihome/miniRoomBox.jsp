<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>jQuery UI Draggable - Default functionality</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<style>
.bgSizeCover {
	 background-image: url("<%=request.getContextPath()%>/resources/images/back5.jpg");
	 width: 60px;
	 height: 60px;
	 border: 2px solid;
	 color: pink;
	 resize: both;
	 overflow: auto;
}
.saveBtn{
    cursor: pointer;
    position: absolute;
    z-index: 9999;
    width: 50px;
    height: 25px;
    margin: 5px;
    bottom: 0;
    right: 0;
}



</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<c:if test="${login.uidx==mini.uidx && device eq 'PC'}">
<script>
$( function() {
  $( ".draggable" ).draggable({
  	containment: "parent" 
  });
} );
</script>
</c:if>

<c:if test="${device eq 'MOBILE'}">
</c:if>

</head>
<body>

<!-- <div class="bgSizeCover">
  <p>Try resizing this element!</p>
</div> -->
<c:if test="${login!=null }">
<c:if test="${login.uidx==mini.uidx && device eq 'PC'}">
<button class="saveBtn" onclick="saveMini()" style="vertical-align:top; cursor:pointer; ">save</button>
</c:if>
 <c:forEach var="item" items="${miniroom}">
<!-- <i class="bi-file-excel"></i> -->
<c:if test="${device eq 'PC'}">
<img class="draggable" id="item${item.uiidx}" alt="${item.uiidx }" style=" left:${item.mleft}px; top:${item.mtop}px; position: absolute;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }'/>
</c:if>
<c:if test="${device eq 'MOBILE'}">
<img class="draggable" id="item${item.uiidx}" alt="${item.uiidx }" style=" left:calc(${item.mleft}% / 6); top:calc(${item.mtop}% / 3); position: absolute;" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }'/>
<script>
	var $miniRoomWidth = $('.miniRoomBox').width() / 600;
	var $width;
	var $height;
$(function(){
	var url = '<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }';
    $("<img/>").attr('src', url)
    .on('load', function() {
    	/* alert("width: "+this.naturalWidth+"height: "+this.naturalHeight); */
    	$width = (this.naturalWidth * $miniRoomWidth)+"px";
    	$height = (this.naturalHeight) * $miniRoomWidth+"px";
    	/* alert($width +" "+$height); */
    /* alert($width +" "+$height); */
    $("#item${item.uiidx}").css({'width':$width,'height':$height});
    });
})
</script>
</c:if>
<%-- <script>
$(function(){
	document.querySelector(".test").style.background-image = "url("<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }")";
});
</script>
<style>
.test {
	  background-image: url("<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }");
	  width: 160px;
	  height: 160px;
	  border: 2px solid;
	  color: pink;
	  resize: both;
	  overflow: auto;
  }
</style> --%>
<c:if test="${login.uidx==mini.uidx && device eq 'PC'}">
 <script>

var $box = [];
function saveMini(){
    	console.log($box);
    	if ($box!=''){
    		location.href='<%=request.getContextPath()%>/miniroomboard2/miniPosition.do?box='+$box+'';    		
    	}else{
    		alert('no changes');
    	}
    	/* 
    	$.ajax({
    		  url: "../miniroomboard2/miniPosition.do",
    		  type: "POST",
    		  dataType:"JSON",
    		  traditional : true, //필수
    		  data: {list: JSON.stringify($box)},
    		  success: function(result){
    		    alert("success .");
    		  },
    		  error: function (error){
    		  	alert('fail');
    		  }
    		}); */
}


$(function() {
    $("#item${item.uiidx }").mouseup(function() {
    	var left_ = document.querySelector('#item${item.uiidx }').style.left;
    	var top_ = document.querySelector('#item${item.uiidx }').style.top;
    	
    	var left = left_.replace(/[^0-9]/g,'');
    	var top = top_.replace(/[^0-9]/g,'');
    	
    	var uiidx = ${item.uiidx};
    	$box.push(uiidx+'/'+left+'/'+top);
/*     	$box.push({uiidx,left,top}); */
    	console.log($box);
   });
}); 
</script>
</c:if>
</c:forEach>
</c:if>

</body>
</html>

