<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="<%= request.getContextPath()%>/resources/js/jquery-3.6.0.min.js"></script>
<style>
	#img{
		width: 30%;
		height: 30%;
		margin: 0 auto;
		display: block;
	}
	h4{
		text-align: center;
	}
	.inputBox{
		width: 60%;
		margin: 0 auto;
	}
	.inputIdx{
		font-size: 1em;
		width: 100%;
		height: 2em;
		border: 1px solid black;
		margin: 1em 0;
	}
	.inputIdx>p{
		display: inline-block;
		margin: 0.3em 0.8em;
	}
	.aBox{
		float: right;
	}
	.aBox>a{
		color: inherit;
		text-decoration: none;
	}

</style>
</head>
<body>
	<br>
	<h4>item shop main</h4>
	
	<div class="search_option_wrap">
		<div class="saerch_option_list">
			<div class="search_option_item">
					<div class="search_category_title">종류별,색상별,테마별,가격별 등</div>
				<div class="search_category_contents">
					<ul>
						<li>
							<label class="item_checkbox">
								<input type="checkbox" name="category" value="미니룸"><span class="item_text">미니룸</span>
							</label>
						</li>
						<li>
							<label class="item_checkbox">
								<input type="checkbox" name="category" value="BGM"><span class="item_text">BGM</span>
							</label>
						</li>
						<li>
							<label class="item_checkbox">
								<input type="checkbox" name="category" value="커스텀"><span class="item_text">커스텀</span>
							</label>
						</li>
					</ul>
				</div>
			</div>
		
		</div>
	
	</div>
	
</body>
</html>

















