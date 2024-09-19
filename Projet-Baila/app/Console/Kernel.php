<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Déclarer les commandes que vous souhaitez enregistrer.
     *
     * @var array
     */
    protected $commands = [
        // Ajouter ici les commandes
    ];

    /**
     * Définir les tâches planifiées.
     */
    protected function schedule(Schedule $schedule)
    {
        // Planification de l'archivage des dettes chaque jour à 23h
        $schedule->call(function () {
            app(\App\Services\ArchiveDetteService::class)->archiveDettes();
        })->dailyAt('23:00');
    }

    /**
     * Enregistrez les commandes pour l'application.
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
