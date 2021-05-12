namespace :makeworks do
  desc "Add country_code from coordinates"
  task countrycode: :environment do
    Company.geocoded.each do |company|

      g = Geocoder.search(company.to_coordinates).first.data['address']
      if g.present?
        company.update!(country_code: g['country_code'].upcase)
      end
    end
  end
end
