class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user
      t.string :name
      t.string :company_intro
      t.string :year_est
      t.string :website
      t.string :address
      t.string :city
      t.string :zip_code
      t.string :country
      t.string :state
      t.string :main_products
      t.string :additional_products
      t.string :num_employees
      t.string :registered_location
      t.string :other_comments
      t.string :organic_co
      t.string :annual_revenue
      t.string :export_percentage
      t.string :region_export_percentage
      t.string :export_year
      t.string :nearest_port
      t.string :average_lead_time
      t.string :comp_pict

      t.timestamps
    end
  end
end
