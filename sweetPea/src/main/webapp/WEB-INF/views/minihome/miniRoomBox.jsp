<!doctype html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>jQuery UI Draggable - Default functionality</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <style>
  #draggable { width: 150px; height: 150px; padding: 0.5em; }
  </style>
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <script>
  $( function() {
    $( ".draggable" ).draggable();
  } );
  
  
  </script>
  <!-- <script>
  $(function(){
   alert('${miniroom }');
  })
  </script> -->
</head>
<body>
<button class="saveBtn" onclick="saveMini()">save</button>
 <c:forEach var="item" items="${miniroom }">
<img class="draggable" id="item${item.uiidx }" alt="${item.uiidx }" style="width:100px; height:100px; left:${item.mleft}px; top:${item.mtop }px; " src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }'/>

<%-- <input type="hidden" class="uiidx" value=${item.uiidx }> --%>

<script>
/* console.log(document.querySelector('.draggable').style.cssText); */
/* var left = 0;
var top = 0;
var uiidx = 0;
$(function (){
	
	var left_ = document.querySelector('#item${item.uiidx }').style.left;
	var top_ = document.querySelector('#item${item.uiidx }').style.top;
	
	left = left_.replace(/[^0-9]/g,'');
	top = top_.replace(/[^0-9]/g,'');
	
	uiidx = ${item.uiidx};
	
	console.log(left,top, uiidx);
		
}); */
	var $box = [];
function saveMini(){
    	console.log($box);
    	
    	$.ajax({
    		  url: "../miniroomboard2/miniPosition.do",
    		  type: "POST",
    		  dataType:"JSON",
    		  traditional : true, //필수
    		  data: {list: JSON.stringify($box)},
    		  success: function(result){
    		    alert("저장되었습니다.");
    		  },
    		  error: function (error){
    		  	alert('다시 시도하세요');
    		  }
    		});
}


$(function() {
    $("#item${item.uiidx }").mouseup(function() {
    	var left_ = document.querySelector('#item${item.uiidx }').style.left;
    	var top_ = document.querySelector('#item${item.uiidx }').style.top;
    	
    	var left = left_.replace(/[^0-9]/g,'');
    	var top = top_.replace(/[^0-9]/g,'');
    	
    	
    	var uiidx = ${item.uiidx};
    	$box.push({uiidx,left,top});
    	console.log($box);
    	/* box.push([uiidx,left,top]); */
    	/* box[i] = [uiidx,left,top];
    	i += 1; */
    	
    	/* console.log(document.querySel;ector('.draggable').style.cssText);
    	console.log('left ',document.querySelector('.draggable').style.left);
    	console.log('top ', document.querySelector('.draggable').style.top);
    	console.log('uiidx', uiidx); */
    	
    	/* console.log($(".miniRoomBox").html()); */
/*     	box.push('uiidx:'+uiidx+';'+document.querySelector('.draggable').style.cssText); */
    	<%-- $(".miniRoomBox").load('<%=request.getContextPath()%>/miniroomboard2/miniPosition.do?left='+left+'&top='+top+'&uiidx='+uiidx+''); --%>
    	 <%-- location.href='<%=request.getContextPath()%>/miniroomboard2/miniPosition.do?left='+left+'&top='+top+'&uiidx='+uiidx+''; --%>   	
    });
    <%-- $(".saveBtn").click(function(){
    	location.href='<%=request.getContextPath()%>/miniroomboard2/miniPosition.do?left='+left+'&top='+top+'&uiidx='+uiidx+'';
    }); --%>
    
}); 
</script>
</c:forEach>
</body>
</html>
   <!--  <script>
        $(document).ready(function () {
            var $container = $(".container");
            var $banner_img = $(".container img");
            var img_left = 0;
            var img_top = 0;
            var mouse_state = false;

            $banner_img.each(function () {
                img_left = Math.random() * ($container.width() - $(this).width());
                img_top = Math.random() * ($container.height() - $(this).width());
                $(this).css({
                    left: img_left,
                    top: img_top
                });
            });

            $banner_img.mousedown(function (e) {
                var container_x = $container.offset().left;
                var container_y = $container.offset().top;
                $(this).css({
                    left: e.clientX - container_x - ($banner_img.width()/2),
                    top: e.clientY - container_y -($banner_img.height()/2)
                    
                });
                
                mouse_state = true;
            });

            $banner_img.mousemove(function(e){
                var container_x = $container.offset().left;
                var container_y = $container.offset().top;
            
                if(mouse_state == true){
                    $(this).css({
                    left: e.clientX - container_x - ($banner_img.width()/2),
                    top: e.clientY - container_y -($banner_img.height()/2)
                });
                    if($(this).css("top") > "300px"){
                          $(this).css("top","300px");
                    }else{
                       
                    }
                    
                
                }
            });

            $banner_img.mouseup(function(e){
               if($(this).css("top") > "300px"){
                      $(this).css("top","300px");
                   }
                mouse_state = false;
            }); 
        });
    </script> -->

<%-- <c:forEach var="item" items="${miniroom }">
<img width="200" height="100" src='<%=request.getContextPath()%>/item/imageView.do?originFileName=${item.img }'/>
</c:forEach>




</body>
</html> --%>