<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
/**
 * Oscuro: #283035
 * Azul: #03658c
 * Detalle: #c7cacb
 * Fondo: #dee1e3
 ----------------------------------*/
 * {
 	margin: 0;
 	padding: 0;
 	-webkit-box-sizing: border-box;
 	-moz-box-sizing: border-box;
 	box-sizing: border-box;
 }

 a {
 	color: #03658c;
 	text-decoration: none;
 }

ul {
	list-style-type: none;
}

body {
	font-family: 'Roboto', Arial, Helvetica, Sans-serif, Verdana;
	/* background: #dee1e3; */
	/* background: #dcdcdc; */
	background: #fff; 
}

/** ====================
 * Lista de Comentarios
 =======================*/
.comments-container {
	/* margin: 60px auto 15px; */
	/* width: 768px; */
	width: 55rem; 
}

.comments-container h1 {
	font-size: 36px;
	color: #283035;
	font-weight: 400;
}

.comments-container h1 a {
	font-size: 18px;
	font-weight: 700;
}

.comments-list {
	margin-top: 30px;
	position: relative;
}

/**
 * Lineas / Detalles
 -----------------------*/
.comments-list:before {
	content: '';
	width: 2px;
	height: 100%;
	background: #fff;
	position: absolute;
	left: 32px;
	top: 0;
}

.comments-list:after {
	content: '';
	position: absolute;
	background: #fff;
	bottom: 0;
	left: 27px;
	width: 7px;
	height: 7px;
	border: 3px solid #fff;
	/* border: 3px solid #dee1e3; */
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border-radius: 50%;
}

.reply-list:before, .reply-list:after {display: none;}
.reply-list li:before {
	content: '';
	width: 60px;
	height: 2px;
	/* background: #c7cacb; */
	position: absolute;
	top: 25px;
	left: -55px;
}


.comments-list li {
	/* margin-bottom: 15px; */
	display: block;
	position: relative;
}

.comments-list li:after {
	content: '';
	display: block;
	clear: both;
	height: 0;
	width: 0;
}

.reply-list {
	/* padding-left: 88px; */
	clear: both;
	margin-top: 15px;
}
/**
 * Avatar
 ---------------------------*/
.comments-list .comment-avatar {
	width: 65px;
	height: 65px;
	position: relative;
	z-index: 99;
	float: left;
	border: 3px solid #FFF;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	border-radius: 4px;
 	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,0.2);
	box-shadow: 0 1px 2px rgba(0,0,0,0.2); 
	overflow: hidden;
}

.comments-list .comment-avatar img {
	width: 100%;
	height: 100%;
}

.reply-list .comment-avatar {
	width: 50px;
	height: 50px;
}

.comment-main-level:after {
	content: '';
	width: 0;
	height: 0;
	display: block;
	clear: both;
}
/**
 * Caja del Comentario
 ---------------------------*/
.comments-list .comment-box {
	/* width: 650px; */
	width: 48em;
	float: right;
	position: relative;
	-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	-moz-box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	box-shadow: 0 1px 1px rgba(0,0,0,0.15);
	display: inline-block;
}

.comments-list .comment-box:before, .comments-list .comment-box:after {
	content: '';
	height: 0;
	width: 0;
	position: absolute;
	display: block;
	border-width: 10px 12px 10px 0;
	border-style: solid;
	/* border-color: transparent #FCFCFC; */
	border-color: transparent #dcdcdc;
	top: 8px;
	left: -11px;
}

.comments-list .comment-box:before {
	border-width: 11px 13px 11px 0;
	border-color: transparent rgba(0,0,0,0.05);
	left: -12px;
}

.reply-list .comment-box {
	width: 46rem;
/* 	width: 610px; */
}
.comment-box .comment-head {
	/* background: #52C3BD; */
 	background: #dcdcdc; 
	padding: 10px 12px;
	border-bottom: 1px solid #E5E5E5;
	overflow: hidden;
	-webkit-border-radius: 4px 4px 0 0;
	-moz-border-radius: 4px 4px 0 0;
	border-radius: 4px 4px 0 0;
}

.comment-box .comment-head i {
	float: right;
	margin-left: 14px;
	position: relative;
	top: 2px;
	color: #A6A6A6;
	cursor: pointer;
	-webkit-transition: color 0.3s ease;
	-o-transition: color 0.3s ease;
	transition: color 0.3s ease;
}

.comment-box .comment-head i:hover {
	color: #03658c;
}

.comment-box .comment-name {
	color: #283035;
	font-size: 14px;
	font-weight: 700;
	float: left;
	margin-right: 10px;
}

.comment-box .comment-name a {
	color: #283035;
}

.comment-box .comment-head span {
	float: left;
	color: #999;
	font-size: 13px;
	position: relative;
	top: 1px;
}

.comment-box .comment-content {
	background: #FFF;
	padding: 12px;
	font-size: 15px;
	color: #595959;
	-webkit-border-radius: 0 0 4px 4px;
	-moz-border-radius: 0 0 4px 4px;
	border-radius: 0 0 4px 4px;
	border-left: 1px solid #dcdcdc;
	border-right: 1px solid #dcdcdc;
}

.comment-box .comment-name.by-author, .comment-box .comment-name.by-author a {color: #03658c;}
.comment-box .comment-name.by-author:after {
	/* content: 'autor'; */
	background: #03658c;
	color: #FFF;
	font-size: 12px;
	padding: 3px 5px;
	font-weight: 700;
	margin-left: 10px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/** =====================
 * Responsive
 ========================*/
@media only screen and (max-width: 766px) {
	.comments-container {
		width: 480px;
	}

	.comments-list .comment-box {
		width: 390px;
	}

	.reply-list .comment-box {
		width: 320px;
	}
}

.fa-reply, .fa-heart, .fa-bars{
	float: right;
	margin-left: 0.3em;
	color: #6d7273;
}

.dropdown-menu {
    padding: 0.1rem 0;
}
    
.dropdown-item {
    padding: 0.05rem 1rem;
}
.btn-group, .btn-group-vertical {
    float: right;
}
</style>
</head>
<body>

<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea  class='form-control' id="comment" name="content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                            	<c:if test="${login != null }">
                                	<a href='#' onClick="fn_comment('${bidx }')" class="btn pull-right btn-success">등록</a>
                                </c:if>
                                <c:if test="${login == null }">
                                	<a href='#' onClick="loginalert()" class="btn pull-right btn-success">등록</a>
                                </c:if>
                                
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="b_code" name="bidx" value="${bidx }" />        
    </form>
</div>




<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
 
<script>
function loginalert(){
	alert("로그인 후 등록 가능합니다.");
}
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(bidx){
    $.ajax({
        type:'POST',
        url : "addComment.do",
        data:$("#commentForm").serialize(),
        success : async function(data){
            if(data=="success")
            {
            	const Toast = Swal.mixin({
            		  toast: true,
            		  position: 'top-end',
            		  showConfirmButton: false,
            		  timer: 1000,
            		  timerProgressBar: true,
            		 /*  didOpen: (toast) => {
            		    toast.addEventListener('mouseenter', Swal.stopTimer)
            		    toast.addEventListener('mouseleave', Swal.resumeTimer)
            		  } */
            		})

            		await Toast.fire({
            		  icon: 'success',
            		  title: '작성 완료!'
            		})
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}



/*
 * 대댓글 등록하기(Ajax)
 */
function addComminComm(bidx){
    $.ajax({
        type:'POST',
        url : "addComminComm.do",
        data:$("#commInCommForm").serialize(),
        success : async function(data){
            if(data=="success")
            {
            	const Toast = Swal.mixin({
          		  toast: true,
          		  position: 'top-end',
          		  showConfirmButton: false,
          		  timer: 1000,
          		  timerProgressBar: true,
          		 /*  didOpen: (toast) => {
          		    toast.addEventListener('mouseenter', Swal.stopTimer)
          		    toast.addEventListener('mouseleave', Swal.resumeTimer)
          		  } */
          		})

          		await Toast.fire({
          		  icon: 'success',
          		  title: '답글 작성 완료!'
          		})
          		
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
/*
 * 댓글 수정하기(Ajax)
 */
function fn_modify(cidx){
    $.ajax({
        type:'POST',
        url : "modifyComment.do",
        data:$("#modifyForm").serialize(),
        success : async function(data){
            if(data=="success")
            {
            	const Toast = Swal.mixin({
            		  toast: true,
            		  position: 'top-end',
            		  showConfirmButton: false,
            		  timer: 1000,
            		  timerProgressBar: true,
            		 /*  didOpen: (toast) => {
            		    toast.addEventListener('mouseenter', Swal.stopTimer)
            		    toast.addEventListener('mouseleave', Swal.resumeTimer)
            		  } */
            		})

            		await Toast.fire({
            		  icon: 'success',
            		  title: '수정 완료'
            		})
            		
                getCommentList();
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}

function deleteComment(cidx){
	var check = confirm("정말로 삭제하시겠습니까?");	
	
	if (check){
		$.ajax({
			type:'POST',
			url: "deleteComment.do",
			data: {"cidx":cidx},
			success : async function(data){
				if(data=="success")
				{
					const Toast = Swal.mixin({
		          		  toast: true,
		          		  position: 'top-end',
		          		  showConfirmButton: false,
		          		  timer: 1000,
		          		  timerProgressBar: true,
		          		 /*  didOpen: (toast) => {
		          		    toast.addEventListener('mouseenter', Swal.stopTimer)
		          		    toast.addEventListener('mouseleave', Swal.resumeTimer)
		          		  } */
		          		})

		          		await Toast.fire({
		          		  icon: 'success',
		          		  title: '삭제 완료!'
		          		})
					getCommentList();
				}
			},
			error:function(request,status,error){
	            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }
		});
		//location.href="deleteComment.do?cidx="+cidx+"";
	} else{
		
	}
	
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
/* function getCommentList(){
	var uidx = ${login.uidx}
	console.log(uidx);
    $.ajax({
        type:'GET',
        url : "commentList.do",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                for(i=0; i<data.length; i++){
                    if (data[i].depth==1){
                    	html += "<div style='padding-left:80px'  id='cidx"+data[i].cidx+"'>";
                    }
                    else{
                    	html += "<div id='cidx"+data[i].cidx+"'>";
                    }
                    html += "<div ><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    if (data[i].depth==1){
                    	html += "ㄴ";
                    }
                    html += data[i].content + "<tr><td>"+data[i].datetime+"</td></tr>";
                    if (uidx != null){
                    	if (data[i].depth==1){
	                    	html += "<a href='#' onClick='commentInComment(" + data[i].cidx + "," + data[i].origincidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm '>댓글</a>";
                        } else{
	                    	html += "<a href='#' onClick='commentInComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm '>댓글</a>";
                        }
	                	if (data[i].uidx == uidx){
		                	html += "<div style='float:right'><a href='#' onClick='editComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm' >수정</a>&nbsp";
		                    html += "<a href='#' onClick='deleteComment(" + data[i].cidx + ")' class='btn btn-success btn-sm '>삭제</a></div>";
	                    }
                	}
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}; */
function getCommentList(){
	var uidx = ${login.uidx}
	console.log(uidx);
    $.ajax({
        type:'GET',
        url : "commentList.do",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            var html = "";
            var cCnt = data.length;
            
            if(data.length > 0){
                for(i=0; i<data.length; i++){
                	html += "<div id='cidx"+data[i].cidx+"'>";
                	html += "<div class='comments-container'>";
                	html += "<ul id='comments-list' class='comments-list'>";
                	if (data[i].depth!=1){	
              		html += "<li><div class='comment-main-level'>";
      				html += "<div class='comment-avatar'><img src='<spring:url value = '/images/profile/"+data[i].profile+"'/>' alt=''></div>";
       				html += "<div class='comment-box'><div class='comment-head'><h6 class='comment-name by-author'><a href='http://creaticode.com/blog'>" + data[i].writer + "</a></h6>";
       				html += "<span>"+data[i].datetime+"</span><i class='fa fa-heart'></i>";
       				if (uidx != null){
	       				if (data[i].depth==1){
	       					html += "<div onClick='commentInComment(" + data[i].cidx + "," + data[i].origincidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\", \""+data[i].datetime+"\", \""+data[i].profile+"\")'><i class='fa fa-reply' ></i></div>";
	       				}else{
	       					html += "<i class='fa fa-reply' onClick='commentInComment(" + data[i].cidx + "," + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\", \""+data[i].datetime+"\", \""+data[i].profile+"\")'></i>";
	       				}
	       				if (data[i].uidx == uidx){
		      				html += "<div class='btn-group dropstart'><i class='fa-solid fa-bars' data-bs-toggle='dropdown' aria-expanded='false' ></i><ul class='dropdown-menu'>";
		      				html += "<li style='font-size:12px'><a class='dropdown-item' onClick='editComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' href='#'>수정</a></li>";
		      				html += "<li style='font-size:12px'><a class='dropdown-item' onClick='deleteComment(" + data[i].cidx + ")' href='#'>삭제</a></li></div>";
       					}
       				}
       				
       				
       				html += "</div>";
       			
       				html += "<div class='comment-content'>";
       				html += data[i].content+"</ul></div></div></div>";
                	}
                	else{
       				html += "<ul class='comments-list reply-list'><li><div class='comment-avatar'><img src='<spring:url value = '/images/profile/"+data[i].profile+"'/>' alt=''></div>";
       				html += "<div class='comment-box'><div class='comment-head'><h6 class='comment-name'><a href='http://creaticode.com/blog'>" + data[i].writer + "</a></h6>";
       				html += "<span>"+data[i].datetime+"</span><i class='fa fa-heart'></i>";
       				
       				if (uidx != null){
	       				if (data[i].depth==1){
	       					html += "<div onClick='commentInComment(" + data[i].cidx + "," + data[i].origincidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\", \""+data[i].datetime+"\", \""+data[i].profile+"\")'><i class='fa fa-reply' ></i></div>";
	       				}else{
	       					html += "<i class='fa fa-reply' onClick='commentInComment(" + data[i].cidx + "," + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\", \""+data[i].datetime+"\", \""+data[i].profile+"\")'></i>";
	       				}
	       				if (data[i].uidx == uidx){
		      				html += "<div class='btn-group dropstart'><i class='fa-solid fa-bars' data-bs-toggle='dropdown' aria-expanded='false' ></i><ul class='dropdown-menu'>";
		      				html += "<li style='font-size:12px'><a class='dropdown-item' onClick='editComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' href='#'>수정</a></li>";
		      				html += "<li style='font-size:12px'><a class='dropdown-item' onClick='deleteComment(" + data[i].cidx + ")' href='#'>삭제</a></li></div>";
       					}
       				}
       				
       				
       				html += "</div>";
       			
       				html += "<div class='comment-content'>";
       				
       				html += data[i].content+"</div></div></li>";
       				html += "</ul></li>";
                	}
       				
                		
       				/* html += "</ul></div>";
                	
                    if (data[i].depth==1){
                    	html += "<div style='padding-left:80px'  id='cidx"+data[i].cidx+"'>";
                    }
                    else{
                    	html += "<div id='cidx"+data[i].cidx+"'>";
                    }
                    html += "<div ><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    if (data[i].depth==1){
                    	html += "ㄴ";
                    }
                    html += data[i].content + "<tr><td>"+data[i].datetime+"</td></tr>";
                    if (uidx != null){
                    	if (data[i].depth==1){
	                    	html += "<a href='#' onClick='commentInComment(" + data[i].cidx + "," + data[i].origincidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm '>댓글</a>";
                        } else{
	                    	html += "<a href='#' onClick='commentInComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm '>댓글</a>";
                        }
	                	if (data[i].uidx == uidx){
		                	html += "<div style='float:right'><a href='#' onClick='editComment(" + data[i].cidx + ", \"" + data[i].writer + "\", \"" + data[i].content + "\")' class='btn btn-success btn-sm' >수정</a>&nbsp";
		                    html += "<a href='#' onClick='deleteComment(" + data[i].cidx + ")' class='btn btn-success btn-sm '>삭제</a></div>";
	                    }
                	} */
                    
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
};

/**
 * 댓글 수정 폼
 */
function editComment(cidx, writer, content){
	console.log(cidx, writer, content);
	var profile ="${login.profile}" ;
	var html = "";
	html += "<form id='modifyForm' method='post'>";
	html += "<div id='cidx"+cidx+"'>";
	
	html += "<div class='comments-container'>";
	html += "<ul id='comments-list' class='comments-list'>";
	html += "<li><div class='comment-main-level'><div><table class='table'>";
	html += "<tr><td style='width:20px'><div class='comment-avatar'><img src='<spring:url value = '/images/profile/"+profile+"'/>' alt=''></div></td>";


    html += "<td><textarea class='form-control'  style='height:100px;' name='content'>"+content + "</textarea></td></tr>";
	
    html += "<tr><td>"+writer+"</td>"
    html += "<td><div><a onClick='fn_modify("+cidx+")' class='btn btn-success btn-sm '>저장</a>&nbsp";
    html += "<a onClick='getCommentList()' class='btn btn-success btn-sm '>취소</a></div></td></tr>";
    html += "</table></div>";
    html += "</div>";
    html += "<input type='hidden' id='cidx' name='cidx' value='"+cidx+"' />";
    html += "</div></ul></li>"
    html += "</form>"; 
    
    $('#cidx' + cidx).replaceWith(html);		
    $('#cidx' + cidx + ' #content').focus();
}

/**
 * 대댓글 작성 폼
 */
 
 function commentInComment(cidx, origincidx, writer, content, datetime, profile){
	 	var bidx = ${bidx };
	 	/* var profile ="${login.profile}" ; */
	 	console.log(cidx, origincidx, writer, content, datetime);
		var html = "";
		html += "<form id='commInCommForm' method='post'>";
		
		/* html += "<div style='padding-left:80px' id='cidx"+cidx+"'>";
	    html += "<div><table class='table'><h6><strong>"+writer+"</strong></h6>";
	    html += content + "<tr><td></td></tr>";
	    html += "<div style='float:right'><a onClick='fn_modify("+cidx+")' class='btn btn-success btn-sm '>저장</a>&nbsp";
	    html += "<a onClick='getCommentList()' class='btn btn-success btn-sm '>취소</a></div>";
	    html += "</table></div>";
	    html += "</div>"; */
	    
	    html += "<div id='cidx"+cidx+"'>";
	    html += "<div class='comments-container'>";
	    html += "<ul id='comments-list' class='comments-list'>";
  		html += "<li><div class='comment-main-level'>";
		html += "<div class='comment-avatar'><img src='<spring:url value = '/images/profile/"+profile+"'/>' alt=''></div>";
		html += "<div class='comment-box'><div class='comment-head'><h6 class='comment-name by-author'><a href='http://creaticode.com/blog'>" + writer + "</a></h6>";
		html += "<span>"+datetime+"</span><i class='fa fa-heart'></i>";
		html += "</div><div class='comment-content'>";
		html += content+"</div></div>";
		html += "</div></div>";
	    
	    html += "<input type='hidden' id='cidx' name='cidx' value='"+origincidx+"' />";
	    html += "<div style='padding-left:6.8em'><table class='table'><tr><td>";
	    html += "<textarea  class='form-control' style='height:100px;' id='comment' name='content' placeholder='댓글을 입력하세요'></textarea><br>";
	    html += "<div><a href='#' onClick='addComminComm("+bidx+")' class='btn pull-right btn-success'>등록</a></div>";
	    html += "</td></tr></table></div>";
	    html += "<input type='hidden' id='bidx' name='bidx' value='"+bidx+"' />";
	    html += "</form>";
	    
	    $('#cidx' + cidx).replaceWith(html);		
}
 
</script>
</body>
</html>