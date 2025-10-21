    const app = Vue.createApp({
        components: {
            'navbar-login-component': NavbarLoginComponent,
            'navbar-component': NavbarComponent,
            'footer-component': FooterComponent
        },
    });
    app.mount('#app');