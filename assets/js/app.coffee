app = angular.module "yapp",[]

app.controller "mainCtrl", ["$scope","$compile",($scope,$compile) ->
	
	$scope.dias = [
		{id:1,nombre:"Domingo",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:2,nombre:"Lunes",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:3,nombre:"Martes",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:4,nombre:"Miercoles",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:5,nombre:"Jueves",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:6,nombre:"Viernes",checked: false,horarios:[{apertura:'',cierre:''}]}
		{id:7,nombre:"Sábado",checked: false,horarios:[{apertura:'',cierre:''}]}
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