contacto = ->
	$("#contacto form").submit (e) ->
		e.preventDefault()
		$this = $(this)
		$init = $("#enviar").html()
		$("#enviar").html "Procesando..."
		$.ajax
			type: $this.attr 'method'
			url: $this.attr 'action'
			data: $this.serialize()
			dataType: "json"
			success: (res) ->
				switch parseInt res.status
					when 1
						myDialog 'Contacto',res.data, "success"
						refreshCaptcha()
						$("#ciudad").html("")
						$this[0].reset()
						$("#ciudad").attr('disabled')
					when 0
						myDialog 'Contacto',res.data, "danger"
						refreshCaptcha()
				$("#enviar").html $init

estados = ->
	$("#estado").change ->
		region = $('option:selected',$(this)).data("rel")
		$.ajax
			type:"POST"
			url: base+"geo/cities"
			data:
				region: region
			success: (data) ->
				$("#ciudad").removeAttr('disabled').html(data)

refreshCaptcha = () ->
	$.ajax
		type: "POST"
		url: base+"ajax/refresh-captcha.php"
		data: {action :'refresh_captcha'}
		dataType: "html"
		success:
			(data)->
				$('.captch').html(data)

refreshCaptchaEvent = ->
	# $(".captch").click ->
	$(".captch img").click ->
		refreshCaptcha()

# phone = ->
	# $('.phone').intlTelInput
	# 	initialCountry: 'auto'
	# 	geoIpLookup: (callback) ->
	# 	$.getJSON('http://ipinfo.io', (->)).always (resp) ->
	# 		countryCode = if resp and resp.country then resp.country else ''
	# 		# callback countryCode
	# 	utilsScript: "../utils.js"

$ ->
	contacto()
	estados()
	refreshCaptchaEvent()
	
	$('#map').click(->
		$(this).find('iframe').addClass 'clicked'
	).mouseleave ->
		$(this).find('iframe').removeClass 'clicked'

$(window).load ->
	$('.phone').mask('(000) 000 0000');