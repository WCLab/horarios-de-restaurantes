<?php

class RestaurantesController extends APIController{

	public function __construct(){
		// parent::__construct();
	}

	public function all(){
		$restaurantes = Restaurant::all();
		return Response::json($restaurantes);
	}

	public function view($id = false){
		$restaurant = Restaurant::find($id);
		return Response::json($restaurant);
	}

	public function delete(){
		$valid = Input::has('id');
		if ($valid) {
			$id = Input::get('id');
			$restaurant = Restaurant::find($id);
			if ($restaurant){
				if($restaurant->delete()){
					$json["status"] = 1;
					$json["data"] = "El registro ha sido eliminado";
					$json["row"] = $id;
				}else{
					$json["status"] = 0;
					$json["data"] = "Hubo un error al procesar la solicitud";
				}
			}else{
				$json["status"] = 0;
				$json["data"] = "El id no existe";
			}
		}else{
			$json["status"] = 0;
			$json["data"] = "El id es necesario para procesar la solicitud";
		}

		die(json_encode($json));
	}

	public function save(){
		
		$put = (object) Input::all();
		$edit = Input::has('id');
		
		$restaurante = $edit ? Restaurant::find($put->id) : new Restaurant;
		$restaurante->nombre = $put->nombre;
		$restaurante->telefono = $put->telefono;
		$restaurante->direccion = $put->direccion;
		// $restaurante->horarios = $put->horarios;
		
		if($restaurante->save()){
			$json["status"] = 1;
			$json["data"] = "El registro ha sido " . ($edit?"actualizado":"agregado");
			$json["row"] = $restaurante->id;
		}else{
			$json["status"] = 0;
			$json["data"] = "Hubo un error al procesar la solicitud";
		}

		die(json_encode($json));

	}
}