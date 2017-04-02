$(document).ready ->

	$('select').material_select();
	





dialog =
	show: (title, text, type)->
		$content = "<b>"+title+"</b><div>"+text+"</div>"
		Materialize.toast($content, 5000);
