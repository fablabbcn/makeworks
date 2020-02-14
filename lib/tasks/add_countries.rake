namespace :makeworks do
  desc "Add from CSV"

  task add_country: [:environment] do
    require 'csv'

    csv = CSV.read("csv/organisation.csv", headers: true, col_sep: ",")

    csv.each_with_index do |row, index|
      p index
      p '------'
      p row
      Country.create!(
        m_id: row['_id'],
        name: row['organisation_name'],
        can_signup: row['can_signup']
      )
    end
  end
end
