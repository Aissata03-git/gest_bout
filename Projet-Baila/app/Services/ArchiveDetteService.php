<?php
namespace App\Services;

use App\Models\Dette;
use Kreait\Firebase\Factory;
use Kreait\Firebase\ServiceAccount;

class ArchiveDetteService
{
    protected $firebase;

    public function __construct()
    {
        $this->firebase = (new Factory)
            ->withServiceAccount(config('services.firebase.credentials'))
            ->createFirestore();
    }

    // Méthode pour archiver les dettes non soldées
    public function archiveDettes()
    {
        \Log::info('La tâche d\'archivage des dettes a été exécutée à ' . now());
        $bucket = $this->firebase->getFirestore();

        // Sélectionner les dettes non soldées
        $dettes = Dette::where('soldee', false)->get();
        Log::info("Nombre de dettes non soldées trouvées : " . $dettes->count());

        foreach ($dettes as $dette) {
            $bucket->collection('archives')->add([
                'client_id' => $dette->client_id,
                'date' => $dette->date,
                'montant' => $dette->montant,
                'soldee' => $dette->soldee,
            ]);

            Log::info("Dette archivée : " . $dette->id);


            // Supprimer la dette de la base locale
            $dette->delete();
            Log::info("Dette supprimée de la base locale : " . $dette->id);
        }
    }
}
