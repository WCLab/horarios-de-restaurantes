# $(window).on 'load resize', ->
# 	if $(this).width() <= 768
# 		# $(".section:gt(0)").addClass 'fp-auto-height'
# 		$(".section:gt(0)").css 'height','auto!important'

$(window).on 'load resize', ->
	$.fn.fullpage.destroy 'all'
	fullpage()

$ ->
	fullpage()
	contacto()

	$("#contacto form .estado").change ->
		region = $('option:selected',$(this)).val()
		ciudades.load region,"#contacto_ciudad"

	controller = $.superscrollorama
		triggerAtCenter: false
		playoutAnimations: true

	controller.addTween '#historia', (new TimelineLite).append([
		
		TweenMax.fromTo($('#nosotros_box'), 1, {
			css: top: -100
			immediateRender: true
		}, css: top: -400)
		
		TweenMax.fromTo($('#nosotros_pic'), 2, {
			css: top: 0
			immediateRender: true
		}, css: top: 0)

	]), 1000

	controller.addTween '#equipos', (new TimelineLite).append([
		
		TweenMax.fromTo($('#equipos_portada_box'), 1, {
			css: top: -100
			immediateRender: true
		}, css: top: -400)
		
		TweenMax.fromTo($('#equipos_portada_pic'), 1, {
			css: top: 300
			immediateRender: true
		}, css: top: -400)

	]), 1000

	controller.addTween '#utensilios', (new TimelineLite).append([
		
		TweenMax.fromTo($('#utensilios_box'), 1, {
			css: top: -100
			immediateRender: true
		}, css: top: -400)
		
		TweenMax.fromTo($('#utensilios_pic'), 1, {
			css: top: 0
			immediateRender: true
		}, css: top: -0)

	]), 1000

	controller.addTween '#loza', (new TimelineLite).append([
		
		TweenMax.fromTo($('#loza_box'), 1, {
			css: top: 0
			immediateRender: true
		}, css: top: -0)
		
		TweenMax.fromTo($('#loza_pic'), 1, {
			css: top: 0
			immediateRender: true
		}, css: top: -0)

	]), 1000


	$('#map').click(->
			$(this).find('iframe').addClass 'clicked'
		).mouseleave ->
			$(this).find('iframe').removeClass 'clicked'

$(window).load ->
	$('.phone').mask('(000) 000 0000');

ciudades =
	load: (region,target)->
		$.ajax
			type:"POST"
			url: base+"ajax/geo/cities"
			data:
				country: 134
				region: region
			success: (response) ->
				# $output = '<option value="-1">Seleccionar ciudad</option>'
				$output = ''
				response.forEach (value, index) ->
					console.log value
					$output += '<option value="'+value.rel+'">'+value.name+'</option>'
				$(target).html($output).removeAttr 'disabled'
			complete: ->
				$("#contacto_ciudad").material_select('update')

# scrolloramas = ->
# 	controller = $.superscrollorama
# 		triggerAtCenter: false
# 		playoutAnimations: true

# 	controller.addTween '#juguetes', (new TimelineLite).append([
# 		TweenMax.fromTo($('#juguetes'), 1, {
# 			css: top: 0
# 			immediateRender: true
# 		}, css: top: -400)
# 	]), 1000

contacto = ->
	$("#contacto form").submit (e) ->
		e.preventDefault()
		$this = $(this)
		$button = $("#contacto form button[type='submit']")
		$init = $button.html()
		$button.html("Procesando...").attr('disabeld')
		$.ajax
			type: $this.attr 'method'
			url: $this.attr 'action'
			data: $this.serialize()
			dataType: "json"
			success: (res) ->
				switch parseInt res.status
					when 1
						# myDialog 'Contacto',res.data, "success"
						Materialize.toast res.data, 10000
						refreshCaptcha()
						$("#contacto_ciudad").html("")
						$this[0].reset()
						$("#contacto_ciudad").attr('disabled')
					when 0
						# myDialog 'Contacto',res.data, "danger"
						Materialize.toast res.data, 10000
						refreshCaptcha()
			complete: ->
				$button.html($init).removeAttr('disabled')


refreshCaptcha = ->
	$.ajax
		type: "POST"
		url: base+"ajax/refresh-captcha.php"
		cache: false
		async: false
		data: {action :'refresh_captcha'}
		dataType: "html"
		# beforeSend: 
		# 	(data)->	
		success: 
			(data)->
				$('.cap').html(data)

fullpage = ->
	$('#fullpage').fullpage
		# menu: '.menu-list'
		# anchors:['inicio','historia','equipos','utensilios','loza','clientes','contacto','lastpage'],
		loopBottom:false
		autoScrolling: true
		fitToSection: false
		scrollBar: true	
		offsetSections: true
		scrollOverflowReset: true
		scrollOverflow: false
		# keyboardScrolling: false
		verticalCentered: false
		fixedElements: '#header'