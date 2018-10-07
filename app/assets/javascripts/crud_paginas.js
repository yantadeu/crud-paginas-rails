$(document).ready(function () {
    $('.multiselect').multiselect({
        enableFiltering: true,
        includeSelectAllOption: true,
        allSelectedText: 'Todos itens selecionados ...',
        nonSelectedText: 'Selecione um item ou mais',
        selectAllText: 'Selecionar Todos',
        filterPlaceholder: 'Pesquisar...'
    });
});