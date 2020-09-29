class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @public_regions = Region.where(is_public: true)
  end

  def random
    @random_companies = Company
      .all
      .where(is_verified: true)
      .includes(:region)
      .sample(3)
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
