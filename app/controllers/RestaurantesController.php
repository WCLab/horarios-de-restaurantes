<?php

class RestaurantesController extends Controller{
	public function index(){
		$data["restaurantes"] = Restaurant::all();
		return View::make('restaurantes')->with('scope',$data);
	}

	public function delete($id){
		$restaurant = Restaurant::find($id);
		if ($restaurant) {
			if($restaurant->delete()){
				echo "Eliminado";
			}else{
				echo "Error";
			}
		}else{
			echo "No existe el restaurante";
		}
	}
}