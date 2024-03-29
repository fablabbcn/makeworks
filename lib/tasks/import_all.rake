namespace :makeworks do
  include ActionView::Helpers::TextHelper
  desc "Add from .json files"

  task import_all: [:environment] do

    ProductionAccess.create(position: 1, name: 'Closed: No Access')
    ProductionAccess.create(position: 2, name: 'Trade Counter')
    ProductionAccess.create(position: 3, name: 'Limited: Limited access to some production facilities')
    ProductionAccess.create(position: 4, name: 'Project Specific: Depends on project and requirements')
    ProductionAccess.create(position: 5, name: 'By Appointment: Access to visit the facitilies depending on the project')
    ProductionAccess.create(position: 6, name: 'Workshop & Classes')
    ProductionAccess.create(position: 7, name: 'Open: General access')

    puts "Creating Regions..."
    File.open("csv/organisation.json").each do |r|
      row = JSON.parse(r)
      Region.create_with(
        name: row['organisation_name'],
        #short_name: row['short_name'],
        slug: row['orgainisation_trimmed_name'],
        logo: row['logo'],
        can_signup: row['can_signup'],
        is_public: row['is_public']
      ).find_or_create_by(
        m_id: row['_id']['$oid']
      )
    end

    puts "Creating Users..."
    File.open("csv/user.json").each do |r|
      row = JSON.parse(r)

      # find all orgs/region that user belongs to
      all_orgs = []
      row["organisations"].each do |o|
        all_orgs << Region.find_by(m_id: o["$oid"]) if Region.find_by(m_id: o["$oid"]).present?
      end

      the_pass = rand(36**10).to_s(36)
      p "#{the_pass} #{row['email']}"
      User.create(
        m_id: row['_id']['$oid'],
        regions: all_orgs,
        email: row['email'],
        first_name: row['first_name'],
        last_name: row['last_name'],
        password: the_pass,
        is_admin: row['is_admin']
      )
    end


    puts "Creating Taxonomy..."
    File.open("csv/taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = Taxonomy.find_by(m_id: row['parent']['$oid'])
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

    puts "Creating Machine Taxonomy..."
    File.open("csv/machines_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = MachinesTaxonomy.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      MachinesTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    puts "Creating Manufacturer Taxonomy..."
    File.open("csv/manufacturers_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = ManufacturerTaxonomy.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      ManufacturerTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/materials_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = Material.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      Material.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/finished_products_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = FinishedProductsTaxonomy.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      FinishedProductsTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    File.open("csv/industry_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = IndustryTaxonomy.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      IndustryTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end

    puts "Creating ProcessTaxonomy..."
    File.open("csv/process_taxonomy.json").each do |r|
      row = JSON.parse(r)

      if row['parent']
        the_parent = ProcessTaxonomy.find_by(m_id: row['parent']['$oid'])
      else
        the_parent = nil
      end
      ProcessTaxonomy.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name'],
        parent: the_parent
      )
    end


    puts "Creating Companies..."
    File.open("csv/companies.json").each do |r|
      row = JSON.parse(r)

      next unless row["Organisation"]

      the_region = Region.find_by(m_id: row["Organisation"]["$oid"])
      if the_region.nil?
        puts "-- Cannot find Organization for: #{row}"
        next
      end

      company = Company.create_with(
        created_at: row['Timestamp'],
        regions: [the_region],
        address: row['Company_Address'],
        background: row['Company_Background'],
        contact_email: row['Contact_Email'],
        contact_jobtitle: row['Contact_Jobtitle'],
        contact_name: row['Contact_Name'],
        contact_phone: row['Contact_Phone_Number'],
        description: row['Description'],
        facebook: row['Facebook'],
        flickr: row['Flickr'],
        file_types: row['File_Types'],
        film_ready: row['Film_ready'],
        image_bucket: row['Image_Bucket'],
        instagram: row['Instagram'],
        is_verified: true,
        linkedin: row['LinkedIn'],
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
        pinterest: row['Pinterest'],
        production_specifics: row['ProductionSpecifics'],
        sample_production: row['Sample_production'],
        short_run: row['Short_run'],
        soft_delete: row['Soft_Delete'],
        title: row['Title'],
        top_image: row['Top_Image'],
        slug: row['Trimmed_name'],
        turnaround_time: row['Turnaround_Time'],
        twitter: row['Twitter'],
        video_link: row['Video_link'],
        been_visited: row['Been_visited'].to_s.downcase == "true" || row['Been_visited'].to_s.downcase == "yes",
        bespoke_one_offs: row['Bespoke_one_offs'],
        works_with_general_public: row['Works_with_general_public'],
        works_with_large_business: row['Works_with_large_business'],
        works_with_professionals: row['Works_with_professionals'],
        works_with_small_companies: row['Works_with_small_companies'],
        works_with_students: row['Works_with_students'],
        batch_production: row['Batch_production'],
        production_access: row['Production_Access'],
        website: row['Company_Website'],
        youtube: row['YouTube'],
        #WARNING two fields like this YearFounded and Year_Founded. Get the bigger one?
        year_founded: [row['YearFounded'], row['Year_Founded']].map(&:to_i).max
      ).find_or_create_by(
        m_id: row['_id']['$oid'],
      )

      # Create references to the company just created
      if row["FinishedProducts"].present?
        row["FinishedProducts"].each do |item|
          fp = FinishedProductsTaxonomy.find_by(m_id: item["$oid"])
          FinishedProduct.find_or_create_by(
            company: company,
            finished_products_taxonomy: fp
          )
        end
      end

      if row["Processes"].present?
        row["Processes"].each do |item|
          pt = ProcessTaxonomy.find_by(m_id: item["$oid"])
          CompanyProcess.find_or_create_by(
            company: company,
            process_taxonomy: pt
          )
        end
      end

      if row["Industry"].present?
        row["Industry"].each do |item|
          indst = IndustryTaxonomy.find_by(m_id: item["$oid"])
          Industry.find_or_create_by(
            company: company,
            industry_taxonomy: indst
          )
        end
      end

      if row["Materials"].present?
        row["Materials"].each do |item|
          mat = Material.find_by(m_id: item["$oid"])
          MaterialTag.find_or_create_by(
            company: company,
            material: mat
          )
        end
      end

      if row["ManufacurerType"].present?
        row["ManufacurerType"].each do |item|
          man = ManufacturerTaxonomy.find_by(m_id: item["$oid"])
          Manufacturer.find_or_create_by(
            company: company,
            manufacturer_taxonomy: man
          )
        end
      end

      if row["Machines"].present?
        row["Machines"].each do |item|
          mac = MachinesTaxonomy.find_by(m_id: item["$oid"])
          Machine.find_or_create_by(
            company: company,
            machines_taxonomy: mac
          )
        end
      end

    end

    puts "Creating Media..."
    File.open("csv/media.json").each do |r|
      row = JSON.parse(r)

      next unless row["company"]

      the_company = Company.find_by(m_id: row["company"]["$oid"])
      if the_company.nil?
        puts "-- Cannot find Organization for: #{row}"
        next
      end

      Medium.find_or_create_by(
        m_id: row['_id']['$oid'],
        company: the_company,
        thumbnail_url: row['thumbnail_url'],
        web_url: row['web_url'],
        hi_res: row['hi_res']
      )
    end

    puts "Creating Blog Categories..."
    File.open("csv/category.json").each do |r|
      row = JSON.parse(r)
      BlogCategory.find_or_create_by(
        m_id: row['_id']['$oid'],
        name: row['name']
      )
    end

    puts "Creating Blog..."
    File.open("csv/post.json").each do |r|
      row = JSON.parse(r)
      the_medium = nil
      if row['header_ref'] and row['header_ref']['$oid']
        the_medium = Medium.find_by(m_id: row['header_ref']['$oid'])
      end

      the_date = nil
      if row['date'] and row['date']["$date"]
        the_date = row['date']["$date"]
      end

      the_author = nil
      if row['words_by_author'] && row['words_by_author']['$oid']
        the_author = row['words_by_author']['$oid']
      end

      b = Blog.create_with(
        blurb: row['blurb'],
        content: row['content'],
        content_action: simple_format(row['content']),
        dont_publish: row['dont_publish'],
        featured_video: row['featured_video'],
        header_image: row['header_image'],
        medium: the_medium,
        slug: row['slug'],
        sub_title: row['sub_title'],
        title: row['title'],
        created_at: the_date,
        words_by_author: the_author
      ).find_or_create_by(
        m_id: row['_id']['$oid']
      )

      b.save!
      # Tries to create a blog_tag. Does not fail if blog_category is nil
      b.blog_tags.create(
        blog_category: BlogCategory.find_by(m_id: row['category']["$oid"])
      )
    end

    puts "Creating Region About..."
    File.open("csv/region_about_page.json").each do |r|
      row = JSON.parse(r)

      region = Region.find_by(m_id: row['org']['$oid'])
      next if region.blank?

      region.update(
        #about_header: row["about_header"],
        about_text: row["about_text"]
        #team_members: << # user
        #projects:
      )
    end

  end
end
