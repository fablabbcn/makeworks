class CreateCompanyProcesses < ActiveRecord::Migration[6.0]
  def change
    create_table :company_processes do |t|
      t.references :company, null: false, foreign_key: true
      t.references :process_taxonomy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
