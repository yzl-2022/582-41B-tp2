@extends('layouts.app')
@section('title', 'Documents')
@section('content')
<section class="pb-4 text-center container">
    <h1>Documents</h1>
</section>
<div class="album container">
    <div class="row row-cols-md-3">
        @forelse($documents as $document)
        <div class="col container mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">{{ $document->title }}</h5>
                    <p class="card-text">{{ $document->date }}</p>
                    <p class="card-text"><strong>Author: </strong>{{ $document->user->name }}</p>
                    <a href="{{ route('document.show', $document->id) }}" class="card-link">Voir plus</a>
                </div>
            </div>
        </div>
        @empty
            <div class="alert alert-danger col-md-6 mx-auto">0 document</div>
        @endforelse
    </div>
    @if ($documents) {{ $documents }} @endif
</div>
@endsection