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
                            <textarea style="width: 1100px" rows="3" cols="30" id="comment" name="content" placeholder="댓글을 입력하세요"></textarea>
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
function fn_comment(code){
    
    $.ajax({
        type:'POST',
        url : "addComment.do",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	alert('등록완료');
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
function fn_modify(code){
    
    $.ajax({
        type:'POST',
        url : "modifyComment.do",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	alert('수정완료');
                getCommentList();
                $("#comment").val("");
            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
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
function getCommentList(){
	var uidx = ${login.uidx}
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
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].writer+"</strong></h6>";
                    html += data[i].content + "<tr><td></td></tr>";
                    if (uidx != null){
	                	if (data[i].uidx == uidx){
		                	html += "<div style='float:right'><a href='#' class='btn btn-success btn-sm' >수정</a>&nbsp";
		                    html += "<a href='#' class='btn btn-success btn-sm '>삭제</a></div>";
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
};
 
</script>
</body>
</html>