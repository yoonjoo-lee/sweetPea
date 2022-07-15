<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int category = Integer.parseInt(request.getParameter("category"));%>
<%=category%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  jQuery, bootstrap -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    
    <!-- tagify -->
    <script src="https://unpkg.com/@yaireo/tagify"></script>
	<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
	<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
	
	<script>
	$(function(){
		$("#header").load("<%= request.getContextPath()%>/resources/article/header.jsp");
		$("#nav").load("<%= request.getContextPath()%>/resources/article/nav.jsp");
		$("#section").load("<%= request.getContextPath()%>/resources/article/section.jsp");
		$("#footer").load("<%= request.getContextPath()%>/resources/article/footer.jsp");
	});
	</script>
<style>
#view{
	width: 60%;
	margin: 0 auto;
	margin-bottom: 15em;
}
#footer{
	width: 100%;
	bottom: 0;
	left: 0;
	position: absolute;
	
}

.advance .tagify__tag{
    --tag-hover: var(--tag-bg);
}

#title-box{ 
    width:100%; 
    display:flex; 
    justify-content: center;
}

#title{ 
    width:100%; 
    height:40px; 
    border:1px #D8D8D8 solid; 
    border-radius: 5px; 
    margin:0; 
    padding:0 10px; 
    margin-bottom:10px; 
    font-family: 'Apple SD Gothic Neo';
    font-size:14px; 
}
</style>
</head>

<body>
<header id="header"></header>
<br>
<div id="view">
mainboard 작성
${category }
<input name='tags3' pattern='^[A-Za-z_✲ ]{1,15}$'>

<form action="" method="post">
<div id="title-box">
	<input style="ime-mode:disabled;"id="title" name="title" placeholder="제목을 입력해 주세요">
</div>

<textarea id="summernote" name="content"></textarea>
<input type="hidden" name="category" value=${category }>

<button type="submit">작dd성dd</button>
</form>
</div>
<br>
<footer id="footer"></footer>


<script>
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400
    });
});








var input = document.querySelector('input[name=tags3]'),
tagify = new Tagify(input, {
    pattern             : /^.{0,20}$/,  // Validate typed tag(s) by Regex. Here maximum chars length is defined as "20"
    delimiters          : ",| ",        // add new tags when a comma or a space character is entered
    keepInvalidTags     : true,         // do not remove invalid tags (but keep them marked as invalid)
    editTags            : {
        clicks: 2,              // single click to edit a tag
        keepInvalid: false      // if after editing, tag is invalid, auto-revert
    },
    maxTags             : 6,
    blacklist           : ["foo", "bar", "baz"],
    whitelist           : ["빨강","주황","노랑","초록","파랑","하늘","남색","보라","relaxation","fraud","attractive","soft","forecast","point","thank","stage","eliminate","effective","flood","passive","skilled","separation","contact","compromise","reality","district","nationalist","leg","porter","conviction","worker","vegetable","commerce","conception","particle","honor","stick","tail","pumpkin","core","mouse","egg","population","unique","behavior","onion","disaster","cute","pipe","sock","dialect","horse","swear","owner","cope","global","improvement","artist","shed","constant","bond","brink","shower","spot","inject","bowel","homosexual","trust","exclude","tough","sickness","prevalence","sister","resolution","cattle","cultural","innocent","burial","bundle","thaw","respectable","thirsty","exposure","team","creed","facade","calendar","filter","utter","dominate","predator","discover","theorist","hospitality","damage","woman","rub","crop","unpleasant","halt","inch","birthday","lack","throne","maximum","pause","digress","fossil","policy","instrument","trunk","frame","measure","hall","support","convenience","house","partnership","inspector","looting","ranch","asset","rally","explicit","leak","monarch","ethics","applied","aviation","dentist","great","ethnic","sodium","truth","constellation","lease","guide","break","conclusion","button","recording","horizon","council","paradox","bride","weigh","like","noble","transition","accumulation","arrow","stitch","academy","glimpse","case","researcher","constitutional","notion","bathroom","revolutionary","soldier","vehicle","betray","gear","pan","quarter","embarrassment","golf","shark","constitution","club","college","duty","eaux","know","collection","burst","fun","animal","expectation","persist","insure","tick","account","initiative","tourist","member","example","plant","river","ratio","view","coast","latest","invite","help","falsify","allocation","degree","feel","resort","means","excuse","injury","pupil","shaft","allow","ton","tube","dress","speaker","double","theater","opposed","holiday","screw","cutting","picture","laborer","conservation","kneel","miracle","brand","nomination","characteristic","referral","carbon","valley","hot","climb","wrestle","motorist","update","loot","mosquito","delivery","eagle","guideline","hurt","feedback","finish","traffic","competence","serve","archive","feeling","hope","seal","ear","oven","vote","ballot","study","negative","declaration","particular","pattern","suburb","intervention","brake","frequency","drink","affair","contemporary","prince","dry","mole","lazy","undermine","radio","legislation","circumstance","bear","left","pony","industry","mastermind","criticism","sheep","failure","chain","depressed","launch","script","green","weave","please","surprise","doctor","revive","banquet","belong","correction","door","image","integrity","intermediate","sense","formal","cane","gloom","toast","pension","exception","prey","random","nose","predict","needle","satisfaction","establish","fit","vigorous","urgency","X-ray","equinox","variety","proclaim","conceive","bulb","vegetarian","available","stake","publicity","strikebreaker","portrait","sink","frog","ruin","studio","match","electron","captain","channel","navy","set","recommend","appoint","liberal","missile","sample","result","poor","efflux","glance","timetable","advertise","personality","aunt","dog"],
    transformTag        : transformTag,
    backspace           : "edit",
    placeholder         : "Type something",
    /* dropdown : {
        enabled: 1,            // show suggestion after 1 typed character
        fuzzySearch: false,    // match only suggestions that starts with the typed characters
        position: 'text',      // position suggestions list next to typed text
        caseSensitive: true,   // allow adding duplicate items if their case is different
    },
    templates: {
        dropdownItemNoMatch: function(data) {
            return '<div class='\${this.settings.classNames.dropdownItem}' tabindex="0" role="option">
                No suggestion found for: <strong>${data.value}</strong>
            </div>'
        }
    } */
})

//generate a random color (in HSL format, which I like to use)
function getRandomColor(){
function rand(min, max) {
    return min + Math.random() * (max - min);
}

var h = rand(1, 360)|0,
    s = rand(40, 70)|0,
    l = rand(65, 72)|0;

return 'hsl(' + h + ',' + s + '%,' + l + '%)';
}

function transformTag( tagData ){
tagData.color = getRandomColor();
tagData.style = "--tag-bg:" + tagData.color;

if( tagData.value.toLowerCase() == 'shit' )
    tagData.value = 's✲✲t'
}

tagify.on('add', function(e){
console.log(e.detail)
})

tagify.on('invalid', function(e){
console.log(e, e.detail);
})

var clickDebounce;

tagify.on('click', function(e){
const {tag:tagElm, data:tagData} = e.detail;

// a delay is needed to distinguish between regular click and double-click.
// this allows enough time for a possible double-click, and noly fires if such
// did not occur.
clearTimeout(clickDebounce);
clickDebounce = setTimeout(() => {
    tagData.color = getRandomColor();
    tagData.style = "--tag-bg:" + tagData.color;
    tagify.replaceTag(tagElm, tagData);
}, 200);
})

tagify.on('dblclick', function(e){
// when souble clicking, do not change the color of the tag
clearTimeout(clickDebounce);
})
</script>
</body>
</html>