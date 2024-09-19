<?php

namespace App\Services;

use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;

class PhotoService
{
    protected $firebase;

    public function __construct()
    {
        $this->firebase = (new Factory)
            ->withServiceAccount(config('services.firebase.credentials'))
            ->createStorage();
    }

    // Méthode pour uploader une photo dans Firebase Storage
    public function uploadPhoto($photo)
    {
        $bucket = $this->firebase->getBucket();
        $file = fopen($photo->getRealPath(), 'r');
        $fileName = 'photos/' . uniqid() . '.' . $photo->getClientOriginalExtension();
        
        $bucket->upload($file, ['name' => $fileName]);

        // Retourne l'URL de la photo
        return "https://firebasestorage.googleapis.com/{$bucket->name()}/{$fileName}";
    }
}
