@extends ('layout')

@section('content')
	<div ng-controller="mainCtrl">
		<div>{{abierto_txt}}</div>
		<form>
			<ul>
				<li ng-repeat="dia in dias | orderBy : '$index'">
					<input type="checkbox" value="{{$index}}" ng-checked="dia.checked==true" ng-change="diasUpdate()" ng-model="dias[$index]['checked']"> 
					<label>{{dia.nombre}}</label>
				</li>
			</ul>
		</form>
	</div>
@stop