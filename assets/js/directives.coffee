app = angular.module 'yapp'

app.directive 'ngTimepicker', ->
	return def =
		restrict: 'A'
		link: (scope,element,attrs) ->
			$(element).timepicker
				timeFormat:'H:i'
				show2400: false
				# roundingFunction: false
				disableTextInput:false