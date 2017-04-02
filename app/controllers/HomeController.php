<?php

class HomeController extends Controller {

	public function __construct(){
		$this->data = array();
		$this->data["base"] = url();
	}

	public function index(){
		$this->data["restaurantes"] = Restaurant::all();
		return View::make('restaurantes')->with('scope',$this->data);
	}

}
