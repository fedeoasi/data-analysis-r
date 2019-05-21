$(document).ready(function() {
  $('#example').DataTable({
    "ajax": {
      "url": "assets/indicators.json",
      "dataSrc": "indicators"
    },
    "columns": [
      { "data": "name",
        "render": function ( data, type, row ) {
          return '<a href="' + row.link + '">' + data + '</a>';
        }
      },
      { "data": "category" },
      { "data": "unit" }
    ]
  });
});