app = angular.module 'yapp'

app.controller 'RestaurantesController', ["$scope","$http",($scope,$http)->
	
	$scope.title = "Restaurantes"
	$scope.restaurantes = new Array

	$http.get(base+"/restaurantes/all").then (response)->
		$scope.restaurantes = response.data

	$scope.remove = (id) ->
		$http.delete base+"/restaurantes/delete?id=" + encodeURIComponent id
		.then (response) ->
			if !!response.data.status
				$scope.restaurantes = $scope.restaurantes.filter (item) ->
					return item.id != id
			console.log response.data.data
			
]

app.controller 'RestaurantController', ["$scope","$http", "$routeParams","$window", ($scope,$http,$routeParams,$window) ->
	$scope.restaurante = {}
	$edit = if $routeParams.id then true else false
	
	if $edit
		$http.get base+"/restaurantes/"+$routeParams.id
		.then (response) ->
			data = response.data
			$scope.restaurante = data

	$scope.save = ->
		$http.put base+"/restaurantes/save",$scope.restaurante,{}
		.then (response) ->
			unless $edit
				$window.location.href = '#!/restaurantes/edit/' + response.data.row
			
]