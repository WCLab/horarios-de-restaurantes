<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the Closure to execute when that URI is requested.
|
*/

// Route::get('/','HomeController@index');

// Route::get('/test','HomeController@test');

Route::get('/','HomeController@index');
Route::get('/test','HomeController@test');

Route::get('/restaurantes/all','RestaurantesController@all');
Route::get('/restaurantes/{id}','RestaurantesController@view');
Route::delete('/restaurantes/delete','RestaurantesController@delete');
Route::put('/restaurantes/save','RestaurantesController@save');