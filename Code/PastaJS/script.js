function addProduto() {
    var form = document.getElementById('addProduto');
    var dados = new FormData(form);

    fetch("../PastaPHP/addProduto.php", {
        method: "POST",
        body: dados
    });
}