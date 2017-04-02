base = document.body.attributes.rel.value

app = angular.module "yapp",['ngRoute']

app.config ['$routeProvider','$locationProvider',"$httpProvider", ($routeProvider,$locationProvider,$httpProvider) ->
	
	$httpProvider.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest"	
	
	$routeProvider
		
		# .when "/",{
		# 	controller: "MainCtrl"
		# 	templateUrl: "templates/index.php"
		# }
		
		.when "/restaurantes",{
			controller: "RestaurantesController"
			templateUrl: base+"/assets/templates/restaurantes/list.html"
		}

		.when "/restaurantes/add",{
			controller: "RestaurantController"
			templateUrl: base+"/assets/templates/restaurantes/edit.html"
		}

		.when "/restaurantes/edit/:id",{
			controller: "RestaurantController"
			templateUrl: base+"/assets/templates/restaurantes/edit.html"
		}

		.otherwise "/restaurantes"

	# $locationProvider.html5Mode
	# 	enabled: true
	# 	requireBase: false

]
