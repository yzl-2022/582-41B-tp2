@extends('layouts.app')
@section('title', 'Ajouter document')
@section('content')
<section class="pt-4 text-center container">
    <h1>@lang('Add') Document</h1>
</section>
{{--Ajouter la formulaire--}}
<div class="row justify-content-center mt-5 mb-5">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <form action="{{ route('document.store') }}" method="POST">
                    @csrf
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" value="{{ old('title') }}">
                        @if ($errors->has('title'))
                            <div class="text-danger mt-2">
                                {{$errors->first('title')}}
                            </div>
                        @endif
                    </div>
                    <div class="mb-3">
                        <label for="date" class="form-label">Date</label>
                        <input type="date" class="form-control" id="date" name="date" value="{{ old('date') }}" min="2023-12-31">
                        @if ($errors->has('date'))
                            <div class="text-danger mt-2">
                                {{$errors->first('date')}}
                            </div>
                        @endif
                    </div>
                    <button type="submit" class="btn btn-primary">@lang('Add')</button>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection