<?php

class RestaurantesController extends APIController{

	public function __construct(){
		// parent::__construct();
	}

	public function deleted(){
		$restaurantes = Restaurant::onlyTrashed()->get();
		return Response::json($restaurantes);
	}

	public function all(){
		$restaurantes = Restaurant::all();
		foreach ($restaurantes as $restaurant) {
			$dias = array();
			$restaurant->horarios = $restaurant->horarios == NULL ? array() : unserialize($restaurant->horarios);
			$abierto = false;
			
			foreach ($restaurant->horarios as $dia) {
				if($dia["checked"])
					$dias[] = $dia["nombre"];
			}
			

			$dia = array_filter($restaurant->horarios,function($dia){
				return $dia["checked"]==true && $dia["id"] == date("N");
			});

			if (count($dia)>0) {
				$dia = current($dia);
				$ahora = date("H:i");
				$horarios = $dia["horarios"];
				foreach ($horarios as $horario) {
					if (timeDiff($ahora,$horario["apertura"])>0 && timeDiff($ahora,$horario["cierre"])>0){
						$abierto = true;
					}else{
						$abierto = false;
					}
				}
			}else{
				//no abrió
				$abierto = false;
			}

			$restaurant->dias_txt = implode(",", $dias);
			$restaurant->abierto = $abierto;

		}
		return Response::json($restaurantes);
	}

	public function view($id = false){
		$restaurant = Restaurant::find($id);
		$restaurant->horarios = $restaurant->horarios == NULL ? array() : unserialize($restaurant->horarios);
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
		$restaurante->horarios =  serialize($put->horarios);
		
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