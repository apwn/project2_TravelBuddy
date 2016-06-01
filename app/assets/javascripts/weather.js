$(document).ready(function() {

  var weatherlocation = gon.capital + ', ' + gon.country;
  console.log(weatherlocation);

  function loadWeather(location) {
  $.simpleWeather({
    location: location,
    woeid: '',
    unit: 'c',
    success: function(weather) {
      html = '<div class="valign"><h2><i class="icon-'+weather.code+'"></i> '+weather.temp+'&deg;'+weather.units.temp+'</h2>';
      html += '<ul><li>'+weather.city+', '+gon.countryname+'</li>';
      // html += '<li class="currently">'+weather.currently+'</li>';
      html += '</ul></div>';

      $(".weather-info").html(html);
    },
    error: function(error) {
      $(".weather-info").html('<p>'+error+'</p>');
    }
  });
}

loadWeather(weatherlocation);


});
