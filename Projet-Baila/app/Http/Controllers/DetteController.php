<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class DetteController extends Controller
{
    // Afficher toutes les dettes
    public function index()
    {
        $dettes = Dette::all();
        return response()->json($dettes);
    }

    // Créer une nouvelle dette
    public function store(Request $request)
    {
        $dette = Dette::create($request->all());
        return response()->json($dette, 201);
    }

    // Afficher une dette spécifique
    public function show($id)
    {
        $dette = Dette::find($id);

        if (!$dette) {
            return response()->json(['message' => 'Dette non trouvée'], 404);
        }

        return response()->json($dette);
    }

    // Mettre à jour une dette existante
    public function update(Request $request, $id)
    {
        $dette = Dette::find($id);

        if (!$dette) {
            return response()->json(['message' => 'Dette non trouvée'], 404);
        }

        $dette->update($request->all());
        return response()->json($dette);
    }

    // Supprimer une dette
    public function destroy($id)
    {
        $dette = Dette::find($id);

        if (!$dette) {
            return response()->json(['message' => 'Dette non trouvée'], 404);
        }

        $dette->delete();
        return response()->json(['message' => 'Dette supprimée avec succès']);
    }

    public function solderDette(Request $request, $id) {
        $dette = Dette::find($id);
        $montant = $request->input('montant');
        $dette->montant -= $montant;
    
        if ($dette->montant <= 0) {
            $dette->status = 'soldée';
        }
    
        $dette->save();
    
        return response()->json(['message' => 'Dette soldée avec succès'], 200);
    }

    public function viewdette()
    {
        return view('dettes');
    }
    
    public function archiver($id)
    {
    $dette = Dette::findOrFail($id);
    $dette->is_archived = true;
    $dette->save();

    return response()->json(['message' => 'Dette archivée avec succès']);
    }

    public function restaurer($id)
    {
    $dette = Dette::findOrFail($id);
    $dette->is_archived = false;
    $dette->save();

    return response()->json(['message' => 'Dette restaurée avec succès']);
    }

    public function showArchives()
    {
    $archives = Dette::where('is_archived', true)->get();
    return response()->json($archives);
    }



}
