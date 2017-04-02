$(document).ready ->
	equalizeColumns()
	nav.mobile()
	nav.toggle()
	# centerColumns()
	square()
	squareColumns()

	offset = $(window).height()/2
	$(document).scroll ->
		scroll = $(this).scrollTop()
		if (scroll>offset)
			nav.fix()
		else
			nav.unfix()

	if ($(window).scrollTop() > offset)
		nav.fix()
	else
		nav.unfix()
	
	$('[ext]').each ->
		$(this).attr('target','_blank')


	# $("section.error").css({	
	# 	height: $(window).height() - $("footer")
	# }).parents(".content").css({
	# 		paddingBottom: 0
	# })

$(window).on 'load resize', ->
	setTimeout ->
		equalizeColumns()
		square()
	500
	
	nav.mobile()
	# centerColumns()

	if $(this).width() > 980
		$("header nav").show()		

	# $(".content").css
	# 	paddingBottom: $("footer").height()



nav = 

	toggle: ->
		$(".mobile ul li a,#menu").click (e) ->
			# e.preventDefault()
			$(".mobile ul").removeClass('open')

	mobile: ->
		if $(window).width() <= 980
			$("nav").addClass 'mobile'
			$("header").addClass 'jc'
			return
		else
			if $("nav").hasClass 'mobile'
				$("nav").removeClass 'mobile'
			if $("header").hasClass 'jc'
				$("header").removeClass 'jc'
				return

	fix: ->
		$("header:not(.normal)").addClass 'fx'

	unfix: ->
		$("header:not(.normal)").removeClass 'fx'
		
equalizeColumns = ->
	
	$width = $(window).width()

	$('.equalize').each ->
		$this = $(this)
		if $this.hasClass 'not' && $width < 768
			$this.children('*').css('height','auto')
			return false
		# if $this.hasClass('not-mobile') && $width <= 480
			# return false 
		
		$(this).children('*').matchHeight
			byRow: false
			property: 'height'

	# $('.equalize').each ->
	# 	if $(window).width()<=1024 && $(this).hasClass('not')
	# 		$(this).children('*').css('height','auto')
	# 		# alert 'asd'
	# 		return false
	# 	$row = $(this)
	# 	tallest = 0
	# 	collapsed = false
	# 	$row.children('*').each (i)->
	# 		$this = $(this)
	# 		original = $this.height()
	# 		if $this.hasClass('override')
	# 			$this.css('height', 'auto')
	# 			return false
	# 		$this.css('minHeight', '1px')
	# 		collapsed = $this.outerWidth() == $row.outerWidth()
	# 		if !collapsed
	# 			if !$this.hasClass('equal')
	# 				$this.addClass('equal')

	# 			if $this.outerHeight() > tallest
	# 				tallest = $this.outerHeight()

	# 	if !collapsed
	# 		$row.children('*').height tallest
			# $row.children('*').css('minHeight',tallest+"px")


# centerColumns = ->
# 	el = $ '.centerColumns .col'
# 	count = el.length
# 	rows = parseInt count/3
# 	if $(window).width() >= 768
# 		el.each (index, value) ->
# 			index++
# 			if index%3==1 && count-index==0
# 				$(this).addClass 'wp-offset-1'
# 			if index%3==2 && count-index==0
# 				$(this).addClass 'wp-offset-1'


square = ->
	
	$width = $(window).width()
	$(".square").each ->
		$row = $(this)
		if $row.hasClass('not-mobile') && $width<=480
			return false
		if $row.hasClass('not-tablet')
			if $width>600 && $width<=768
				$row.addClass 'equalize'
				setTimeout ->
					equalizeColumns()
				,250
				return false
			else if $width>=1024
				$row.removeClass 'equalize'
				setTimeout ->
					equalizeColumns()
					squareColumns()
				,250
				return false
			# squeareColumns()

squareColumns = ->
	$(".square").each ->
		$row = $(this) 
		$row.children('.item').each ->
			if $(this).hasClass('not')
				return false
			$element = $(this)
			$element.css('height',$element.outerWidth())
			$element.addClass('expanded')