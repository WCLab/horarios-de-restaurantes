<?php

use Illuminate\Database\Eloquent\SoftDeletingTrait;

class Restaurant extends Eloquent{

	use SoftDeletingTrait;

	protected $table = 'restaurantes';
	protected $dates = ['deleted_at'];	

}
