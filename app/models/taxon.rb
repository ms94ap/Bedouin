class Taxon < ApplicationRecord
  extend FriendlyId
  friendly_id :permalink, slug_column: :permalink, use: :history
  # before_validation :set_permalink, on: :create, if: :name

  belongs_to :taxonomy, class_name: 'Taxonomy', inverse_of: :taxons
  validates :name, presence: true, uniqueness: { scope: [:parent_id, :taxonomy_id], allow_blank: true, case_sensitive: false }
  validates :permalink, uniqueness: { case_sensitive: false }

  validate :check_for_root, on: :create

  # after_save :touch_ancestors_and_taxonomy
  # after_touch :touch_ancestors_and_taxonomy

  # def set_permalink
  #   if parent.present?
  #     self.permalink = [parent.permalink, (permalink.blank? ? name.to_url : permalink.split('/').last)].join('/')
  #   else
  #     self.permalink = name.to_url if permalink.blank?
  #   end
  # end

  def child_index=(idx)
    move_to_child_with_index(parent, idx.to_i) unless new_record?
  end

  private

  # def touch_ancestors_and_taxonomy
  #   # Touches all ancestors at once to avoid recursive taxonomy touch, and reduce queries.
  #   ancestors.update_all(updated_at: Time.current)
  #   # Have taxonomy touch happen in #touch_ancestors_and_taxonomy rather than association option in order for imports to override.
  #   taxonomy.try!(:touch)
  # end  

  
  def check_for_root
    if taxonomy.try(:root).present? && parent_id.nil?
      errors.add(:root_conflict, 'this taxonomy already has a root taxon')
    end
  end
end
