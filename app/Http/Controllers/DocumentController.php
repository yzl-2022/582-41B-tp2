<?php

namespace App\Http\Controllers;

use App\Models\Document;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

class DocumentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $documents = Document::paginate(10);
        return view('document.index', ['documents'=>$documents]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('document.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'title'   => 'required|string|max:200',
            'date'    => 'required|date'
        ]);

        $document = Document::create([
            'title'   => $request->title,
            'date'    => $request->date,
            'user_id' => Auth::user()->id
        ]);
        
        return redirect()->route('document.show', $document->id)->with('success', 'Document added successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $document = Document::find($id);
        return view('document.show', ['document'=>$document]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $document = Document::find($id);
        return view('document.edit', ['document'=>$document]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title'   => 'required|string|max:200',
            'date'    => 'required|date'
        ]);

        $document = Document::find($id);

        if($document && ($document->user_id == Auth::user()->id)){
            $document->update([
                'title'   => $request->title,
                'date'    => $request->date,
                'user_id' => Auth::user()->id
            ]);
    
            return redirect()->route('document.show', $document->id)->with('success', 'Document changed successfully!');
        }else{
            return redirect()->route('document.index');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $document = Document::find($id);
        if($document && ($document->user_id == Auth::user()->id)) $document->delete();
        return redirect()->route('document.index');
    }
}
