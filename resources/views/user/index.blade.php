@extends('layouts.app')
@section('title', 'Forum')
@section('content')
<div class="container my-5">
    @auth 
    <h3>@lang('Greeting'), {{ Auth::user()->name }}</h3>
    @endauth 

    <ul class="list-group mt-5 col-sm-4">
        <li class="list-group-item"><a href="{{ route('article.index') }}">articles</a></li>
        <li class="list-group-item"><a href="{{ route('document.index') }}">documents</a></li>
    </ul>
</div>
@endsection