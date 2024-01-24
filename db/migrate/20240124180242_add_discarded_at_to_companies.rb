class AddDiscardedAtToCompanies < ActiveRecord::Migration[6.1]
  def change
    add_column :companies, :discarded_at, :datetime
    add_index :companies, :discarded_at
  end
end
