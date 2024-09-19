<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dette extends Model
{
    use HasFactory;

    // Définir les champs qui peuvent être remplis via des requêtes HTTP
    protected $fillable = [
        'client_id', 
        'date', 
        'montant', 
        'soldee',
        'is_archived'
    ];

    // Relation : une dette appartient à un client
    public function client()
    {
        return $this->belongsTo(Client::class);
    }
}
