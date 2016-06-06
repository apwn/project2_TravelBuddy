class CountriesController < ApplicationController
  # User has to be logged in to access
  before_filter :authorize

  def index
    @onevisitedcountry = Country.find_by user_id: current_user
    if @onevisitedcountry
      countriescolor= {}
      Country.where(user_id: current_user).find_each do |f|
        country = f.country.upcase
        countriescolor[country] = '#800020'
      end
      gon.countriescolor = countriescolor
    end
  end

  def show
    @cntrycode = "#{params[:id]}"
    gon.country = @cntrycode
    @visitedcountries = Country.find_by(user_id: current_user, country: @cntrycode)
    @countryinfo = CountryInfo.find_by countrycode: @cntrycode
    onevisitedcountry = Country.find_by user_id: current_user

    if onevisitedcountry
      countriescolor= {}
      Country.where(user_id: current_user).find_each do |f|
        country = f.country.upcase
        countriescolor[country] = '#800020'
      end
      gon.countriescolor = countriescolor
    end

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

    @cntrynametwitter = @countryname.split.join
    @twittervar = "%23#{@cntrynametwitter}%20%23travel"
    @twitter = Twitter::REST::Client.new do |config|
      config.consumer_key    = "GB9dtc5dy9aNBJf3v2S8qu4bx"
      config.consumer_secret = "IfWqsw17sDcHO1bkS8AShWzVEED867TnxNc1MD8UESmd7XO5An"
      config.access_token = "3030001322-Dwq4rpNDJyknSBupPdajjCBF3dVoCkfKzZ4TqKH"
      config.access_token_secret = "hQgKjEfd2xFSxBDBJ84nLNCZJCcdgQ0g6pgDOiQAtetPD"
    end
  end

    def create

      currentcountry = params["countryname"]
      newcountry = Country.new
      newcountry.user_id = current_user.id
      newcountry.country = currentcountry
      newcountry.save

      addcountry = current_user
      addcountry.visited_countries += 1
      addcountry.save

      userbadgescount = current_user.badges
      userbadge = Badge.find_by user_id: current_user

      if !userbadge
        newuserbadge = Badge.new
        newuserbadge.user_id = current_user.id
        newuserbadge.save
        userbadge = Badge.find_by user_id: current_user
      end

      totalvisited = current_user.visited_countries
      case totalvisited
        when 1
          userbadge.stay_at_home = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 5
          userbadge.day_tripper = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 10
          userbadge.explorer = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 20
          userbadge.itinerant = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 50
          userbadge.frequent_flyer = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 100
          userbadge.world_nomad = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 150
          userbadge.bird_of_passage = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 176
          userbadge.travel_hero = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
      end

      case currentcountry
        when 'ie'
          userbadge.leprechaun = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 'cr'
          userbadge.nature_lover = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
        when 'gl'
          userbadge.eskimo = true
          current_user.badges_count += 1
          current_user.save
          userbadge.save
      end

      redirect_to country_path
    end

    def update
      countrytodelete = Country.find_by(user_id: current_user, country: params["countryname"])
      countrytodelete.destroy

      deletecountry = current_user
      deletecountry.visited_countries -= 1
      deletecountry.save
      redirect_to "/map/#{params["countryname"]}"
    end

end
