class WelcomeController < ApplicationController
  def index
    @random_companies = Company.all.sample(5)
  end
end
