app = angular.module 'yapp'

app.directive 'ngTimepicker',["$scope",($scope)->
	return def =
		restrict: 'A'
		link: (element,attrs,scope) ->
			$(element).timepicker scope.timePickerOptions
]