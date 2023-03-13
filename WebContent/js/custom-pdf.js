var minDate, maxDate;

// Custom filtering function which will search data in column four between two values
$.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
  var min = minDate.val();
  var max = maxDate.val();
  var date = new Date(data[0]);
 
  if (
    (min === null && max === null) ||
    (min === null && date <= max) ||
    (min <= date && max === null) ||
    (min <= date && date <= max)
  ) {
    return true;
  }
  return false;
});

$(document).ready(function () {
  // Create date inputs
  minDate = new DateTime($("#min"), {
    format: "MMMM DD YYYY",
  });
  maxDate = new DateTime($("#max"), {
    format: "MMMM DD YYYY",
  });

  // DataTables initialisation
  var table = $("#customerTable").DataTable();

  // Refilter the table
  $("#min, #max").on("change", function () {
    table.draw();
  });
});

function clearInput() {
  var max = document.getElementById("max");
  if (max.value != "") {
    max.value = "";
    window.location.reload(true);
  }
  var min = document.getElementById("min");
  if (min.value != "") {
    min.value = "";
    window.location.reload(true);
  }
}
