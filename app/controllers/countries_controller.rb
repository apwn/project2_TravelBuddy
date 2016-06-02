class CountriesController < ApplicationController
  # User has to be logged in to access
  before_filter :authorize

  def index

  end

  def show
    @cntrycode = "#{params[:id]}"
    gon.country = @cntrycode
    @countryinfo = CountryInfo.find_by countrycode: @cntrycode

    if @countryinfo
      @countryname = @countryinfo.name
      @countrycapital = @countryinfo.capital
      @countryregion = @countryinfo.region
      @countrypopulation = @countryinfo.population
      @countrycallingcode = @countryinfo.callingcode
      @countryarea = @countryinfo.area
    else
      @country = HTTParty.get "https://restcountries.eu/rest/v1/alpha/#{ @cntrycode }"
      newcountry = CountryInfo.new
      newcountry.name = @country["name"]
      newcountry.countrycode = @cntrycode
      newcountry.capital = @country["capital"]
      newcountry.region = @country["region"]
      newcountry.population = @country["population"]
      newcountry.area = @country["area"]
      newcountry.callingcode = @country["callingCodes"][0]
      newcountry.demonym = @country["demonym"]
      newcountry.currency = @country["currencies"][0]
      newcountry.save

      @countryname = @country["name"]
      @countrycapital = @country["capital"]
      @countryregion = @country["region"]
      @countrypopulation = @country["population"]
      @countrycallingcode = @country["callingCodes"][0]
      @countryarea = @country["area"]
    
    end

    gon.capital = @countrycapital
    gon.countryname = @countryname
    @cntryname = @countryname.downcase

    @flickrimg = HTTParty.get "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=f1d62c1433245e6f2024103335abd75a&text=#{ @cntryname } travel&sort=relevance&content_type=1&format=json&nojsoncallback=1"
  end

end
