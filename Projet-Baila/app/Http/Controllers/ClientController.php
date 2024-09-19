<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ClientController extends Controller
{
    // Afficher tous les clients
    public function index()
    {
        $clients = Client::all();
        return response()->json($clients);
    }

    // Créer un nouveau client
    public function store(Request $request)
    {
        $client = Client::create($request->all());
        return response()->json($client, 201);
    }

    // Afficher un client spécifique
    public function show($id)
    {
        $client = Client::find($id);

        if (!$client) {
            return response()->json(['message' => 'Client non trouvé'], 404);
        }

        return response()->json($client);
    }

    // Mettre à jour un client existant
    public function update(Request $request, $id)
    {
        $client = Client::find($id);

        if (!$client) {
            return response()->json(['message' => 'Client non trouvé'], 404);
        }

        $client->update($request->all());
        return response()->json($client);
    }

    // Supprimer un client
    public function destroy($id)
    {
        $client = Client::find($id);

        if (!$client) {
            return response()->json(['message' => 'Client non trouvé'], 404);
        }

        $client->delete();
        return response()->json(['message' => 'Client supprimé avec succès']);
    }

    protected $photoService;

    public function __construct(PhotoService $photoService)
    {
        $this->photoService = $photoService;
    }

    public function nouveau(Request $request)
    {
        $data = $request->all();

        // Vérifie si une photo a été uploadée
        if ($request->hasFile('photo')) {
            $data['photo_url'] = $this->photoService->uploadPhoto($request->file('photo'));
        }

        $client = Client::create($data);

        return response()->json($client, 201);
    }

    public function viewclient()
    {
        return view('clients');
    }
}
