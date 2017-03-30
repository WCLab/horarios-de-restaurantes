app = angular.module "yapp",["ui.timepicker"]

app.controller "mainCtrl", ["$scope",($scope) ->
	
	$scope.horarios = []

	$scope.dias = [
		{id:1,nombre:"Domingo",checked: false}
		{id:2,nombre:"Lunes",checked: false}
		{id:3,nombre:"Martes",checked: false}
		{id:4,nombre:"Miercoles",checked: false}
		{id:5,nombre:"Jueves",checked: false}
		{id:6,nombre:"Viernes",checked: false}
		{id:7,nombre:"Sábado",checked: false}
	]

	$scope.timePickerOptions =
		# step: 20
		'show2400': false
		'timeFormat': "H:i"
		'appendTo': 'body'

	$scope.abierto = []
	$scope.dias_abiertos = []

	$scope.diasUpdate = ->
		$this = this.dia
		if $this.checked
			$scope.abierto.push $this.nombre
			# $scope.abierto[$this.id] = $this.nombre
		else
			$scope.abierto = $scope.abierto.filter (element) ->
				return $this.nombre != element
		
		
		$scope.abierto_txt = $scope.abierto.join(" ")

	$scope.addHorarios = (id) ->
			container = document.getElementById id
			
			wrapper = document.createElement "div"

			labelApertura = document.createElement "label"
			inputApertura = document.createElement "input"

			labelCierre = document.createElement "label"
			inputCierre = document.createElement "input"
			
			labelApertura.innerHTML = "Apertura"
			labelCierre.innerHTML = "Cierre"

			inputApertura.type = "text"
			inputApertura.name = "horario[{{dia.id}}][apertura][]"
			inputApertura.setAttribute "timepicker","timePickerOptions"
			inputApertura.setAttribute "ng-model","horarios[dia.id]['apertura'][]"

			inputCierre.type = "text"
			inputApertura.name = "horario[{{dia.id}}][cierre][]"
			inputCierre.setAttribute "timepicker","timePickerOptions"
			inputCierre.setAttribute "ng-model","horarios[dia.id]['cierre'][]"


			wrapper.appendChild labelApertura
			wrapper.appendChild inputApertura

			wrapper.appendChild labelCierre
			wrapper.appendChild inputCierre

			container.appendChild wrapper

			$(inputCierre).timepicker($scope.timePickerOptions);
			$(inputApertura).timepicker($scope.timePickerOptions);

	$scope.save = ->
		console.log $scope.horarios
		console.log $scope.dias_abiertos
]