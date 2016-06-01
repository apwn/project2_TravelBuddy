class CountriesController < ApplicationController
  # User has to be logged in to access
  before_filter :authorize

  def index

  end

  def show
    @cntrycode = "#{params[:id]}"
    gon.country = @cntrycode
    @country = HTTParty.get "https://restcountries.eu/rest/v1/alpha/#{ @cntrycode }"
    gon.capital = @country["capital"]
    gon.countryname = @country["name"]
    @cntryname = @country["name"].downcase

    # @flickrimg = HTTParty.get "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=ae5c1da80ad14208768b6c79a7de337b&text=france&sort=interestingness-desc&content_type=1&format=json&nojsoncallback=1&auth_token=72157668350570510-27a14c940b472184&api_sig=9a5b379027acb728169b025ee86df47f"

    @flickrimg = HTTParty.get "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=ae5c1da80ad14208768b6c79a7de337b&text=#{ @cntryname } travel&sort=relevance&content_type=1&format=json&nojsoncallback=1"
  end

end
