app = angular.module "yapp",[]

app.controller "mainCtrl", ["$scope","$compile",($scope,$compile) ->
	
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

	$scope.diasUpdate = ->
		# $this = this.dia
		# if $this.checked
		# 	$scope.abierto.push $this.nombre
		# 	# $scope.abierto[$this.id] = $this.nombre
		# else
		# 	$scope.abierto = $scope.abierto.filter (element) ->
		# 		return $this.nombre != element
		
		
		# $scope.abierto_txt = $scope.abierto.join(" ")

	$scope.add = (id) ->
			$scope.dias[id].horarios.push({apertura:'',cierre:''})
			
	$scope.save = ->
		console.log $scope.dias

]