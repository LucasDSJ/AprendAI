document.addEventListener("DOMContentLoaded", () => {
  const input = document.getElementById("mensagemInput");
  const btn = document.getElementById("enviarBtn");
  const chatArea = document.getElementById("area_conteudo");

  async function enviarMensagem() {
    const mensagem = input.value.trim();
    if (!mensagem) return;

    // Exibe a mensagem do usuário
    chatArea.innerHTML += `
      <div class="mensagem usuario bg-primary text-white p-2 rounded-3 ms-auto mb-2 w-75 text-end">
        ${mensagem}
      </div>
    `;
    input.value = "";
    chatArea.scrollTop = chatArea.scrollHeight;

    // Envia para o backend PHP
    try {
      const res = await fetch("backend/chat.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        
        // IMPORTANTE O TOKEN ABAIXO ESTAR NO CÓDIGO DE PHP TAMBÉM 
        body: JSON.stringify({ message: mensagem, token: "voce-e-um-de-nos" }) 
      });

      const data = await res.json();

      if (data.error) {
        chatArea.innerHTML += `
          <div class="mensagem bot bg-danger-subtle text-dark p-2 rounded-3 mb-2 w-75">
            Erro: ${data.error}
          </div>
        `;
      } else {
        chatArea.innerHTML += `
          <div class="mensagem bot bg-secondary-subtle text-dark p-2 rounded-3 mb-2 w-75">
            ${data.resposta}
          </div>
        `;
      }

      chatArea.scrollTop = chatArea.scrollHeight;
    } catch (err) {
      chatArea.innerHTML += `
        <div class="mensagem bot bg-danger-subtle text-dark p-2 rounded-3 mb-2 w-75">
          Erro ao se conectar ao servidor.
        </div>
      `;
    }
  }

  btn.addEventListener("click", enviarMensagem);
  input.addEventListener("keypress", (e) => {
    if (e.key === "Enter") enviarMensagem();
  });
});
