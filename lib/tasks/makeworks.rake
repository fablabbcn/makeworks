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

  DEFAULT_ALIASES = {
    "Make Works UAE": [
      "Make Works United Arab Emirates",
    ],
    "Make Works Vienna": [
      "Make Works Wien"
    ],
    "Make Works Catalonia": [
      "Make Works Cataluña",
      "Make Works Catalunya"
    ],
    "Make Works Iceland": [
      "Make Works Ísland"
    ],
    "Make Works Kingston NY": [
      "Make Works Kingston New York"
    ],
    "Make Works Sweden": [
      "Make Works Sverige"
    ]
  }

  desc "Add some common region aliases"
  task create_region_aliases: :environment do
    DEFAULT_ALIASES.each do |region_name, aliases|
      region = Region.find_by(name: region_name)
      unless region
        puts "Region with name '#{region_name}' not found, skipping..."
        next
      end

      aliases.each do |alias_name|
        region.aliases.find_or_create_by(alias: alias_name)
      end
    end
  end
end
