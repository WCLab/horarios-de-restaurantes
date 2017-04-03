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

	public function test(){
		$serial = 'a:7:{i:0;a:4:{s:2:"id";i:1;s:6:"nombre";s:5:"Lunes";s:7:"checked";b:0;s:8:"horarios";a:0:{}}i:1;a:4:{s:2:"id";i:2;s:6:"nombre";s:6:"Martes";s:7:"checked";b:0;s:8:"horarios";a:0:{}}i:2;a:4:{s:2:"id";i:3;s:6:"nombre";s:9:"Miercoles";s:7:"checked";b:1;s:8:"horarios";a:1:{i:0;a:2:{s:8:"apertura";s:5:"14:00";s:6:"cierre";s:5:"00:00";}}}i:3;a:4:{s:2:"id";i:4;s:6:"nombre";s:6:"Jueves";s:7:"checked";b:1;s:8:"horarios";a:1:{i:0;a:2:{s:8:"apertura";s:5:"14:00";s:6:"cierre";s:5:"00:00";}}}i:4;a:4:{s:2:"id";i:5;s:6:"nombre";s:7:"Viernes";s:7:"checked";b:1;s:8:"horarios";a:1:{i:0;a:2:{s:8:"apertura";s:5:"14:00";s:6:"cierre";s:5:"00:00";}}}i:5;a:4:{s:2:"id";i:6;s:6:"nombre";s:7:"Sábado";s:7:"checked";b:1;s:8:"horarios";a:1:{i:0;a:2:{s:8:"apertura";s:5:"14:00";s:6:"cierre";s:5:"00:00";}}}i:6;a:4:{s:2:"id";i:7;s:6:"nombre";s:7:"Domingo";s:7:"checked";b:1;s:8:"horarios";a:1:{i:0;a:2:{s:8:"apertura";s:5:"14:00";s:6:"cierre";s:5:"00:00";}}}}';
		$serial = unserialize($serial);
		$hora1 = date("H:i");
		$ahora = date("H:i");
		$hora2 = "23:59";
		$hoy = date("N");
		// echo (strtotime($hora2) - strtotime($hora1))/3600;
		
		//abierto
		$dia = array_filter($serial,function($dia){
			return $dia["checked"]==true && $dia["id"] == date("N");
		});

		if (count($dia)>0) {
			$dia = current($dia);
			$horarios = $dia["horarios"];
			foreach ($horarios as $horario) {
				if (timeDiff($ahora,$horario["apertura"])>0 && timeDiff($ahora,$horario["cierre"])>0){
					echo "abierto";
				}else{
					echo "cerrado";
				}
			}
		}else{
			echo "hoy no abrió";
		}
	}

}
