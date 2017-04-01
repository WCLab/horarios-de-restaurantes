<?php

class BaseController extends Controller {

	public function __construct(){
		// Blade::setContentTags('@{', '}');
    	// Blade::setEscapedContentTags('@{{', '}}');
	}

	// protected function setupLayout(){
	// 	if ( ! is_null($this->layout)){
	// 		$this->layout = View::make($this->layout);
	// 	}
	// }

}
