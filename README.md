# Laravel - TP2 - Documentation

**lien ver webdev** <https://e2296635.webdev.cmaisonneuve.qc.ca/cardTP2/>

**lien ver github** <https://github.com/yzl-2022/582-41B-tp2.git>

***********************************

## Pagination de la liste d'étudiants

dans /app/Http/EtudiantController.php

```php
public function index()
{
    $etudiants = Etudiant::paginate(9);
    return view('etudiant.index', ['etudiants'=>$etudiants]);
}
```

dans /app/Providers/AppServiceProvider.php

```php
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
...
public function boot()
{
    Paginator::useBootstrap();
}
```

dans la view /resources/views/etudiants/index.blade.php

```php
@extends('layouts.app')
@section('title', 'Étudiants')
@section('content')
<nav class="mt-3" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="{{ asset('/') }}">Accueil</a></li>
    <li class="breadcrumb-item active" aria-current="page">Étudiants</li>
  </ol>
</nav>
<section class="pb-4 text-center container">
    <h1>Étudiants</h1>
</section>
<div class="album container">
    <div class="row row-cols-md-3">
        @forelse($etudiants as $etudiant)
        <div class="col container mb-4">
            <div class="card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title">{{ $etudiant->nom }}</h5>
                    <p class="card-text">{{ $etudiant->adresse }}</p>
                    <p class="card-text">{{ $etudiant->telephone }}</p>
                    <p class="card-text">{{ $etudiant->email }}</p>
                    <p class="card-text">{{ $etudiant->date_de_naissance }}</p>
                    <p class="card-text"><strong>Ville: </strong>{{ $etudiant->ville->nom }}</p>
                    <a href="{{ route('etudiant.show', $etudiant->id) }}" class="card-link">Voir plus</a>
                </div>
            </div>
        </div>
        @empty
            <div class="alert alert-danger">Aucun étudiant à afficher!</div>
        @endforelse
    </div>
    @if ($etudiants) {{ $etudiants }} @endif
</div>
@endsection
```

## permettre un système multilingue, français en anglais.

créer un contrôleur:

`php artisan make:Controller SetLocaleController`

dans /app/Http/Controllers/SetLocaleController.php, définir la langue dans la session:

```php
class SetLocaleController extends Controller
{
    public function index($locale){
        if (! in_array($locale, ['en', 'fr'])) {
            abort(400);
        }
        session()->put('locale', $locale);
        return back();
     }
}
```

dans /routes/web.php, définir des itinéraires pour stocker la langue sélectionnée:

```php
Route::get('/lang/{locale}', [App\Http\Controllers\SetLocaleController::class, 'index'])->name('lang');
```

créer un middleware pour gérer la détection et la configuration de la langue.

`php artisan make:middleware SetLocale`

dans /app/Http/Middleware/SetLocale.php, définir le middleware:

```php
use Illuminate\Support\Facades\App;
...
public function handle(Request $request, Closure $next)
{
    if(session()->has('locale')){
        App::setLocale(session()->get('locale'));
    }
    return $next($request);
}
```

enregistrer le middleware dans /app/Http/Kernel.php

```php
protected $middlewareGroups = [
   'web' => [
    ... 
    \App\Http\Middleware\SetLocale::class, 
    ],
    ...
];
```

créer des fichiers de langue JSON -- J'utilise Laravel 9 donc il fault ajouter les fichiers /lang/en.json et /lang/fr.json -- et configurer dans /resources/views/layouts/app.blade.php

```php
<!--dropdown pour lang-->
<li class="nav-item dropdown">
    @php $locale = session()->get('locale'); @endphp
    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">@lang('Language') {{ $locale == '' ? '' : "($locale)" }}</a>
    <ul class="dropdown-menu">
        <li><a class="dropdown-item" href="{{ route('lang', 'fr') }}">@lang('French')</a></li>
        <li><a class="dropdown-item" href="{{ route('lang', 'en') }}">@lang('English')</a></li>
    </ul>
</li>
```

## 


