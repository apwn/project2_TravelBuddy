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
  end

end
