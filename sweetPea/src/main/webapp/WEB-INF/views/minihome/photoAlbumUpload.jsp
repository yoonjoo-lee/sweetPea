<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/minihome/font.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<!-- slick slider -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>

<style>
.body {
	/* overflow-y: scroll; */
	font-family: ${myMini.font};
}
/* 사진업로드 style */
.photo_box{margin:0 auto ;max-width:500px;} 
.upload_btn{overflow:hidden;width:100%;margin-top:20px;}
.upload_btn #input_img{display:none;}
.upload_btn .upload, .upload_btn a{float:left;width:100%;text-align:center;text-decoration: none;color:#fff;padding:15px 0;}
/* .upload_btn .upload, .upload_btn a{float:left;width:calc(50% - 10px);text-align:center;text-decoration: none;color:#fff;padding:15px 0;} */
.upload_btn .upload{background-color:#007500;} 
.upload_btn a{margin-left:20px; background:#ccc;}
.photo_them{position:relative;margin-top:0px;width:100%;height:250px;background:#eee;}
.them_img, .result_box{position:absolute;top:0;left:0;width:100%;height:100%;}
.result_box{background:#fff;}
.them_img img, .result_box img{display:block;margin:0 auto;height:100%;}
#complete{display:block;margin-top:0px;padding:15px 0;width:100%;text-align:center;color:#fff;text-decoration: none;background-color: #007500;}
</style>

<body class="body">
<br><h3 style="text-align:center;">사진첩 등록하기</h3>

<form action="photoAlbumUpload.do" method="post" enctype="multipart/form-data">
<div class="photo_box">
			<input id="input_img" multiple="multiple" type="file" style="display:none;" name="file" accept="image/jpeg, image/png, image/gif"> 
	<div class="upload_btn" id="uploadButton" style="cursor:pointer">
		<div class="upload">
			<label for="input_img">사진 업로드</label>
		</div>
	</div>
	<div class="photo_them">
		<div class="them_img">
			<img class="profile-image" name="newImg" id="newImg">
		</div>
	</div>
	<div class="form-floating">
		<textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea" name="title"></textarea>
		<label for="floatingTextarea">제목</label>비밀글<input type="checkbox" name="secret" value="Y" style="cursor:pointer">
	</div>
	<input type="submit" class="btn btn-success" id="complete" value="업로드" disabled="disabled" style="cursor:pointer">
</div>
<input type="hidden" name="category" value=${category }>


		<script>
			$("#input_img").on("change", function(event) {
				var file = event.target.files[0];
			/* console.log('event.target.files[0]',event.target.files[0],'event.target.files[1]',event.target.files[1], 'file사이즈', event.target.files) */
			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#newImg").attr("src", e.target.result);
					$('#complete').attr('disabled', false);
					
				/* 	var newDIV = document.createElement("div");​ */
				}
				/* 
					var sel_files = [];
				
					imageLoader = function(file){
				      sel_files.push(file);
				      var reader = new FileReader();
				      reader.onload = function(ee){
				        let img = document.createElement('img')
				        img.setAttribute('style', img_style)
				        img.src = ee.target.result;
				        attZone.appendChild(makeDiv(img, file));
				      }
				      
				      reader.readAsDataURL(file);
				    } */
				reader.readAsDataURL(file);
			});
			$("#uploadButton").on("click",function(){
				$("#input_img").click();
			});
		</script>
	</form>
	
	<!-- stlye 은 slick 영역 확인용 -->
<!-- 	<div style="padding:300px 100px; background-color: skyblue;">
	  	<div id="slider-div"  >
		    <div>1</div>
		    <div>2</div>
		    <div>3</div>
		    <div>4</div>
		    <div>5</div>
		    <div>6</div>
		    <div>7</div>
		    <div>8</div>
		    <div>9</div>
		    <div>10</div>
	  	</div>
	</div>	
	<script>
	$(document).ready(function(){
	    $("#slider-div").slick();
	}); -->
  	
  	
  	 <!-- $(function(){
			$('#slider-div').slick({
				slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
				infinite : true, 	//무한 반복 옵션	 
				slidesToShow : 4,		// 한 화면에 보여질 컨텐츠 개수
				slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
				speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
				arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
				dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
				autoplay : true,			// 자동 스크롤 사용 여부
				autoplaySpeed : 10000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
				pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
				vertical : false,		// 세로 방향 슬라이드 옵션
				prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
				nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
				dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
				draggable : true, 	//드래그 가능 여부 
				
				responsive: [ // 반응형 웹 구현 옵션
					{  
						breakpoint: 960, //화면 사이즈 960px
						settings: {
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:3 
						} 
					},
					{ 
						breakpoint: 768, //화면 사이즈 768px
						settings: {	
							//위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
							slidesToShow:2 
						} 
					}
				]

			});
  		})  -->
<!-- 	<script>
	$(function(){
	const Images = () => {
		  const [showImages, setShowImages] = useState([]);

		  // 이미지 상대경로 저장
		  const handleAddImages = (event) => {
		    const imageLists = event.target.files;
		    let imageUrlLists = [...showImages];

		    for (let i = 0; i < imageLists.length; i++) {
		      const currentImageUrl = URL.createObjectURL(imageLists[i]);
		      imageUrlLists.push(currentImageUrl);
		    }

		    if (imageUrlLists.length > 10) {
		      imageUrlLists = imageUrlLists.slice(0, 10);
		    }

		    setShowImages(imageUrlLists);
		  };

		  // X버튼 클릭 시 이미지 삭제
		  const handleDeleteImage = (id) => {
		    setShowImages(showImages.filter((_, index) => index !== id));
		  };

		  return (
		    <div className={classes.addPicture}>
		      <label htmlFor="input-file" className={classes.addButton} onChange={handleAddImages}>
		        <input type="file" id="input-file" multiple className={classes.addButton} />
		        <Plus fill="#646F7C" />
		        <span>사진추가</span>
		      </label>

		      // 저장해둔 이미지들을 순회하면서 화면에 이미지 출력
		      {showImages.map((image, id) => (
		        <div className={classes.imageContainer} key={id}>
		          <img src={image} alt={`${image}-${id}`} />
		          <Delete onClick={() => handleDeleteImage(id)} />
		        </div>
		      ))}
		    </div>
		  );
		};
	});
	</script>	 -->
</body>
</html>