namespace :makeworks do
  desc "Add from CSV"

  task add_country: [:environment] do
    require 'csv'

    csv = CSV.read("csv/organisation.csv", headers: true, col_sep: ",")

    csv.each_with_index do |row|
      #next
      Country.create!(
        m_id: row['_id'].delete("()").gsub('ObjectId',""),
        name: row['organisation_name'],
        can_signup: row['can_signup']
      )
    end

    CSV.read("csv/companies.tsv", encoding:"utf-8", headers: true, col_sep: "\t").each do |row|

      the_country = Country.find_by_m_id(row['Organisation'])
      if the_country.nil?
        puts "Cannot find #{row['Organisation']}"
        next
      end
      Company.create!(
        m_id: row['_id'],
        country: the_country,
        name: row['Company_Name'],
        address: row['Company_Address'],
        website: row['Company_Website'],
        background: row['Company_Background'],
        #number_of_staff: row['Number_of_Staff'],
        year_founded: row['YearFounded'],
        video_link: row['Video_link'],
        lat: row['Latitude'],
        lng: row['Longitude'],
        photo1: row['Photo1'],
        photo2: row['Photo2'],
        photo3: row['Photo3'],
        photo4: row['Photo4'],
        photo5: row['Photo5'],
        photo6: row['Photo6'],
        photo7: row['Photo7'],
        photo8: row['Photo8'],
        photo9: row['Photo9'],
        portrait: row['Portrait'],
        sample_production: row['Sample_production'],

        #intro: row['Intro'],
        #large_run: row['Large_run'],
        #medium_run: row['Medium_run'],
        #minimum_order: row['Minimum_Order'],
        #location: row['Location'], ?????
      )
    end

  end
end
