class Admin::TaxonsController < ApplicationController
  before_action :load_taxonomy, only: [:create, :edit, :update]
  before_action :load_taxon, only: [:edit, :update]
  before_action :set_permalink_part, only: [:edit, :update]

  
  def index; end

  def new

  end
  def create
    @taxon = @taxonomy.taxons.build(params[:taxon].except(:icon))
    @taxon.build_icon(attachment: taxon_params[:icon])
    if @taxon.save
      respond_with(@taxon) do |format|
        format.json { render json: @taxon.to_json }
      end
    else
      # flash[:error] = Spree.t('errors.messages.could_not_create_taxon')
      respond_with(@taxon) do |format|
        format.html { redirect_to @taxonomy ? edit_admin_taxonomy_url(@taxonomy) : admin_taxonomies_url }
      end
    end
  end

  def edit; end

  private

  def taxon_params
    params.require(:taxonomy).permit(:id, :name, :pretty_name, :slug, :permalink, :parent_id,
      :taxonomy_id, :meta_title, :meta_description)
  end

  def set_permalink_part
    @permalink_part = @taxon.permalink.split('/').last
  end

  def load_taxon
    @taxon = @taxonomy.taxons.find(params[:id])
  end

  def load_taxonomy
    @taxonomy = Taxonomy.find(params[:taxonomy_id])
  end

  def set_position
    new_position = params[:taxon][:position]
    @taxon.child_index = new_position.to_i if new_position
  end

  def set_parent(parent_id)
    @taxon.parent = Taxon.find(parent_id.to_i) if parent_id
  end

end