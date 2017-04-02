<?php

class APIController extends Controller{
	public function __construct(){
		if (!Request::ajax()) {			
			die(json_encode([
				'status'=>0,
				'data'=>'Petición inválida'
			]));
		}
	}
}
