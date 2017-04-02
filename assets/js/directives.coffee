app = angular.module 'yapp'

app.directive 'ngTimepicker', ->
	return def =
		restrict: 'A'
		link: (scope,element,attrs) ->
			$(element).timepicker
				timeFormat:'H:i'