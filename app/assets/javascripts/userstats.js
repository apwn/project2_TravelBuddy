$(document).ready(function() {

google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Countries Visited', 'Countries To Explore'],
          ['Countries Visited', gon.visited],
          ['Countries To Explore', gon.remaining]
        ]);

        var options = {
          backgroundColor: 'transparent',
          // width: '500px',
          // height: '380px',
          chartArea:{top:20, 'height': '75%'},
          colors: ['#800020', 'orange'],
          pieHole: 0.4,
          legend: {position: 'labeled', alignment: 'center', textStyle: {fontSize: '16'}}
        };

        var chart = new google.visualization.PieChart(document.getElementById('visitedchart'));
        chart.draw(data, options);
      }


});
