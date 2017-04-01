<?php

class HomeController extends BaseController {

	public function index(){
		$scope["restaurantes"] = Restaurant::all();
		return View::make('restaurantes')->with('scope',$scope);
	}

	public function test(){
		return View::make('test');
	}

}
