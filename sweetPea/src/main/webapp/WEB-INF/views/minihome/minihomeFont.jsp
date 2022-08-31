<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<title>Insert title here</title>
<style>
body{
font-family: ${myMini.font};
}
.EF_hyunydororong{
font-family: EF_hyunydororong;
}
.MabinogiClassicR{
font-family: MabinogiClassicR;
}
.HBIOS-SYS{
font-family: HBIOS-SYS;
} 
.MYYeongnamnu{
font-family: MYYeongnamnu;
}
.fontBox{
 float:left; 
 width:210px;
 height: 200px;
 /* border: 1px solid silver; */
 border-radius: 10%;
 margin: 3px;
 padding: 5px;
 box-shadow: 1px 1px 5px 1px black;
}
/* 변경 버튼  */
#changebtn{
float:right; 
width:60px; 
margin:5px 10px;
vertical-align: bottom;
}
textarea{
width:195px;
height:120px;
}
</style>

<c:if test="${device eq 'MOBILE'}">
<style>
h3{
	text-align: center;
}
.fontFullBox{
	display: flex;
	justify-content: space-between;
    flex-wrap: wrap;
}
.fontBox {
    width: 44vw;
    padding: 2vh 3vw;
    margin: 2vh 3vw;
    height: 100%;
    font-size:5vw;
}
textarea{
	width: 100%;
    height: 15vh;
    font-size: 4vw;
}
#changebtn{
	float: none;
    width: 100%;
    margin: 0 auto;
    display: block;
}
</style>
</c:if>

</head>
<body>
<h3>내글꼴 </h3>
<div class="fontFullBox">
<!-- 글꼴 카테고리 4 --> 
<div class="EF_hyunydororong fontBox">
마비옛체
<textarea>싫은 것만 피하면 좋은 걸 찾을 수 없어</textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=EF_hyunydororong&category=4'">변경</button> 
</div>
<div class="MabinogiClassicR fontBox">
혀니도로롱
<textarea>고양이 코고는 소리는 도로롱</textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=MabinogiClassicR&category=4'">변경</button> 
</div> 
<div class="HBIOS-SYS fontBox">
HBIOS-SYS
<textarea>내 취향을 알면 휘둘리지 않아 </textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=HBIOS-SYS&category=4'">변경</button>
</div> 
<div class="MYYeongnamnu fontBox">
밀양영남루체
<textarea>월요일은 피곤할 수 밖에 </textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=MYYeongnamnu&category=4'">변경</button> 
</div> 
</div>
</body>
</html>