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
  $("#historyTable").DataTable({
    paging: true,
    ordering: false,
    info: false,
    searching: false,
  });
});
$(document).ready(function () {
  $("#outletTable").DataTable({});
});
// $(document).ready(function () {
//     $('#customerTable').DataTable({

//         pagingType: 'full_numbers',
//     });
// });

// $(document).ready(function () {
//   $("#customerTable").DataTable();
// });TransactionsTablediscountsTables
$(document).ready(function () {
  $("#TransactionsTable").DataTable({});
});

$(document).ready(function () {
  $("#discountsTables").DataTable({
    responsive: true,
    paging: false,
    ordering: false,
    searching: false,
    scrollY: 200,
  });
});
$(document).ready(function () {
  $("#discountsTable").DataTable({
    responsive: true,
    paging: true,
    // info: true,
    // columnDefs:[
    //   {
    //     target:[0],
    //     visible:true,
    //     ordering: false
    //   },
    // {
    //   target:[1,2,3,4,5,6,7,8],
    //   visible:true,
    //   ordering: true,
    // },
    // {
    //   target:[9,10],
    //   visible:false,
    //   ordering: true,
    // },

    // ],
    // searching: false,
  });
});
