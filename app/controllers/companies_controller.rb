class CompaniesController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user

  def get_Ranking
    company = Company.new
    @rankings = company.getRankings(3)
  end

  def index
    @company = Company.where(user_id: current_user.id).order(created_at: :desc)

    # ランキング
    @get_rankings = get_Ranking
  end

  def show
    @company = Company.find(params[:id])

    # ランキング
    @get_rankings = get_Ranking
  end

  def edit
    @company = Company.find(params[:id])

    # ランキング
    @get_rankings = get_Ranking
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path(company.id)
  end

  def new
    @company = Company.new

    # ランキング
    @get_rankings = get_Ranking
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    @company.save
    redirect_to companies_path
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    redirect_to companies_path
  end

  private

  def company_params
    params.require(:company).permit(:user_id, :company_name, :stock_code, :text)
  end

end
