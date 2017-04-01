<?php

class HomeController extends BaseController {

	public function index(){
		return View::make('layout')->with('nombre',"Fer");
	}

	public function test(){
		return View::make('test');
	}

}
