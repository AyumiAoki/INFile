/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('#termoM').modal('show');
$('#load').hide();


var tabela = document.getElementById("minhaTabela");
var linhas = tabela.getElementsByTagName("tr");

for (var i = 0; i < linhas.length; i++) {
    var linha = linhas[i];
    linha.addEventListener("click", function () {
        //Adicionar ao atual
        selLinha(this, false); //Selecione apenas um
        //selLinha(this, true); //Selecione quantos quiser
    });
}

/**
 Caso passe true, você pode selecionar multiplas linhas.
 Caso passe false, você só pode selecionar uma linha por vez.
 **/
function selLinha(linha, multiplos) {
    if (!multiplos) {
        var linhas = linha.parentElement.getElementsByTagName("tr");
        for (var i = 0; i < linhas.length; i++) {
            var linha_ = linhas[i];
            linha_.classList.remove("selecionado");
        }
    }
    linha.classList.toggle("selecionado");
}

/**
 Exemplo de como capturar os dados
 **/
var btnVisualizar = document.getElementById("addRow");
var matricula = "";
var nome = "";

btnVisualizar.addEventListener("click", function () {
    var selecionados = tabela.getElementsByClassName("selecionado");
    //Verificar se eestá selecionado
    if (selecionados.length < 1) {
        alert("Selecione pelo menos uma linha");
        return false;
    }

    matricula = "";
    nome = "";

    for (var i = 0; i < selecionados.length; i++) {
        var selecionado = selecionados[i];
        selecionado = selecionado.getElementsByTagName("td");
        nome += selecionado[0].innerHTML;
        matricula += selecionado[1].innerHTML;
    }
});

// add row
$("#addRow").click(function () {
    var html = '';
    html += '<div id="inputFormRow">';
    html += '<div class="form-group">';
    html += '<div class="mx-2">';
    html += '<label class="text-muted">' + nome + '</label>';
    html += '<div class="input-group mb-3">';
    html += '<input type="text" name="myCountry[]" id="myInput" readonly value="' + matricula + '" class="form-control m-input" placeholder="Matrícula" autocomplete="off" required="">';
    html += '<div class="input-group-append">';
    html += '<button id="removeRow" type="button" class="btn btn-danger"> <i class="fa fa-trash"></i> </button>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';
    html += '</div>';

    $('#newRow').append(html);
});

// remove row
$(document).on('click', '#removeRow', function () {
    $(this).closest('#inputFormRow').remove();
});

// input file 
$('#projeto').on('change', function () {
    var fileName = $(this).val();
    $(this).next('.custom-file-label').html(fileName);
});

// input file 
$('#termo').on('change', function () {
    var fileName = $(this).val();
    $(this).next('.custom-file-label').html(fileName);
});

//search bar
$(document).ready(function () {
    $("#search").on("keyup", function () {
        Daley();
        var value = $(this).val().toLowerCase();
        $("#minhaTabela tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });
});

function Daley() {
    $('#load').show();
    $('#minhaTabela').hide();
    $('#load').delay("slow").fadeOut();
    $("#minhaTabela").delay("slow").fadeIn();
}