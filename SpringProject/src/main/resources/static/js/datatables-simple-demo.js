window.addEventListener('DOMContentLoaded', event => {
    // Simple-DataTables
    // https://github.com/fiduswriter/Simple-DataTables/wiki

    const datatablesSimpleList = document.querySelectorAll('.datatablesSimple');
    datatablesSimpleList.forEach(datatablesSimple => {
        new simpleDatatables.DataTable(datatablesSimple);
    });
});
