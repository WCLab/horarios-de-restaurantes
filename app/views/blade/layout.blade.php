<!DOCTYPE html>
<html ng-app="yapp">
<head>
	<title>Yapp</title>
</head>
<body>
	@yield('content')
	<script src="#{{asset('assets/js/libs/jquery.js')}}"></script>
	<script src="#{{asset('assets/js/libs/jquery.timepicker.js')}}"></script>
	<script src="#{{asset('assets/js/libs/angular.min.js')}}"></script>
	<script src="#{{asset('assets/js/libs/timepickerdirective.min.js')}}"></script>
	<script src="#{{asset('assets/js/app.js')}}"></script>
	<link rel="stylesheet" href="#{{asset('assets/css/libs/jquery.timepicker.css')}}">
</body>
</html>