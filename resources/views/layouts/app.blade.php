<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Laravel TP1 - Zele Yu - 2296635">
    <meta name="keywords" content="Bootstrap, Laravel, PHP">
    <title>{{ config('app.name') }} - @yield('title')</title>
    <!--ajouter CSS du Bootstrap-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <header>
        <nav class="navbar bg-dark navbar-expand-sm bg-body-tertiary" data-bs-theme="dark">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">{{ config('app.name') }}</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Accueil' ? 'active' : '' }}" aria-current="page" href="{{ asset('/') }}">@lang('Home')</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Étudiants' ? 'active' : '' }}" href="{{ route('etudiant.index') }}">@lang('Students')</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Ajouter étudiant' ? 'active' : '' }}" href="{{ route('etudiant.create') }}">@lang('AddStudent')</a>
                    </li>
                    <!--login-->
                    @guest
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Inscription' ? 'active' : '' }}" href="{{ route('user.create') }}">Inscription</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Login' ? 'active' : '' }}" href="{{ route('login') }}">@lang('Login')</a>
                    </li>
                    @else
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Articles' ? 'active' : '' }}" href="{{ route('article.index') }}">Articles</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Ajouter article' ? 'active' : '' }}" href="{{ route('article.create') }}">@lang('Add') article</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Documents' ? 'active' : '' }}" href="{{ route('document.index') }}">Documents</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Ajouter document' ? 'active' : '' }}" href="{{ route('document.create') }}">@lang('Add') document</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link {{ $__env->yieldContent('title') == 'Logout' ? 'active' : '' }}" href="{{ route('logout') }}">@lang('Logout')</a>
                    </li>
                    @endguest
                    <!--dropdown for language-->
                    <li class="nav-item dropdown">
                    @php $locale = session()->get('locale'); @endphp
                        <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">@lang('Language') {{ $locale == '' ? '' : "($locale)" }}</a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="{{ route('lang', 'fr') }}">@lang('French')</a></li>
                            <li><a class="dropdown-item" href="{{ route('lang', 'en') }}">@lang('English')</a></li>
                        </ul>
                    </li>
                </ul>
                </div>
            </div>
        </nav>
    </header>
    <main class="container">
        @yield('content')
    </main>
    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top bg-dark" data-bs-theme="dark">
        <div class="col-md-4 d-flex align-items-center">
            <a href="/" class="mb-3 me-2 mb-md-0 text-body-secondary text-decoration-none lh-1">
                <svg class="bi" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
            </a>
            <span class="mb-3 mb-md-0 text-body-secondary">&copy; 2024 Site-Étudiants, Inc</span>
        </div>

        <ul class="nav col-md-4 justify-content-end list-unstyled d-flex">
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#twitter"/></svg></a></li>
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#instagram"/></svg></a></li>
            <li class="ms-3"><a class="text-body-secondary" href="#"><svg class="bi" width="24" height="24"><use xlink:href="#facebook"/></svg></a></li>
        </ul>
    </footer>
</body>
<!--ajouter JS du Bootstrap-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
