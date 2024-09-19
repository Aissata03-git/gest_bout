<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ArchivesController extends Controller
{
    public function viewarchives()
    {
        return view('archives');
    }

    // Récupérer toutes les archives
    public function index()
    {
        $archives = Archive::all();
        return response()->json($archives);
    }

    // Restaurer une archive
    public function restaurer($id)
    {
    // On récupère l'archive correspondante
    $archive = Archive::findOrFail($id);

    // Modifier le champ 'is_archived' pour indiquer que l'élément n'est plus archivé
    $archive->is_archived = false;
    $archive->save();

    return response()->json(['message' => 'Archive restaurée avec succès']);
    }


    // Supprimer une archive
    public function supprimer($id)
    {
        $archive = Archive::findOrFail($id);
        $archive->delete();

        return response()->json(['message' => 'Archive supprimée avec succès']);
    }
}
