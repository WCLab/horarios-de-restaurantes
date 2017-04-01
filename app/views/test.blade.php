@extends ('layout')

@section('content')
	<div ng-controller="mainCtrl">
		<!-- <div>{{abierto_txt}}</div> -->
		<form>
			<ul>
				<li ng-repeat="dia in dias | orderBy : 'id'">
					<div>
						<input type="checkbox" value="{{$index}}" ng-checked="dia.checked==true" ng-change="diasUpdate()" ng-model="dias[$index]['checked']" id="{{$index+dia.nombre}}"> 
						<label for="{{$index+dia.nombre}}">{{dia.nombre}}</label>
					</div>
					<div ng-show="dia.checked">
						<div id="horarios_{{dia.id}}">
							<div ng-repeat="horario in dia.horarios">
								<label>Apertura</label>
								<input type="text" name="" ui-timepicker="timePickerOptions" ng-model="dia.horarios[$index].apertura" class="picker">
								<label>Cierre</label>
								<input type="text" name="" ui-timepicker="timePickerOptions" ng-model="dia.horarios[$index].cierre" class="picker">
							</div>
						</div>
						<div>
							<button ng-click="add($index)" type="button">Agregar horario</button>
							<!-- <button type="button" add-horario dia="{{dia.id}}">Agregar horario</button> -->
						</div>
					</div>
				</li>
				<button type="button" ng-click="save()">Guardar</button>
			</ul>
		</form>
	</div>
@stop