app = angular.module "yapp",["ui.timepicker"]

app.controller "mainCtrl", ["$scope","$compile",($scope,$compile) ->
	
	$scope.dias = [
		{id:1,nombre:"Domingo",checked: false, horarios:[]}
		{id:2,nombre:"Lunes",checked: false, horarios:[]}
		{id:3,nombre:"Martes",checked: false, horarios:[]}
		{id:4,nombre:"Miercoles",checked: false, horarios:[]}
		{id:5,nombre:"Jueves",checked: false, horarios:[]}
		{id:6,nombre:"Viernes",checked: false, horarios:[]}
		{id:7,nombre:"Sábado",checked: false, horarios:[]}
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
			wrapper = null
			container = null
			# dia = parseInt(id.split("_")[1]) - 1
			# $scope.dias[dia].horarios.push(new Object())
			

			container = document.getElementById id
			
			wrapper = document.createElement "div"

			labelApertura = document.createElement "label"
			inputApertura = document.createElement "input"

			labelCierre = document.createElement "label"
			inputCierre = document.createElement "input"
			
			labelApertura.innerHTML = "Apertura "
			labelCierre.innerHTML = " Cierre "

			inputApertura.type = "text"
			inputApertura.name = "dia[horarios][apertura][]"
			inputApertura.setAttribute "timepicker","timePickerOptions"
			inputApertura.setAttribute "ng-model","dia[horarios][$index]['apertura']"

			inputCierre.type = "text"
			inputApertura.name = "dia[horarios][cierre][]"
			inputCierre.setAttribute "timepicker","timePickerOptions"
			inputCierre.setAttribute "ng-model","dia[horarios][$index]['cierre']"


			wrapper.appendChild labelApertura
			wrapper.appendChild inputApertura

			wrapper.appendChild labelCierre
			wrapper.appendChild inputCierre

			container.appendChild wrapper

			$(inputCierre).timepicker($scope.timePickerOptions);
			$(inputApertura).timepicker($scope.timePickerOptions);
			
			$scope.$watch('dias', (value) ->
				# console.log $scope.dias
				a = value
			,true)

			dom = angular.element wrapper

			$compile(dom.contents())($scope)

	$scope.save = ->
		console.log $scope.dias

]

app.directive 'addHorario', ["$compile",($compile) ->
	return{
		restrict: 'A'
		link: (scope,attrs,element)->
			
			$button = element.$$element[0]
			
			$button.addEventListener('click',
				->
					id = "horarios_" + element.dia
					container = document.getElementById id #
					wrapper = document.createElement "div"

					labelApertura = document.createElement "label"
					inputApertura = document.createElement "input"

					labelCierre = document.createElement "label"
					inputCierre = document.createElement "input"
					
					labelApertura.innerHTML = "Apertura "
					labelCierre.innerHTML = " Cierre "

					inputApertura.type = "text"
					inputApertura.name = "dia[horarios][apertura][]"
					inputApertura.setAttribute "timepicker","timePickerOptions"
					inputApertura.setAttribute "ng-model","dia[horarios][$index]['apertura']"

					inputCierre.type = "text"
					inputApertura.name = "dia[horarios][cierre][]"
					inputCierre.setAttribute "timepicker","timePickerOptions"
					inputCierre.setAttribute "ng-model","dia[horarios][$index]['cierre']"


					wrapper.appendChild labelApertura
					wrapper.appendChild inputApertura

					wrapper.appendChild labelCierre
					wrapper.appendChild inputCierre

					container.appendChild wrapper

					$(inputCierre).timepicker(scope.timePickerOptions);
					$(inputApertura).timepicker(scope.timePickerOptions);
					
			,false)
			

	}
]