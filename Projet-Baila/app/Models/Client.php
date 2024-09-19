<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    use HasFactory;

    // Définir les champs qui peuvent être remplis via des requêtes HTTP
    protected $fillable = [
        'surname', 
        'telephone', 
        'address', 
        'user_id'
    ];

    // Relation : un client a plusieurs dettes
    public function dettes()
    {
        return $this->hasMany(Dette::class);
    }

    // Relation : un client peut être lié à un utilisateur
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
