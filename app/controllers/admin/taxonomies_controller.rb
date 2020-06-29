class Admin::TaxonomiesController < ApplicationController
  before_action :check_admin

  def index
   @taxonomies = Taxonomy.friendly.all
  end

  def show
    @taxonomy = Taxonomy.friendly.find(params[:id])
  end

  def new
   @taxonomy = Taxonomy.new
  end

  def create
    
   @taxonomy = Taxonomy.create(taxonomy_params)
   if @taxonomy.save
    redirect_to admin_taxonomies_path(@taxonomy)
   end
  end

  def edit
    @taxonomy = Taxonomy.friendly.find(params[:id])
    if @taxonomy.update(taxonomy_params)
      redirect_to admin_taxonomy_path(@taxonomy), notice: "#{@taxonomy.name} taxonomy updated."
    else
      render :edit
    end
  end

  def update
    if taxonomy.update(taxonomy_params)
      respond_with(taxonomy, status: 200, default_template: :show)
    else
      invalid_resource!(taxonomy)
    end
  end

  def destroy
    @taxonomy = Taxonomy.friendly.find(params[:id])
    @taxonomy.destroy
    redirect_to admin_taxonomies_path
  end

  private

  def check_admin
   if !current_user.admin
     redirect_to root, alert: "Admin rights required!!!"
   end
  end

  def taxonomy_params
    params.require(:taxonomy).permit(:name, :position)
  end
end