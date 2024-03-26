@extends('layouts.app')
@section('title', 'Document')
@section('content')
<section class="pb-4 text-center container">
    <h1>Document</h1>
</section>
@isset($document)
{{--show card--}}
<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card mb-5">
            <div class="card-header">
                <h5 class="card-title">{{ $document->title }}</h5>
            </div>
            <div class="card-body">
                <p class="card-text"><strong>Date: </strong>{{ $document->date }}</p>
                <p class="card-text"><strong>Author: </strong>{{ $document->user->name }}</p>
            </div>
            @if($document->user_id == Auth::user()->id)
            <div class="card-footer d-flex justify-content-between">
                <a href="{{ route('document.edit', $document->id) }}" class="btn btn-sm btn-outline-success">@lang('Change')</a>
                <button type="button" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                    @lang('Delete')
                </button>
            </div>
            @endif
        </div>
    </div>
</div>
{{-- Bootstrap Modal --}}
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
        <h1 class="modal-title fs-5 text-danger" id="DeleteModalLabel">Supprimer un document</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            Êtes-vous sûr de supprimer cet document ?
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-sm btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <form method="POST">
            @csrf
            @method('DELETE')
            <button type="submit" class="btn btn-sm btn-danger">Confirmer</button>
        </form>
        </div>
    </div>
    </div>
</div>
@else
<div class="row justify-content-center">
    <div class="col-md-8 alert alert-danger text-center">Document n'exist pas.</div>
</div>
@endisset
@endsection