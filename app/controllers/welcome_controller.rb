class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  before_action :get_public_regions, only: [:about, :contact]

  def index
    # Random companies
    # NOTE: .sample(4) is much slower request than .first(4)
    @companies = Company
      .not_soft_deleted
      .includes(
        :industries,
        :industry_taxonomies,
        :manufacturer_taxonomies,
        :manufacturers,
        :regions
      )
      .where(is_verified: true)
      .sample(4)

    render layout: 'blank'
  end

  def random
    @random_companies = Company
      .not_soft_deleted
      .where(is_verified: true)
      .includes(:regions)
      .sample(3)
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
