class WelcomeController < ApplicationController
  def index
    @all_regions = Region.all
    @random_companies = Company.all.sample(5)
  end
end
