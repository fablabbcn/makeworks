class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :get_public_regions, only: [:about, :contact, :index]

  def about
    render layout: 'blank'
  end

  def index
    # Random companies
    # NOTE: .sample(4) is much slower request than .first(4)
    @companies = Company
      .not_soft_deleted
      .verified
      .sample(4)

    render layout: 'blank'
  end

  def random
    @random_companies = Company
      .not_soft_deleted
      .verified
      .includes(:regions)
      .sample(4)
  end

  def stats
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

  def get_public_regions
    @public_regions = Region.where(is_public: true)
  end
end
