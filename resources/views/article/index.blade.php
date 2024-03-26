@extends('layouts.app')
@section('title', 'Articles')
@section('content')
<section class="pb-4 text-center container">
    <h1>Articles</h1>
</section>
<div class="album container">
    <div class="row row-cols-md-3">
        @forelse($articles as $article)
        <div class="col container mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">{{ $article->title }}</h5>
                    <p class="card-text">{{ $article->content }}</p>
                    <p class="card-text">{{ $article->date }}</p>
                    <p class="card-text"><strong>Author: </strong>{{ $article->user->name }}</p>
                    <a href="{{ route('article.show', $article->id) }}" class="card-link">Voir plus</a>
                </div>
            </div>
        </div>
        @empty
            <div class="alert alert-danger col-md-6 mx-auto">0 article</div>
        @endforelse
    </div>
    @if ($articles) {{ $articles }} @endif
</div>
@endsection