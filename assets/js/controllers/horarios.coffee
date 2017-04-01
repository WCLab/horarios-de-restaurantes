app = angular.module 'yapp'

app.controller "HorariosController", ["$scope","$compile",($scope,$compile) ->
	
	$scope.dias = [
		{id:1,nombre:"Domingo",checked: false,horarios:[]}
		{id:2,nombre:"Lunes",checked: false,horarios:[]}
		{id:3,nombre:"Martes",checked: false,horarios:[]}
		{id:4,nombre:"Miercoles",checked: false,horarios:[]}
		{id:5,nombre:"Jueves",checked: false,horarios:[]}
		{id:6,nombre:"Viernes",checked: false,horarios:[]}
		{id:7,nombre:"Sábado",checked: false,horarios:[]}
	]

	$scope.timePickerOptions =
		# step: 20
		'show2400': false
		'timeFormat': "H:i"
		'appendTo': 'body'

	$scope.add = (id) ->
			$scope.dias[id].horarios.push({apertura:'',cierre:''})
			
	$scope.save = ->
		console.log JSON.stringify $scope.dias


]