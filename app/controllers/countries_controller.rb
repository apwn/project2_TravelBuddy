class CountriesController < ApplicationController
  # User has to be logged in to access
  before_filter :authorize

  def index

  end

end
