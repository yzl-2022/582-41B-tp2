<?php

namespace App\Http\Controllers;

use App\Models\Article;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;

class ArticleController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $articles = Article::paginate(10);
        return view('article.index', ['articles'=>$articles]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('article.create');
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
            'date'    => 'required|date',
            'content' => 'required|string'
        ]);

        $article = Article::create([
            'title'   => $request->title,
            'content' => $request->content,
            'date'    => $request->date,
            'user_id' => Auth::user()->id
        ]);
        
        return redirect()->route('article.show', $article->id)->with('success', 'Article created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $article = Article::find($id);
        return view('article.show', ['article'=>$article]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $article = Article::find($id);
        return view('article.edit', ['article'=>$article]);
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
            'date'    => 'required|date',
            'content' => 'required|string'
        ]);

        $article = Article::find($id);

        if($article && ($article->user_id == Auth::user()->id)){
            $article->update([
                'title'   => $request->title,
                'content' => $request->content,
                'date'    => $request->date,
                'user_id' => Auth::user()->id
            ]);
    
            return redirect()->route('article.show', $article->id)->with('success', 'Article changed successfully!');
        }else{
            return redirect()->route('article.index');
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
        $article = Article::find($id);
        if($article && ($article->user_id == Auth::user()->id)) $article->delete();
        return redirect()->route('article.index');
    }
}
