function addProduto() {
    var form = document.getElementById('addProduto');
    var dados = new FormData(form);

    fetch("../PastaPHP/addProduto.php", {
        method: "POST",
        body: dados
    });
}

window.onload = async function(){
    var resultado = await fetch("../PastaPHP/getProduto.php", {
        method: "GET",
    });
    var dados = await resultado.json();
    for (var i = 0; i < dados.length; i++) {

        var conteudo = `<div class="card my-2 mx-2" width= "18rem">
        <img src="../Data/ImgProd/Caneta.jpg" class="card-img-top" alt="Imagem Produto">
        <div class="card-body col-12">
          <h5 class="card-title">${dados[i].nome}</h5>
          <p class="card-text">${dados[i].preco}</p>
          <a href="#" class="btn btn-primary col-12">Adicionar ao carrinho!</a>
        </div>
      </div>`;

        document.getElementById("cards").innerHTML += conteudo;
    }
}