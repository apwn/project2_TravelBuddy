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
        onRegionClick: function (event, code) {
          window.location.href = "../map/" + code.toLowerCase()
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

      if (gon.country && !gon.countriescolor){
      var country = gon.country.toUpperCase();
      var countryColor = {};
      countryColor[country] = '#008080';

      var map = $('.world-map').vectorMap('get', 'mapObject');
      map.series.regions[0].setValues(countryColor);
      }

      if (gon.countriescolor){
        var country = gon.country.toUpperCase();
        gon.countriescolor[country] = '#008080';

        var map = $('.world-map').vectorMap('get', 'mapObject');
        map.series.regions[0].setValues(gon.countriescolor);
      }

      $('#visited-country-checkbox').on('click', function(){
        $('.cntrysave').click();
      });



});
