<?php

class HomeController extends BaseController {

	public function index(){
		return View::make('test')
			->with('nombre',"Fer")
		;
	}

	public function test(){
		return View::make('test');
	}

}
