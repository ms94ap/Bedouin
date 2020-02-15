class Company < ApplicationRecord
  belongs_to :user, optional: true
  validates_presence_of :name

  # has_many :business_types
  # has_many :export_markets
  # has_many :delivery_terms
  # has_many :payment_currencies
  # has_many :payment_types
  # has_many :languages
  # has_many :certifications
  # validates :year_est, numericality: { only_integer: true }, length: { minimum:4, maximum:4 }

  # has_attached_file :logo, size: { in: 0..100.kilobytes }
  # validates_attachment_content_type :logo, content_type: ['image/jpg', 'image/jpeg', 'image/png']
  
  # has_attached_file :comp_pict, size: { in: 0..100.kilobytes }
  # validates_attachment_content_type :logo, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  # accepts_nested_attributes_for :business_types, :export_markets,
  # :delivery_terms, :payment_currencies, :payment_types, :languages, :certifications

end
