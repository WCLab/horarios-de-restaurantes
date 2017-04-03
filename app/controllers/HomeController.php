<?php

class HomeController extends BaseController {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$this->data["restaurantes"] = Restaurant::all();
		return View::make('restaurantes')->with('scope',$this->data);
	}

}
