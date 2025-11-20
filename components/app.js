    const app = Vue.createApp({
        components: {
            'navbar-cursos-logado-component': NavbarCursosLogadoComponent,
            'navbar-abrir-curso-component': NavbarAbrirCursosComponent,
            'navbar-login-component': NavbarLoginComponent,
            'navbar-component': NavbarComponent,
            'footer-component': FooterComponent
        },
    });
    app.mount('#app');