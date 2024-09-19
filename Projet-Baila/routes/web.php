<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');

Route::get('/clients', [ClientController::class, 'index']); // Lister les clients
Route::post('/clients', [ClientController::class, 'store']); // Créer un client
Route::get('/clients/{id}', [ClientController::class, 'show']); // Voir un client
Route::put('/clients/{id}', [ClientController::class, 'update']); // Mettre à jour un client
Route::delete('/clients/{id}', [ClientController::class, 'destroy']); // Supprimer un client

Route::get('/dettes', [DetteController::class, 'index']); // Lister les dettes
Route::post('/dettes', [DetteController::class, 'store']); // Créer une dette
Route::get('/dettes/{id}', [DetteController::class, 'show']); // Voir une dette
Route::put('/dettes/{id}', [DetteController::class, 'update']); // Mettre à jour une dette
Route::delete('/dettes/{id}', [DetteController::class, 'destroy']); // Supprimer une dette
Route::post('/dettes/{id}/solde', [DetteController::class, 'solderDette']);

Route::post('dettes/{id}/archiver', [DetteController::class, 'archiver']);
Route::post('dettes/{id}/restaurer', [DetteController::class, 'restaurer']);
Route::get('dettes/archives', [DetteController::class, 'showArchives']);

Route::get('/', [HomeController::class, 'viewhome'])->name('home');
Route::get('/clients', [ClientController::class, 'viewclient'])->name('clients');
Route::get('/dettes', [DetteController::class, 'viewdette'])->name('dettes');
Route::get('/archives', [ArchiveController::class, 'viewarchives'])->name('archives');
});
