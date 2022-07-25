<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
  padding: 1vh 0 1vh 2vw;
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
#inputCategory{
	width: 12vw;
    font-size: 2vw;
    padding: 0;
}
.inputBtn{
    width: 2vw;
    float: right;
    padding-top: 0.4vw;
    padding-right: 0.2vw;
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
          $("#inputCategory").parent().remove();
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
		$(e).focus();
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
<body>
	<div class="dropdown">
		<button class="dropbtn">
			<span class="dropbtn_icon"></span>
			<span class="dropbtn_content">전체글 보기</span>
			<img class="dropbtn_click" src="<%=request.getContextPath()%>/resources/images/arrow-down.png" onclick="dropdown()">
		</button>
		<div class="dropdown-content" id="content-list">
			<div class="diary-category host" onclick="showMenu(this.innerText)"><span id="plusCategory" onclick="newCategory()">+</span></div>
			<div class="diary-category" onclick="showMenu(this.innerText)">전체글 보기</div>
			<c:forEach var="cate" items="${category}">
				<div class="diary-category" onclick="showMenu(this.innerText)"
				>${cate.subcategory}<img src="<%=request.getContextPath()%>/resources/images/delete.png" class="inputBtn host" onclick="delCategory(this)"
				><img src="<%=request.getContextPath()%>/resources/images/pencil.png" class="inputBtn host" onclick="changeCategory(this)"></div>
			</c:forEach>
			<c:if test="${login.uidx == mini.uidx}">
			<script>
				$(".host").css("display","block");
			</script>
			</c:if>
		</div>
	</div>
	<c:if test="${login.uidx == mini.uidx }">
	<input type="button" id='writeDiary' onclick="location.href='diary-write.do?uidx=${login.uidx}'" value="글 작성">
	</c:if>
	<hr>
	
</body>
</html>