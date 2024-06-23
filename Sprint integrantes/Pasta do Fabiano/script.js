document.getElementById('customerForm').addEventListener('submit', function(event) {
    event.preventDefault();
    
    // Simples validação de campos
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const cep = document.getElementById('cep').value;
    const houseNumber = document.getElementById('houseNumber').value;
    const cpf = document.getElementById('cpf').value;

    if(email && phone && cep && houseNumber && cpf) {
        alert('Cadastro realizado com sucesso!');
    } else {
        alert('Por favor, preencha todos os campos corretamente.');
    }
});
