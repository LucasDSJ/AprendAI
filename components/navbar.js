const NavbarComponent ={
    template: `
        <nav class="navbar navbar-expand-lg p-2" style="padding-left: 20px; padding-right: 20px;">
        		<div class="container-fluid">
          			<a class="navbar-brand" href="index.html">AprendAI</a>
          			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" >
            			<span class="material-symbols-outlined fs-3">menu</span>
          			</button>
          			<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            			<ul class="navbar-nav p-2">
							<li class="nav-item"><a class="nav-link" href="index.html">Menu</a></li>
							<li class="nav-item"><a class="nav-link" href="cursos.php">Cursos</a></li>
							<li class="nav-item"><a class="nav-link" href="chatbot.html">Chat</a></li>
							<li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
							<li class="nav-item"><a class="nav-link" href="cadastro.html">Cadastrar</a></li>
            			</ul>
          			</div>
        		</div>
      	</nav>
    `
};

const NavbarLoginComponent = {
    template: `
        <nav class="navbar navbar-expand-lg p-2" style="padding-left: 20px; padding-right: 20px;">
        		<div class="container-fluid">
          			<a class="navbar-brand" href="index.html">Educação para Todos</a>
          			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" >
            			<span class="material-symbols-outlined fs-3">menu</span>
          			</button>
          			<div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            			<ul class="navbar-nav p-2">
							<li class="nav-item"><a class="nav-link" href="index.html">Menu</a></li>
							<li class="nav-item"><a class="nav-link" href="cursos.php">Cursos</a></li>
							<li class="nav-item"><a class="nav-link" href="chatbot.html">Chat</a></li>
            			</ul>
          			</div>
        		</div>
      	</nav>
    `
};

/* Caso a navbar de cima (principal) dê errado, usar a de baixo: 

<nav class="navbar navbar-expand-lg fixed-top" style="padding-left: 20px; padding-right: 20px;">
        <div class="container-fluid">
            <a class="navbar-brand" href="index.html">Educação para Todos</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="material-symbols-outlined fs-5">menu</span>
            </button>            
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="chatbot.html">Chat</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="login.html">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cadastro.html">Cadastrar</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
*/