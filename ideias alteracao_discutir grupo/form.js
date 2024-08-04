// ---------- VALIDAÇÃO ---------- //
let senhaInput = document.getElementById("senha");
let senhaLabel = document.querySelector('label[for="text"]');
let senhaHelper = document.getElementById("senha-helper");

let emailInput = document.getElementById("email");
let emailLabel = document.querySelector('label[for="email"]');
let emailHelper = document.getElementById("email-helper");


function mostrarPopup(input, label){

// Mostrar popup de campo obrigatório
input.addEventListener("focus", function(){
  label.classList.add("required-popup")
})
// Ocultar popup de campo obrigatório
usernameInput.addEventListener("blur", function(){
    usernameLabel.classList.remove("required-popup")
  })
}

mostrarPopup(senhaInput, senhaLabel)

// Validar valor do input
senhaInput.addEventListener("change", function(evento){
  let valor = evento.target.value

  if(valor.length < 3){
    senhaInput.classList.remove("correct")
    senhaInput.classList.add("error")
    senhaHelper.classList.add("visible")
    senhaHelper.innerText = "Senha precisa ter 3 caracteres ou mais"
  }
  else{
    senhaInput.classList.add("correct")
    senhaInput.classList.remove("error")
    senhaHelper.classList.remove("visible")
    
  }
})

mostrarPopup(emailInput, emailLabel)

emailInput.addEventListener("change", function(evento){
  let valor = evento.target.value

  if(valor.includes("@") && valor.includes(".com")){
    emailInput.classList.add("correct")
    emailInput.classList.remove("error")
    emailHelper.classList.remove("visible")
    emailHelper.innerText = "E-mail inválido"
  }
  else{
    emailInput.classList.remove("correct")
    emailInput.classList.add("error")
    emailHelper.classList.add("visible")
    
  }
})