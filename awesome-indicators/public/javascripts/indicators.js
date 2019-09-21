$(document).ready(function() {
  $('#example').DataTable({
    "ajax": {
      "url": "assets/indicators.json",
      "dataSrc": "indicators"
    },
    "columns": [
      { "data": "name",
        "render": function ( data, type, row ) {
          return '<a href="/indicators/' + row.id + '">' + data + '</a>';
        }
      },
      { "data": "category" },
      { "data": "unit" },
      { "data": "tags",
        "render": function ( data, type, row ) {
          return data.join(' ');
        }
      }
    ],
    "stateSave": true
  });
});