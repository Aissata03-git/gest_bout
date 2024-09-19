<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('dettes', function (Blueprint $table) {
            $table->id();
            $table->foreignId('client_id')->constrained()->onDelete('cascade'); // Relation avec un client
            $table->date('date'); // Date de la dette
            $table->decimal('montant', 8, 2); // Montant de la dette
            $table->boolean('soldee')->default(false); // Indicateur si la dette est soldée
            $table->timestamps(); // Création et modification des enregistrements
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dettes');
    }
};
