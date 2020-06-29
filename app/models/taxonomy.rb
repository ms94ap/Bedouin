class Taxonomy < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  has_many :taxons, inverse_of: :taxonomy

  after_create :set_root
  after_save :set_root_taxon_name

  private

  def set_root
    self.root ||= Taxon.create!(taxonomy_id: id, name: name)
  end

  def set_root_taxon_name
    root.update(name: name)
  end
end
