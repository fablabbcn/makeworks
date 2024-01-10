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

  desc "Delete spam users from CSV file"
  task delete_spam_users: :environment do
    require 'csv'
    path = ENV.fetch("SPAM_USERS_CSV")
    CSV.foreach(path,  encoding: "bom|utf-8", liberal_parsing: true, col_sep: ";") do |line|
        if line[1] == "TRUE"
          line[0].split(";").each do |email|
            user = User.find_by(email: email.strip)
            if user
              user.discard!
            else
              print "WARN: user not found  for email: #{email.strip}"
            end
          end
        end
    end
  end
end
