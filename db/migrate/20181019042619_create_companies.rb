class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.integer :user_id
      t.text :text
      t.integer :stock_code
      t.string :company_name

      t.timestamps
    end
  end
end
