<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath()%>/resources/css/section.css" rel="stylesheet" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<title>item file choice</title>
<style>
/* 버튼  */

.button.dark {
  --background: #2F3545;
  --shadow: 0 2px 8px -1px rgba(21, 25, 36, 0.32);
  --shadow-hover: 0 4px 20px -2px rgba(21, 25, 36, 0.5);
}
.button.white {
  --background: #fff;
  --text: #275efe;
  --shadow: 0 2px 8px -1px rgba(18, 22, 33, 0.04);
  --shadow-hover: 0 4px 20px -2px rgba(18, 22, 33, 0.12);
}
.button.fast {
  --duration: .32s;
}

.button {
  --background: #275efe;
  --text: #fff;
  --font-size: 100px;
  --duration: .44s;
  --move-hover: -4px;
  --shadow: 0 2px 8px -1px rgba(39, 94, 254, 0.32);
  --shadow-hover: 0 4px 20px -2px rgba(39, 94, 254, 0.5);
  --font-shadow: var(--font-size);
  padding: 16px 32px;
  font-family: "Roboto";
  font-weight: 500;
  line-height: var(--font-size);
  border-radius: 24px;
  display: block;
  outline: none;
  text-decoration: none;
  font-size: var(--font-size);
  letter-spacing: 0.5px;
  background: var(--background);
  color: var(--text);
  box-shadow: var(--shadow);
  transform: translateY(var(--y)) translateZ(0);
  transition: transform var(--duration) ease, box-shadow var(--duration) ease;
}
.button div {
  display: flex;
  overflow: hidden;
  text-shadow: 0 var(--font-shadow) 0 var(--text);
}
.button div span {
  display: block;
  -webkit-backface-visibility: hidden;
          backface-visibility: hidden;
  font-style: normal;
  transition: transform var(--duration) ease;
  transform: translateY(var(--m)) translateZ(0);
}
.button div span:nth-child(1) {
  transition-delay: 0.05s;
}
.button div span:nth-child(2) {
  transition-delay: 0.1s;
}
.button div span:nth-child(3) {
  transition-delay: 0.15s;
}
.button div span:nth-child(4) {
  transition-delay: 0.2s;
}
.button div span:nth-child(5) {
  transition-delay: 0.25s;
}
.button div span:nth-child(6) {
  transition-delay: 0.3s;
}
.button div span:nth-child(7) {
  transition-delay: 0.35s;
}
.button div span:nth-child(8) {
  transition-delay: 0.4s;
}
.button div span:nth-child(9) {
  transition-delay: 0.45s;
}
.button div span:nth-child(10) {
  transition-delay: 0.5s;
}
.button div span:nth-child(11) {
  transition-delay: 0.55s;
}
.button:hover {
  --y: var(--move-hover);
  --shadow: var(--shadow-hover);
}
.button:hover span {
  --m: calc(var(--font-size) * -1);
}
.button.reverse {
  --font-shadow: calc(var(--font-size) * -1);
}
.button.reverse:hover span {
  --m: calc(var(--font-size));
}

html {
  box-sizing: border-box;
  -webkit-font-smoothing: antialiased;
}

* {
  box-sizing: inherit;
}
*:before, *:after {
  box-sizing: inherit;
}

body {
  min-height: 45vh;
  display: flex;
  font-family: "Roboto", Arial;
  justify-content: center;
  align-items: center;
  background: #E4ECFA;
}
body .button {
  margin: 0 12px;
}
body .dribbble {
  position: fixed;
  display: block;
  right: 20px;
  bottom: 20px;
}
body .dribbble img {
  display: block;
  height: 28px;
}

</style>

<c:if test="${device eq 'MOBILE'}">
<style>
body{
	display: inherit !important;
}
a{
    width: 80%;
    margin: 5vh auto !important;
}
a>div{
	width: 82%;
    margin: 0 auto;
}
</style>
</c:if>

</head>
<body>

<a  onclick="location.href = '<%=request.getContextPath()%>/item/itemWrite.do'"  class="button reverse dark">ITEM</a>
<a  onclick="bgmWrite()"  class="button reverse dark">BGM</a>
<%-- <a  onclick="location.href = '<%=request.getContextPath()%>/item/bgmFile.do'"  class="button reverse dark">BGM</a> --%>

<script type="text/javascript">
/* <!-- 버튼  --> */
document.querySelectorAll('.button').forEach(button => button.innerHTML = '<div><span>' + button.textContent.trim().split('').join('</span><span>') + '</span></div>');

/* BGM 준비중 */
	function bgmWrite(){
		Swal.fire({
		      title: '준비중입니다.',
		      text: 'BGM은 추후에 추가될 예정입니다.',
		      icon: 'info',
				timer: 4000,
			    timerProgressBar: true,
	    });
} 

</script>

</body>
</html>







