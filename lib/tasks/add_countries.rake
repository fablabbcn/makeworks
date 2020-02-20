namespace :makeworks do
  desc "Add from CSV"

  task add_country: [:environment] do
    require 'csv'

    csv = CSV.read("csv/organisation.csv", headers: true, col_sep: ",")
    csv.each_with_index do |row|
      Country.create!(
        m_id: row['_id'].delete("()").gsub('ObjectId',""),
        name: row['organisation_name'],
        can_signup: row['can_signup']
      )
    end

    File.open("csv/companies.json").each do |r|
      row = JSON.parse(r)

      next unless row["Organisation"]
      the_country = Country.find_by_m_id(row["Organisation"]["$oid"])
      if the_country.nil?
        puts "Cannot find Organization for: #{row}"
        next
      end
      Company.create!(
        m_id: row['_id'],
        country: the_country,
        address: row['Company_Address'],
        background: row['Company_Background'],
        file_types: row['File_Types'],
        intro: row['Intro'],
        large_run: row['Large_run'],
        lat: row['Latitude'],
        lng: row['Longitude'],
        location: row['Location'],
        medium_run: row['Medium_run'],
        minimum_order: row['Minimium_Order_Cost'],
        name: row['Name'],
        number_of_staff: row['Number_of_Staff'],
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
        top_image: row['Top_Image'],
        video_link: row['Video_link'],
        website: row['Company_Website'],
        #WARNING two fields like this YearFounded and Year_Founded. Get the bigger one?
        year_founded: [row['YearFounded'], row['Year_Founded']].map(&:to_i).max,
      )
    end

  end
end
