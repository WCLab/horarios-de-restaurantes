app = angular.module 'yapp'

app.controller "HorarioController", ["$scope","$rootScope", ($scope,$rootScope) ->
	
	$rootScope.dias = [
		{id:1,nombre:"Domingo",checked: false,horarios:[]}
		{id:2,nombre:"Lunes",checked: false,horarios:[]}
		{id:3,nombre:"Martes",checked: false,horarios:[]}
		{id:4,nombre:"Miercoles",checked: false,horarios:[]}
		{id:5,nombre:"Jueves",checked: false,horarios:[]}
		{id:6,nombre:"Viernes",checked: false,horarios:[]}
		{id:7,nombre:"Sábado",checked: false,horarios:[]}
	]

	$scope.add = (id) ->
			$rootScope.dias[id].horarios.push({apertura:'',cierre:''})
			
	# $scope.save = ->
	# 	console.log JSON.stringify $scope.dias


]