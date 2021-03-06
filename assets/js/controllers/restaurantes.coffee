app = angular.module 'yapp'

app.controller 'RestaurantesController', ["$scope","$http",($scope,$http)->
	
	$scope.title = "Restaurantes"
	$scope.restaurantes = []
	$scope.abiertos = {
		active:false,
		list:[]
	}

	$http.get(base+"/restaurantes/all").then (response)->
		$scope.restaurantes = response.data

	$scope.remove = (id) ->
		$http.delete base+"/restaurantes/delete?id=" + encodeURIComponent id
		.then (response) ->
			if !!response.data.status
				$scope.restaurantes = $scope.restaurantes.filter (item) ->
					return item.id != id
			dialog.show 'Éxito',response.data.data,'error'

	$scope.searchBy = ->
		if $scope.abiertos.active
			return (restaurante) ->
				return restaurante.abierto
			
]

app.controller 'RestaurantController', ["$scope","$http", "$routeParams","$window","$rootScope", ($scope,$http,$routeParams,$window,$rootScope) ->
	$scope.restaurante = {}
	$scope.restaurante.horarios = $scope.initHorarios

	$edit = if $routeParams.id then true else false
	
	if $edit
		$http.get(base+"/restaurantes/"+$routeParams.id).then (response) ->
			$scope.restaurante = response.data
			$horarios = $scope.restaurante.horarios
			$scope.restaurante.horarios = unless $horarios.length > 0 then $scope.initHorarios else $horarios

	$scope.save = ->

		$scope.restaurante.horarios.forEach (dia,i)->
			unless dia.checked
				dia.horarios = []
			else
				unless dia.horarios.length > 0
					dia.checked = false

			dia.horarios = dia.horarios.filter (item) ->
				return (item.apertura != '' && item.cierre != '')

		$http.put(base+"/restaurantes/save",$scope.restaurante).then (response) ->
			
			unless $edit
				$url = "/edit/"+response.data.row
			else
				$url = ""
			
			if !!response.data.status
				$window.location.href = '#!/restaurantes'


	$scope.addHorario = (id) ->
		$scope.restaurante.horarios[id].horarios.push({apertura:'',cierre:''})

	$scope.removeHorario = (dia,horario) ->
		$scope.restaurante.horarios[dia].horarios = 
			$scope.restaurante.horarios[dia].horarios.filter (item) ->
				return item != $scope.restaurante.horarios[dia].horarios[horario]

	$scope.initHorarios = [
		{id:1,nombre:"Lunes",checked: false,horarios:[]}
		{id:2,nombre:"Martes",checked: false,horarios:[]}
		{id:3,nombre:"Miercoles",checked: false,horarios:[]}
		{id:4,nombre:"Jueves",checked: false,horarios:[]}
		{id:5,nombre:"Viernes",checked: false,horarios:[]}
		{id:6,nombre:"Sábado",checked: false,horarios:[]}
		{id:7,nombre:"Domingo",checked: false,horarios:[]}
	]

	$scope.updateHorario = ->
		#
]