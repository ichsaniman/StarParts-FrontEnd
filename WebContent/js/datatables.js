$(document).ready(function () {
    $("#myTable").DataTable({
      columnDefs: [
        {
            targets: [0],
            orderData: [0, 1],
        },
        {
            targets: [1],
            orderData: [1, 0],
        },
        {
            targets: [4],
            orderData: [4, 0],
        },
    ],
    });
  });

  $(document).ready(function () {
    $('#historyTable').DataTable({
        paging: true,
        ordering: false,
        info: false,
        searching:false,
    });
});

  $(document).ready(function () {
	  $("#customerTable").DataTable();
	});

  
