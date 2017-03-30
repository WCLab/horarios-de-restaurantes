@extends ('layout')

@section('content')
	<div ng-controller="mainCtrl">
		<div>{{abierto_txt}}</div>
		<form>
			<ul>
				<li ng-repeat="dia in dias | orderBy : 'id'">
					<div>
						<input type="checkbox" value="{{$index}}" ng-checked="dia.checked==true" ng-change="diasUpdate()" ng-model="dias[$index]['checked']" id="{{$index+dia.nombre}}"> 
						<label for="{{$index+dia.nombre}}">{{dia.nombre}}</label>
					</div>
					<div ng-show="dia.checked">
						<div id="horarios_{{dia.id}}">
							<div>
								<label>Apertura</label>
								<input type="text" name="horarios[{{dia.id}}][apertura]" ui-timepicker="timePickerOptions" ng-model="horarios[dia.id]['apertura']" class="picker">
								<label>Cierre</label>
								<input type="text" name="horarios[{{dia.id}}][cierre]" ui-timepicker="timePickerOptions" ng-model="horarios[dia.id]['cierre']" class="picker">
							</div>
						</div>
						<div>
							<button ng-click="addHorarios('horarios_' + dia.id)" type="button">Agregar horario</button>
						</div>
					</div>
				</li>
				<button type="button" ng-click="save()">Guardar</button>
			</ul>
		</form>
	</div>
@stop