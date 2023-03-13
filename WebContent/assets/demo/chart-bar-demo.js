// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily =
  '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = "#292b2c";

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var d1;
var d2;
var d3;
var d4;
var d5;
var d6;
var t1;
var t2;
var t3;
var t4;
var t5;
var t6;
var mx = document.getElementById("maximum").value;
// console.log(d4);
let title = [];
let data = [];
if (document.getElementById("data6") != null) {
  d6 = document.getElementById("data6").value;
  d5 = document.getElementById("data5").value;
  d4 = document.getElementById("data4").value;
  d3 = document.getElementById("data3").value;
  d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  t6 = document.getElementById("tittle6").title;
  t5 = document.getElementById("tittle5").title;
  t4 = document.getElementById("tittle4").title;
  t3 = document.getElementById("tittle3").title;
  t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1, t2, t3, t4, t5, t6];
  data = [d1, d2, d3, d4, d5, d6];
} else if (document.getElementById("data5") != null) {
  // d6 = document.getElementById("data6").value;
  d5 = document.getElementById("data5").value;
  d4 = document.getElementById("data4").value;
  d3 = document.getElementById("data3").value;
  d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  // t6 = document.getElementById("tittle6").title;
  t5 = document.getElementById("tittle5").title;
  t4 = document.getElementById("tittle4").title;
  t3 = document.getElementById("tittle3").title;
  t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1, t2, t3, t4, t5];
  data = [d1, d2, d3, d4, d5];
} else if (document.getElementById("data4") != null) {
  // d6 = document.getElementById("data6").value;
  // d5 = document.getElementById("data5").value;
  d4 = document.getElementById("data4").value;
  d3 = document.getElementById("data3").value;
  d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  // t6 = document.getElementById("tittle6").title;
  // t5 = document.getElementById("tittle5").title;
  t4 = document.getElementById("tittle4").title;
  t3 = document.getElementById("tittle3").title;
  t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1, t2, t3, t4];
  data = [d1, d2, d3, d4];
} else if (document.getElementById("data3") != null) {
  // d6 = document.getElementById("data6").value;
  // d5 = document.getElementById("data5").value;
  // d4 = document.getElementById("data4").value;
  d3 = document.getElementById("data3").value;
  d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  // t6 = document.getElementById("tittle6").title;
  // t5 = document.getElementById("tittle5").title;
  // t4 = document.getElementById("tittle4").title;
  t3 = document.getElementById("tittle3").title;
  t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1, t2, t3];
  data = [d1, d2, d3];
} else if (document.getElementById("data2") != null) {
  // d6 = document.getElementById("data6").value;
  // d5 = document.getElementById("data5").value;
  // d4 = document.getElementById("data4").value;
  // d3 = document.getElementById("data3").value;
  d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  // t6 = document.getElementById("tittle6").title;
  // t5 = document.getElementById("tittle5").title;
  // t4 = document.getElementById("tittle4").title;
  // t3 = document.getElementById("tittle3").title;
  t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1, t2];
  data = [d1, d2];
} else if (document.getElementById("data1") != null) {
  // d6 = document.getElementById("data6").value;
  // d5 = document.getElementById("data5").value;
  // d4 = document.getElementById("data4").value;
  // d3 = document.getElementById("data3").value;
  // d2 = document.getElementById("data2").value;
  d1 = document.getElementById("data1").value;

  // t6 = document.getElementById("tittle6").title;
  // t5 = document.getElementById("tittle5").title;
  // t4 = document.getElementById("tittle4").title;
  // t3 = document.getElementById("tittle3").title;
  // t2 = document.getElementById("tittle2").title;
  t1 = document.getElementById("tittle1").title;
  title = [t1];
  data = [d1];
}

var myLineChart = new Chart(ctx, {
  type: "bar",
  data: {
    labels: title,
    datasets: [
      {
        label: "Succes PDF Generate & Send",
        // backgroundColor: "rgba(2,117,216,1)",
        backgroundColor: "#6a6a6a",
        borderColor: "rgba(2,117,216,1)",
        data: data,
      },
    ],
  },
  options: {
    scales: {
      xAxes: [
        {
          time: {
            unit: "",
          },
          gridLines: {
            display: false,
          },
          ticks: {
            maxTicksLimit: 6,
          },
        },
      ],
      yAxes: [
        {
          ticks: {
            min: 0,
            max: mx,
            maxTicksLimit: 5,
          },
          gridLines: {
            display: true,
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});

// data: {
//   labels: ["January", "February", "March", "April", "May", "June"],
//   datasets: [
//     {
//       label: "Revenue",
//       // backgroundColor: "rgba(2,117,216,1)",
//       backgroundColor: "#6a6a6a",
//       borderColor: "rgba(2,117,216,1)",
//       data: [4215, 5312, 6251, 7841, 9821, 14984],
//     },
//   ],
// },
