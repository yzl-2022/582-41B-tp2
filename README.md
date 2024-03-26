# Laravel - TP2 - Documentation

**lien ver webdev** <https://e2296635.webdev.cmaisonneuve.qc.ca/cardTP2/>

**lien ver github** <https://github.com/yzl-2022/582-41B-tp2.git>

utilisateur pour tester: 123@123.com 
mot de passe: 123456789

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

## Permettre un système multilingue, français en anglais.

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

## Créer un nouvel utilisateur si l'étudiant existe

`php artisan make:controller UserController -m User`

/app/Models/User.php existe pendant installation du Laravel, donc cette commande va créer /app/Http/Controllers/UserController.php

```php
use Illuminate\Support\Facades\Hash;
...
public function create()
{
    return view('user.create');
}
...
public function store(Request $request)
{
    $request->validate([
        'name' => 'required|exists:App\Models\Etudiant,nom',
        'email' => 'required|email|unique:users|exists:App\Models\Etudiant,email',
        'password' => 'required|min:6|max:20'
    ]);

    $user = new User;
    $user->fill($request->all());
    $user->password = Hash::make($request->password);
    $user->save();

    return redirect(route('login'))->withSuccess('User created successfully!');
}
```

ajouter 2 routes dans /routes/web.php pour que les étudiants puissent entre le mot de passe.

```php
Route::get('/inscription', [App\Http\Controllers\UserController::class, 'create'])->name('user.create');
Route::post('/inscription', [App\Http\Controllers\UserController::class, 'store'])->name('user.store');
```

## Page de connexion

`php artisan make:controller AuthController -r`

ajouter les routes dans /routes/web.php

```php
Route::get('/login', [App\Http\Controllers\AuthController::class, 'create'])->name('login');
Route::post('/login', [App\Http\Controllers\AuthController::class, 'store'])->name('login.store');
Route::get('/logout', [App\Http\Controllers\AuthController::class, 'destroy'])->name('logout')->middleware('auth');
```
 
configurer dans /app/Http/Controllers/AuthController pour afficher les views dans /resources/views/auth/create.blade.php

```php
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
...
public function create()
{
    return view('auth.create');
}
...
public function store(Request $request)
{
    $request->validate([
        'email' => 'required|email|exists:users',
        'password' => 'required|min:6|max:20'
    ]);
    $credentials = $request->only('email', 'password');
    if(!Auth::validate($credentials)):
        return redirect(route('login'))
                    ->withErrors(trans('auth.failed'))
                    ->withInput();
    endif;
    $user = Auth::getProvider()->retrieveByCredentials($credentials);
    Auth::login($user);
    return redirect()->intended(route('login'))->withSuccess('Signed in');
}
...
public function destroy()
{
    Session::flush();
    Auth::logout();
    return redirect(route('login'));
}
```

## Forum d'articles

`php artisan make:model Article -m`

dans /database/migrations/YYYY_MM_DD_NUMBER_create_articles_table.php

```php
public function up()
{
    Schema::create('articles', function (Blueprint $table) {
        $table->id();
        $table->string('title');
        $table->date('date');
        $table->text('content');
        $table->unsignedBigInteger('user_id');
        $table->timestamps();
        //foreign-key
        $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
    });
}
```

exécuter `php artisan migrate` va créer un fichier /app/Models/Article.php

```php
use Illuminate\Database\Eloquent\Casts\Attribute;
...
class Article extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'date',
        'content',
        'user_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
```

et ajouter la relation dans /app/Models/User.php

```php
public function articles()
{
    return $this->hasMany(Article::class);
}
```

exécuter `php artisan make:controller ArticleController -m Article` et ajouter dans /app/Controllers/ArticleController.php

```php
use Illuminate\Support\Facades\Auth;
...
//TODO
```

ajouter les routes dans /routes/web.php

```php
Route::middleware('auth')->group(function(){
    /** routes pour articles */
    Route::get('/articles', [App\Http\Controllers\ArticleController::class, 'index'])->name('article.index');
    Route::get('/article/{id}', [App\Http\Controllers\ArticleController::class, 'show'])->where('id', '[0-9]+')->name('article.show');
    Route::get('/create/article', [App\Http\Controllers\ArticleController::class, 'create'])->name('article.create');
    Route::post('/create/article', [App\Http\Controllers\ArticleController::class, 'store'])->name('article.store');
    Route::get('/edit/article/{id}', [App\Http\Controllers\ArticleController::class, 'edit'])->where('id', '[0-9]+')->name('article.edit');
    Route::put('/edit/article/{id}', [App\Http\Controllers\ArticleController::class, 'update'])->where('id', '[0-9]+')->name('article.update');
    Route::delete('/article/{id}', [App\Http\Controllers\ArticleController::class, 'destroy'])->where('id', '[0-9]+')->name('article.delete');
});
```

## Répertoire de documents -- comme ci-dessus