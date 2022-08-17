<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
div{
 float:left; 
 width:210px;
 height: 200px;
 /* border: 1px solid silver; */
 border-radius: 10%;
 margin: 3px;
 padding: 5px;
 box-shadow:2px 3px 5px 0px silver;
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
</head>
<body>
<h3>내글꼴 </h3>

<!-- 일단 글꼴을 카테고리 2로 함 -->
<div class="EF_hyunydororong">
마비옛체
<textarea>싫은 것만 피하면 좋은 걸 찾을 수 없어</textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=EF_hyunydororong&category=2'">변경</button><br> 
</div>
<div class="MabinogiClassicR">
혀니도로롱
<textarea>고양이 코고는 소리는 도로롱</textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=MabinogiClassicR&category=2'">변경</button><br> 
</div> 
<div class="HBIOS-SYS">
HBIOS-SYS
<textarea>내 취향을 알면 휘둘리지 않아 </textarea>
<button id="changebtn" class="btn btn-secondary btn-sm" onclick="location.href='<%=request.getContextPath()%>/miniroomboard2/changeMyminihome.do?uidx=${login.uidx }&item=HBIOS-SYS&category=2'">변경</button><br> 
</div> 
</body>
</html>