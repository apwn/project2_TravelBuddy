$(function(){


      $('.world-map').vectorMap({
        map: 'world_mill',
        backgroundColor: '#fff',
        regionStyle: {
          initial: {
            fill: 'orange',
            "fill-opacity": 1,
            stroke: 'none',
            "stroke-width": 0,
            "stroke-opacity": 1
          }
        },
        series: {
          regions: [{
              // values: {
              //   // FR: '#88f2f8'
              // },
              attribute: 'fill'
          }]
        }
      });

      if (gon.country){
      var country = gon.country.toUpperCase();
      var countryColor = {};
      countryColor[country] = '#88f2f8';

      var map = $('.world-map').vectorMap('get', 'mapObject');
      map.series.regions[0].setValues(countryColor);
      }


});
