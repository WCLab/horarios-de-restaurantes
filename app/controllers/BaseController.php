<?php

class BaseController extends Controller{

	public function __construct(){
		$this->data = array();
		$this->data["base"] = url();
	}

}
