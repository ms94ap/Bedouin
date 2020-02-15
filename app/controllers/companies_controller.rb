class CompaniesController < ApplicationController

  def index
    if params[:user_id]
      @companies = User.find(params[:user_id]).companies
    else
      @companies = Company.all
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def new
    if params[:user_id] && !User.exists?(params[:user_id])
      redirect_to new_user_path, alert: "user not found."
    else
      @company = Company.new(user_id: params[:user_id])
      # @company.export_markets.build
      # @company.delivery_terms.build
      # @company.payment_types.build
      # @company.payment_currencies.build
      # @company.languages.build
      # @company.business_types.build
      # @company.certifications.build
    end
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to edit_user_company_path(@company.user, @company)
    else
      render 'companies/new', alert: 'Please fill in all fields'
    end
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to edit_user_company_path(@company)
  end

  def edit
    # if params[:user_id]
    #   user = User.find_by(id: params[:user_id])
    #   if user.nil?
    #     redirect_to users_path, alert: "Account not Found"
    #   else
    # #     @company = user.companies.(id: params[:id])
    #     redirect_to edit_company_path(user) if @company.nil?
    #   end
    # else
      @company = Company.find(params[:id])
    # end
  end
private

  def company_params
    params.require(:company).permit(:name, :logo, :company_intro, :location,
      :year_est, :website, :address, :city, :zip_code, :state, :country,
      :main_products, :additional_products, :num_employees, :registered_location,
      :other_comments, :annual_revenue, :export_percentage,
      :export_year, :nearest_port, :average_lead_time, :comp_pict, :user_id, 
      # /* business_types_attributes: [:online,
      #   :trading_co, :man_factory, :retailer, :whole_distr, :buying_office,
      #   :individual, :prod_farm, :other, :gov, :hotel, :restaurant, :company_id],
      #   export_markets_attributes: [:company_id, :total_distr,
      #     :north_am, :southeast_as, :mid_east, :central_am, :south_as,
      #     :south_am, :africa, :eastern_as, :northern_euro, :domestic,
      #     :eastern_euro, :oceania, :western_euro, :southern_euro],
      #       delivery_terms_attributes: [:fob, :exw, :fca, :ddp, :daf, :cfr, :fas,
      #       :cpt, :ddu, :des, :cif, :cip, :deq, :express_delivery, :company_id],
      #         payment_types_attributes: [:tt, :money_gram, :western_union, :lc,
      #           :credit_card, :cash, :dp_da, :paypal, :escrow, :company_id],
      #           payment_currencies_attributes: [:usd, :cad, :gbp, :eur, :aud, :cny,
      #           :jpy, :hkd, :chf, :company_id],
      #           languages_attributes: [:eng, :jap, :ara, :kor, :chi, :por, :fre,
      #             :hind, :spa, :ger, :rus, :ita, :company_id],
      #             certifications_attributes: [:name, :year_awarded, :org_name, :org_web, :company_id]
                  )
  end
end