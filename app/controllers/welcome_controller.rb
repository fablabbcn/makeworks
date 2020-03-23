class WelcomeController < ApplicationController
  def index
    @all_regions = Region.all
    @random_companies = Company.all.sample(5)
  end

  def version
    render json: {
      env: Rails.env,
      rails: Rails.version,
      ruby: RUBY_VERSION,
      commit: `git rev-parse --short HEAD`.chomp || 'revision not found',
      branch: `git rev-parse --abbrev-ref HEAD`.chomp || 'branch not found',
    }
  end
end
