function gravarRegistro(){
    var form = document.getElementById('formulario');
    var dados = new FormData(form);

    fetch("PastaPHP/registro.php", {
        method: "POST",
        body: dados
    });
}