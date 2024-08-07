document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('form');

    form.addEventListener('submit', (event) => {
        if (!validateForm()) {
            event.preventDefault();
        }
    });

    function validateForm() {
        const nome = document.getElementById('nome').value.trim();
        const email = document.getElementById('email').value.trim();
        const satisfacao = document.getElementById('satisfacao').value;

        let isValid = true;

        clearErrors();

        if (nome === '') {
            showError('nome', 'O campo Nome é obrigatório.');
            isValid = false;
        }

        if (email === '') {
            showError('email', 'O campo E-mail é obrigatório.');
            isValid = false;
        } else if (!validateEmail(email)) {
            showError('email', 'O e-mail informado não é válido.');
            isValid = false;
        }

        if (satisfacao === '') {
            showError('satisfacao', 'O campo Grau de satisfação é obrigatório.');
            isValid = false;
        }

        return isValid;
    }

    function validateEmail(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    }

    function showError(id, message) {
        const input = document.getElementById(id);
        const error = document.createElement('div');
        error.className = 'error';
        error.textContent = message;
        input.parentElement.appendChild(error);
    }

    function clearErrors() {
        const errors = document.querySelectorAll('.error');
        errors.forEach(error => error.remove());
    }
});
