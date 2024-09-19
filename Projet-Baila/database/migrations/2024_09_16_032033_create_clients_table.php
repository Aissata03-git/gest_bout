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
        Schema::create('clients', function (Blueprint $table) {
            $table->id();
            $table->string('surname'); // Nom du client
            $table->string('telephone')->unique(); // Numéro de téléphone unique
            $table->string('address'); // Adresse du client
            $table->foreignId('user_id')->nullable()->constrained()->onDelete('cascade'); // Lien avec un utilisateur (si associé)
            $table->timestamps(); // Création et modification des enregistrements
        });
        
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('clients');
    }
};
