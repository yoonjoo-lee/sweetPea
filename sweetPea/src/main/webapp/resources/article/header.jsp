<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="<%=request.getContextPath()%>/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet" />
        
<style>


/* List styles */

.list {

    -webkit-transform-style: preserve-3d;
    -moz-transform-stle: preserve-3d;
    -ms-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    transform-style: preserve-3d;
    
    text-transform: uppercase;
    position: absolute; 
    
    margin-bottom: 100px;
}

.list a {
    
    display: block;
    color: #fff;
}

.list a:hover {
    text-indent: 20px;
}

.list dt{

    text-indent: 10px;
    line-height: 55px;
    margin: 0;
    height: 55px;
    width: 90px;
    color: #fff;
}
.list dd {

    text-indent: 10px;
    line-height: 55px;
    background: #52C3BD;
    margin: 0;
    height: 55px;
    width: 90px;
    color: #fff;
}

.list dt {

    /* Since we're hiding elements behind here, we need it in 3d */
    -webkit-transform: translateZ(0.3px);
    -moz-transform: translateZ(0.3px);
    -ms-transform: translateZ(0.3px);
    -o-transform: translateZ(0.3px);
    transform: translateZ(0.3px);

    text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
    font-size: 15px;
}

.list dd {

    border-top: 1px dashed rgba(255,255,255,0.3);
    line-height: 35px;
    font-size: 11px;
    height: 35px;
    margin: 0;
}


/* Individual styles */

.maki dt {opacity: 1;} 
/* .maki dt { background: #52C3BD; } */

 .maki dd, .maki a { background: steelblue; }

.maki a:hover { background: steelblue; }
/* steelblue   #52C3BD*/

.maki {

    -webkit-transform: perspective(600px) translateZ(1px) !important;
    -moz-transform: perspective(600px) translateZ(1px) !important;
    -ms-transform: perspective(600px) translateZ(1px) !important;
    -o-transform: perspective(600px) translateZ(1px) !important;
    transform: perspective(600px) translateZ(1px) !important;

    
}
</style>    
<script type="text/javascript">
(function($) {

    // Global initialisation flag
    var initialized = false;

    // For detecting browser prefix and capabilities
    var el = document.createElement( 'div' );
    var re = /^(Moz|(w|W)ebkit|O|ms)(?=[A-Z])/;

    // Establish vendor prefix and CSS 3D support
    var vendor = (function() { for ( var p in el.style ) if( re.test(p) ) return p.match(re)[0]; })() || '';
    var canRun = vendor + 'Perspective' in el.style;
    var prefix = '-' + vendor.toLowerCase() + '-';

    var $this, $root, $base, $kids, $node, $item, $over, $back;
    var wait, anim, last;

    // Public API
    var api = {

        // Toggle open / closed
        toggle: function() {

            $this = $( this );
            $this.makisu( $this.hasClass( 'open' ) ? 'close' : 'open' );
        },

        // Trigger the unfold animation
        open: function( speed, overlap, easing ) {

            // Cache DOM references
            $this = $(this);
            $root = $this.find( '.root' );
            $kids = $this.find( '.node' ).not( $root );

            // Establish values or fallbacks
            speed = utils.resolve( $this, 'speed', speed );
            easing = utils.resolve( $this, 'easing', easing );
            overlap = utils.resolve( $this, 'overlap', overlap );

            $kids.each( function( index, el ) {

                // Establish settings for this iteration
                anim = 'unfold' + ( !index ? '-first' : '' );
                last = index === $kids.length - 1;
                time = speed * ( 1 - overlap );
                wait = index * time;

                // Cache DOM references
                $item = $( el );
                $over = $item.find( '.over' );

                // Element animation
                $item.css(utils.prefix({
                    'transform': 'rotateX(180deg)',
                    'animation': anim + ' ' + speed + 's ' + easing + ' ' + wait + 's 1 normal forwards'
                }));

                // Shading animation happens when the next item starts
                if ( !last ) wait = ( index + 1 ) * time;

                // Shading animation
                $over.css(utils.prefix({
                    'animation': 'unfold-over ' + (speed * 0.45) + 's ' + easing + ' ' + wait + 's 1 normal forwards'
                }));
            });

            // Add momentum to the container
            $root.css(utils.prefix({
                'animation': 'swing-out ' + ( $kids.length * time * 1.4 ) + 's ease-in-out 0s 1 normal forwards'
            }));

            $this.addClass( 'open' );
        },

        // Trigger the fold animation
        close: function( speed, overlap, easing ) {

            // Cache DOM references
            $this = $(this);
            $root = $this.find( '.root' );
            $kids = $this.find( '.node' ).not( $root );

            // Establish values or fallbacks
            speed = utils.resolve( $this, 'speed', speed ) * 0.66;
            easing = utils.resolve( $this, 'easing', easing );
            overlap = utils.resolve( $this, 'overlap', overlap );

            $kids.each( function( index, el ) {

                // Establish settings for this iteration
                anim = 'fold' + ( !index ? '-first' : '' );
                last = index === 0;
                time = speed * ( 1 - overlap );
                wait = ( $kids.length - index - 1 ) * time;

                // Cache DOM references
                $item = $( el );
                $over = $item.find( '.over' );

                // Element animation
                $item.css(utils.prefix({
                    'transform': 'rotateX(0deg)',
                    'animation': anim + ' ' + speed + 's ' + easing + ' ' + wait + 's 1 normal forwards'
                }));

                // Adjust delay for shading
                if ( !last ) wait = ( ( $kids.length - index - 2 ) * time ) + ( speed * 0.35 );

                // Shading animation
                $over.css(utils.prefix({
                    'animation': 'fold-over ' + (speed * 0.45) + 's ' + easing + ' ' + wait + 's 1 normal forwards'
                }));
            });

            // Add momentum to the container
            $root.css(utils.prefix({
                'animation': 'swing-in ' + ( $kids.length * time * 1.0 ) + 's ease-in-out 0s 1 normal forwards'
            }));

            $this.removeClass( 'open' );
        }
    };

    // Utils
    var utils = {

        // Resolves argument values to defaults
        resolve: function( $el, key, val ) {
            return typeof val === 'undefined' ? $el.data( key ) : val;
        },

        // Prefixes a hash of styles with the current vendor
        prefix: function( style ) {
            
            for ( var key in style ) {
                style[ prefix + key ] = style[ key ];
            }

            return style;
        },

        // Inserts rules into the document styles
        inject: function( rule ) {

            try {

                var style = document.createElement( 'style' );
                style.innerHTML = rule;
                document.getElementsByTagName( 'head' )[0].appendChild( style );

            } catch ( error ) {}
        }
    };

    // Element templates
    var markup = {
        node: '<span class="node"/>',
        back: '<span class="face back"/>',
        over: '<span class="face over"/>'
    };

    // Plugin definition
    $.fn.makisu = function( options ) {

        // Notify if 3D isn't available
        if ( !canRun ) {

            var message = 'Failed to detect CSS 3D support';

            if( console && console.warn ) {
                
                // Print warning to the console
                console.warn( message );

                // Trigger errors on elements
                this.each( function() {
                    $( this ).trigger( 'error', message );
                });
            }

            return;
        }

        // Fires only once
        if ( !initialized ) {

            initialized = true;

            // Unfold
            utils.inject( '@' + prefix + 'keyframes unfold        {' +

                '0%   {' + prefix + 'transform: rotateX(180deg);  }' +
                '50%  {' + prefix + 'transform: rotateX(-30deg);  }' +
                '100% {' + prefix + 'transform: rotateX(0deg);    }' +

                '}');

            // Unfold (first item)
            utils.inject( '@' + prefix + 'keyframes unfold-first  {' +

                '0%   {' + prefix + 'transform: rotateX(-90deg);  }' +
                '50%  {' + prefix + 'transform: rotateX(60deg);   }' +
                '100% {' + prefix + 'transform: rotateX(0deg);    }' +

                '}');

            // Fold
            utils.inject( '@' + prefix + 'keyframes fold          {' +

                '0%   {' + prefix + 'transform: rotateX(0deg);    }' +
                '100% {' + prefix + 'transform: rotateX(180deg);  }' +

                '}');

            // Fold (first item)
            utils.inject( '@' + prefix + 'keyframes fold-first    {' +

                '0%   {' + prefix + 'transform: rotateX(0deg);    }' +
                '100% {' + prefix + 'transform: rotateX(-180deg); }' +

                '}');

            // Swing out
            utils.inject( '@' + prefix + 'keyframes swing-out     {' +

                '0%   {' + prefix + 'transform: rotateX(0deg);    }' +
                '30%  {' + prefix + 'transform: rotateX(-30deg);  }' +
                '60%  {' + prefix + 'transform: rotateX(15deg);   }' +
                '100% {' + prefix + 'transform: rotateX(0deg);    }' +

                '}');

            // Swing in
            utils.inject( '@' + prefix + 'keyframes swing-in      {' +

                '0%   {' + prefix + 'transform: rotateX(0deg);    }' +
                '50%  {' + prefix + 'transform: rotateX(-10deg);  }' +
                '90%  {' + prefix + 'transform: rotateX(15deg);   }' +
                '100% {' + prefix + 'transform: rotateX(0deg);    }' +

                '}');

            // Shading (unfold)
            utils.inject( '@' + prefix + 'keyframes unfold-over   {' +
                '0%   { opacity: 1.0; }' +
                '100% { opacity: 0.0; }' +
                '}');

            // Shading (fold)
            utils.inject( '@' + prefix + 'keyframes fold-over     {' +
                '0%   { opacity: 0.0; }' +
                '100% { opacity: 1.0; }' +
                '}');

            // Node styles
            utils.inject( '.node {' +
                'position: relative;' +
                'display: block;' +
                '}');

            // Face styles
            utils.inject( '.face {' +
                'pointer-events: none;' +
                'position: absolute;' +
                'display: block;' +
                'height: 100%;' +
                'width: 100%;' +
                'left: 0;' +
                'top: 0;' +
                '}');
        }

        // Merge options & defaults
        var opts = $.extend( {}, $.fn.makisu.defaults, options );

        // Extract api method arguments
        var args = Array.prototype.slice.call( arguments, 1 );

        // Main plugin loop
        return this.each( function () {

            // If the user is calling a method...
            if ( api[ options ] ) {
                return api[ options ].apply( this, args );
            }

            // Store options in view
            $this = $( this ).data( opts );

            // Only proceed if the scene hierarchy isn't already built
            if ( !$this.data( 'initialized' ) ) {

                $this.data( 'initialized', true );

                // Select the first level of matching child elements
                $kids = $this.children( opts.selector );

                // Build a scene graph for elements
                $root = $( markup.node ).addClass( 'root' );
                $base = $root;
                
                // Process each element and insert into hierarchy
                $kids.each( function( index, el ) {

                    $item = $( el );

                    // Which animation should this node use?
                    anim = 'fold' + ( !index ? '-first' : '' );

                    // Since we're adding absolutely positioned children
                    $item.css( 'position', 'relative' );

                    // Give the item some depth to avoid clipping artefacts
                    $item.css(utils.prefix({
                        'transform-style': 'preserve-3d',
                        'transform': 'translateZ(-0.1px)'
                    }));

                    // Create back face
                    $back = $( markup.back );
                    $back.css( 'background', $item.css( 'background' ) );
                    $back.css(utils.prefix({ 'transform': 'translateZ(-0.1px)' }));

                    // Create shading
                    $over = $( markup.over );
                    $over.css(utils.prefix({ 'transform': 'translateZ(0.1px)' }));
                    $over.css({
                        'background': opts.shading,
                        'opacity': 0.0
                    });
                    
                    // Begin folded
                    $node = $( markup.node ).append( $item );
                    $node.css(utils.prefix({
                        'transform-origin': '50% 0%',
                        'transform-style': 'preserve-3d',
                        'animation': anim + ' 1ms linear 0s 1 normal forwards'
                    }));

                    // Build display list
                    $item.append( $over );
                    $item.append( $back );
                    $base.append( $node );

                    // Use as parent in next iteration
                    $base = $node;
                });

                // Set root transform settings
                $root.css(utils.prefix({
                    'transform-origin': '50% 0%',
                    'transform-style': 'preserve-3d'
                }));

                // Apply perspective
                $this.css(utils.prefix({
                    'transform': 'perspective(' + opts.perspective + 'px)'
                }));

                // Display the scene
                $this.append( $root );
            }
        });
    };

    // Default options
    $.fn.makisu.defaults = {

        // Perspective to apply to rotating elements
        perspective: 1200,

        // Default shading to apply (null => no shading)
        shading: 'rgba(0,0,0,0.12)',

        // Area of rotation (fraction or pixel value)
        selector: null,

        // Fraction of speed (0-1)
        overlap: 0.6,

        // Duration per element
        speed: 0.8,

        // Animation curve
        easing: 'ease-in-out'
    };

    $.fn.makisu.enabled = canRun;

})( jQuery );

// The `enabled` flag will be `false` if CSS 3D isn't available

if ( $.fn.makisu.enabled ) {

    var $sashimi = $( '.sashimi' );
    var $nigiri = $( '.nigiri' );
    var $maki = $( '.maki' );

    // Create Makisus

    $nigiri.makisu({
        selector: 'dd',
        overlap: 0.85,
        speed: 1.7
    });

    $maki.makisu({
        selector: 'dd',
        overlap: 0.6,
        speed: 0.85
    });

    $sashimi.makisu({
        selector: 'dd',
        overlap: 0.2,
        speed: 0.5
    });

    // Open all
    
    //$( '.list' ).makisu( 'open' );

    // Toggle on click

    $( '.toggle' ).on( 'mouseover', function() {
        $( '.list' ).makisu( 'toggle' );
    });
    $( '.toggle' ).on( 'mouseout', function() {
        $( '.list' ).makisu( 'close' );
    });
    
    /* $( '#toggle' ).on( 'click', function() {
        $( '.list' ).makisu( 'close' );
    }); */

    // Disable all links

    $( '.demo a' ).click( function( event ) {
        event.preventDefault();
    });

} else {

    $( '.warning' ).show();
}
</script>    
        
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand header-a" href="home.do"><img src="<%=request.getContextPath()%>/resources/images/pea-move-unscreen.gif" alt="..." /></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ms-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link header-a" href="#services">아이템상점</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="#portfolio">선물하기</a></li>
                        <li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/about.do">결제/충전</a></li>
                        <span class="toggle" ><li class="nav-item" >
                        		<a class="nav-link header-a" href="<%=request.getContextPath()%>/mainboard/community.do">커뮤니티</a>
                        	<dl class="list maki" >
                        		<dd><a href="<%=request.getContextPath()%>/mainboard/list.do?category=1">　공지　</a></dd>
                        		<dd><a href="<%=request.getContextPath()%>/mainboard/list.do?category=2">　자유　</a></dd>
                        		<dd><a href="<%=request.getContextPath()%>/mainboard/list.do?category=3">　유머　</a></dd>
                        	</dl>
                        </li></span>
                        <li class="nav-item nav-hover">
                        	<a class="nav-link" href="<%=request.getContextPath()%>/mainboard/service.do">고객센터</a>
                        	<ul class="text-uppercase ms-auto py-4 py-lg-0 nav-list">
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=4">　FAQ　</a></li>
                        		<li><a class="nav-link" href="<%=request.getContextPath()%>/mainboard/list.do?category=5">　Q&A　</a></li>
                        	</ul>
                        </li>

                        <c:if test="${login != null}">
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/logout.do">로그아웃</a></li>
                        </c:if>
                        <c:if test="${login == null}">
                        	<li class="nav-item"><a class="nav-link header-a" href="<%=request.getContextPath()%>/user/login.do">로그인</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <!-- <div class="container">
                <div class="masthead-subheading">0705</div>
                <div class="masthead-heading text-uppercase">완두콩</div>
                <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
            </div> -->
        </header>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="<%=request.getContextPath()%>/resources/js/header.js"></script>
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <!-- * *                               SB Forms JS                               * *-->
        <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
        <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>