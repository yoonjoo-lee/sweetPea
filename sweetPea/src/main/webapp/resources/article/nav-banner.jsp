	<div class="header-slide">
		<div class="header-slides fade">
			<img alt="nav-banner-1" src="<%=request.getContextPath()%>/resources/images/banner/banner-rain.png">
		</div>
		<div class="header-slides fade">
			<img alt="nav-banner-2" src="<%=request.getContextPath()%>/resources/images/banner/banner-covid.png">
		</div>
		<div class="header-slides fade">
			<img alt="nav-banner-3" src="<%=request.getContextPath()%>/resources/images/banner/banner-join.png" onclick='location.href="<%=request.getContextPath()%>/user/join.do"'>
		</div>
		<div class="header-slides fade">
			<img alt="nav-banner-4" src="<%=request.getContextPath()%>/resources/images/banner/banner-covid2.png">
		</div>
		<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
		<a class="next" onclick="plusSlides(1)">&#10095;</a>
		<div class="header-slide-dot" style="text-align: center;">
			<span class="dot" onclick="currentSlide(1)"></span>
			<span class="dot" onclick="currentSlide(2)"></span>
			<span class="dot" onclick="currentSlide(3)"></span>
			<span class="dot" onclick="currentSlide(4)"></span>
		</div>
	</div>
	<script>
		var slideIndex = 0;
		showSlides();
		function plusSlides(n){
			showSlides_(slideIndex += n);
		}
		function currentSlide(n){
			showSlides_(slideIndex = n);
		}
		function showSlides_(n) {
			  var i;
			  var slides = document.getElementsByClassName("header-slides");
			  var dots = document.getElementsByClassName("dot");
			  if (n > slides.length) {slideIndex = 1}    
			  if (n < 1) {slideIndex = slides.length}
			  for (i = 0; i < slides.length; i++) {
			      slides[i].style.display = "none";  
			  }
			  for (i = 0; i < dots.length; i++) {
			      dots[i].className = dots[i].className.replace(" active", "");
			  }
			  slides[slideIndex-1].style.display = "block";  
			  dots[slideIndex-1].className += " active";
			}
		
		function showSlides() {
		    var i;
		    var slides = document.getElementsByClassName("header-slides");
		    var dots = document.getElementsByClassName("dot");
		    for (i = 0; i < slides.length; i++) {
		       slides[i].style.display = "none";  
		    }
		    slideIndex++;
		    if (slideIndex > slides.length) {slideIndex = 1}    
		    for (i = 0; i < dots.length; i++) {
		        dots[i].className = dots[i].className.replace(" active", "");
		    }
		    slides[slideIndex-1].style.display = "block";  
		    dots[slideIndex-1].className += " active";
		    setTimeout(showSlides, 5000);
		}
	</script>