<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- 부트스트랩 아이콘 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
</head>
<title>item file choice</title>

</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-sm-2">
            <div class="serviceBox" onclick="location.href = '<%=request.getContextPath()%>/item/itemWrite.do'">
                <h3 class="title">ITEM</h3>
            </div>
        </div>

        <div class="col-md-6 col-sm-2">
            <div class="serviceBox"  onclick="location.href='<%=request.getContextPath()%>/item/bgmFile.do'">
                <h3 class="title">BGM</h3>
            </div>
        </div>

    </div>
</div>
</body>
</html>