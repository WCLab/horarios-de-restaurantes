app = angular.module "yapp",[]

app.controller "mainCtrl", ["$scope",($scope) ->
	$scope.dias = [
		{id:1,nombre:"Domingo",checked: false}
		{id:2,nombre:"Lunes",checked: false}
		{id:3,nombre:"Martes",checked: false}
		{id:4,nombre:"Miercoles",checked: false}
		{id:5,nombre:"Jueves",checked: false}
		{id:6,nombre:"Viernes",checked: false}
		{id:7,nombre:"Sábado",checked: false}
	]

	$scope.abierto = []
	$scope.dias_abiertos = []

	$scope.diasUpdate = ->
		$this = this.dia
		if $this.checked
			# $scope.abierto.push $this.nombre
			$scope.abierto[$this.id] = $this.nombre
		else
			$scope.abierto = $scope.abierto.filter (element) ->
				return $this.nombre != element
		
		
		$scope.abierto_txt = $scope.abierto.join(" ")

			
]