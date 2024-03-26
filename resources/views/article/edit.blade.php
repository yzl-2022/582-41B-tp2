@extends('layouts.app')
@section('title', 'Modifier article')
@section('content')
<section class="pb-4 text-center container">
    <h1>@lang('Change') Article</h1>
</section>
@isset($article)
{{--Ajouter la formulaire--}}
<div class="row justify-content-center mt-5 mb-5">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <form method="POST">{{--don't add action for PUT or DELETE--}}
                    @csrf
                    @method('PUT')
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="{{ old('title', $article->title) }}">
                        @if ($errors->has('title'))
                            <div class="text-danger mt-2">
                                {{$errors->first('title')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="content" class="form-label">Content</label>
                        <textarea class="form-control" id="content" name="content" rows="3">{{ old('content', $article->content) }}</textarea>
                        @if ($errors->has('content'))
                            <div class="text-danger mt-2">
                                {{$errors->first('content')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date</label>
                        <input type="date" class="form-control" id="date" name="date" value="{{ old('date', $article->date) }}" min="2023-12-31">
                        @if ($errors->has('date'))
                            <div class="text-danger mt-2">
                                {{$errors->first('date')}}
                            </div>
                        @endif
                    </div>
                    <button type="submit" class="btn btn-primary">@lang('Change')</button>
                </form>
            </div>
        </div>
    </div>
</div>
@else
<div class="row justify-content-center">
    <div class="col-md-8 alert alert-danger text-center">Article n'exist pas pour modifier.</div>
</div>
@endisset
@endsection