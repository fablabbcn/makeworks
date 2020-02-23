namespace :makeworks do
  desc "Add from .json files"

  task import_all: [:environment] do

    File.open("csv/organisation.json").each do |r|
      row = JSON.parse(r)
      Region.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['organisation_name'],
        #short_name: row['short_name'],
        trimmed_name: row['orgainisation_trimmed_name'],
        logo: row['logo'],
        can_signup: row['can_signup'],
        is_public: row['is_public']
      )
    end


    File.open("csv/user.json").each do |r|
      row = JSON.parse(r)

      # find all orgs/region that user belongs to
      all_orgs = []
      row["organisations"].each do |o|
        all_orgs << Region.find_by_m_id(o["$oid"])
      end

      User.find_or_create_by(
        m_id: row['_id']['$oid'],
        regions: all_orgs,
        email: row['email'],
        first_name: row['first_name'],
        last_name: row['last_name'],
        is_admin: row['is_admin']
      )
    end


    File.open("csv/taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = Taxonomy.find_by_m_id(row['parent']['$oid'])
      else
        the_parent = nil
      end
      Taxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        taxonomy: row['taxonomy'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/machines_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = MachinesTaxonomy.find_by_m_id(row['parent']['$oid'])
      else
        the_parent = nil
      end
      MachinesTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/materials_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = MaterialsTaxonomy.find_by_m_id(row['parent']['$oid'])
      else
        the_parent = nil
      end
      MaterialsTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/finished_products_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = FinishedProductsTaxonomy.find_by_m_id(row['parent']['$oid'])
      else
        the_parent = nil
      end
      FinishedProductsTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end


    File.open("csv/companies.json").each do |r|
      row = JSON.parse(r)

      next unless row["Organisation"]
      the_region = Region.find_by_m_id(row["Organisation"]["$oid"])
      if the_region.nil?
        puts "-- Cannot find Organization for: #{row}"
        next
      end
      Company.find_or_create_by(
        m_id: row['_id']['$oid'],
        region: the_region,
        address: row['Company_Address'],
        background: row['Company_Background'],
        file_types: row['File_Types'],
        intro: row['Intro'],
        large_run: row['Large_run'].to_s.downcase == "true",
        lat: row['Latitude'],
        lng: row['Longitude'],
        location: row['Location'],
        medium_run: row['Medium_run'],
        minimum_order: row['Minimium_Order_Cost'],
        name: row['Company_Name'],
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
