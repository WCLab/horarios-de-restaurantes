<!DOCTYPE html>
<html ng-app="yapp">
<head>
	<title>Yapp</title>
</head>
<body>
	@yield('content')
	<script src="<%%asset('assets/js/libs/angular.min.js')%%>"></script>
	<script src="<%%asset('assets/js/app.js')%%>"></script>
</body>
</html>