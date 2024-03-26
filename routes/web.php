<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

/** routes pour étudiants */
Route::get('/etudiants', [App\Http\Controllers\EtudiantController::class, 'index'])->name('etudiant.index');
Route::get('/etudiant/{id}', [App\Http\Controllers\EtudiantController::class, 'show'])->where('id', '[0-9]+')->name('etudiant.show');
Route::get('/create/etudiant', [App\Http\Controllers\EtudiantController::class, 'create'])->name('etudiant.create');
Route::post('/create/etudiant', [App\Http\Controllers\EtudiantController::class, 'store'])->name('etudiant.store');
Route::get('/edit/etudiant/{id}', [App\Http\Controllers\EtudiantController::class, 'edit'])->where('id', '[0-9]+')->name('etudiant.edit');
Route::put('/edit/etudiant/{id}', [App\Http\Controllers\EtudiantController::class, 'update'])->where('id', '[0-9]+')->name('etudiant.update');
Route::delete('/etudiant/{id}', [App\Http\Controllers\EtudiantController::class, 'destroy'])->where('id', '[0-9]+')->name('etudiant.delete');

/** route pour langue */
Route::get('/lang/{locale}', [App\Http\Controllers\SetLocaleController::class, 'index'])->name('lang');

/** routes pour inscription */
Route::get('/inscription', [App\Http\Controllers\UserController::class, 'create'])->name('user.create');
Route::post('/inscription', [App\Http\Controllers\UserController::class, 'store'])->name('user.store');

/** routes pour connexion */
Route::get('/login', [App\Http\Controllers\AuthController::class, 'create'])->name('login');
Route::post('/login', [App\Http\Controllers\AuthController::class, 'store'])->name('login.store');
Route::get('/logout', [App\Http\Controllers\AuthController::class, 'destroy'])->name('logout')->middleware('auth');

Route::middleware('auth')->group(function(){
    Route::get('/admin', [App\Http\Controllers\UserController::class, 'index'])->name('user.index');
    
    /** routes pour articles */
    Route::get('/articles', [App\Http\Controllers\ArticleController::class, 'index'])->name('article.index');
    Route::get('/article/{id}', [App\Http\Controllers\ArticleController::class, 'show'])->where('id', '[0-9]+')->name('article.show');
    Route::get('/create/article', [App\Http\Controllers\ArticleController::class, 'create'])->name('article.create');
    Route::post('/create/article', [App\Http\Controllers\ArticleController::class, 'store'])->name('article.store');
    Route::get('/edit/article/{id}', [App\Http\Controllers\ArticleController::class, 'edit'])->where('id', '[0-9]+')->name('article.edit');
    Route::put('/edit/article/{id}', [App\Http\Controllers\ArticleController::class, 'update'])->where('id', '[0-9]+')->name('article.update');
    Route::delete('/article/{id}', [App\Http\Controllers\ArticleController::class, 'destroy'])->where('id', '[0-9]+')->name('article.delete');

    /** routes pour documents */
    Route::get('/documents', [App\Http\Controllers\DocumentController::class, 'index'])->name('document.index');
    Route::get('/document/{id}', [App\Http\Controllers\DocumentController::class, 'show'])->where('id', '[0-9]+')->name('document.show');
    Route::get('/create/document', [App\Http\Controllers\DocumentController::class, 'create'])->name('document.create');
    Route::post('/create/document', [App\Http\Controllers\DocumentController::class, 'store'])->name('document.store');
    Route::get('/edit/document/{id}', [App\Http\Controllers\DocumentController::class, 'edit'])->where('id', '[0-9]+')->name('document.edit');
    Route::put('/edit/document/{id}', [App\Http\Controllers\DocumentController::class, 'update'])->where('id', '[0-9]+')->name('document.update');
    Route::delete('/document/{id}', [App\Http\Controllers\DocumentController::class, 'destroy'])->where('id', '[0-9]+')->name('document.delete');
});