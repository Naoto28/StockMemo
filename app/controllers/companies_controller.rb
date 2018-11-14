class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def index
    @company = Company.where(user_id: current_user.id).order(created_at: :desc)
  end

  def show
    @company = Company.find(params[:id])
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path(company.id)
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    @company.user_id = current_user.id
    @company.save
    redirect_to companies_path(current_user) #後で見る
  end

  def destroy
    company = Company.find(params[:id])
    company.destroy
    redirect_to companies_path(current_user)
  end




  private

  def company_params
    params.require(:company).permit(:user_id, :company_name, :stock_code, :text)
  end

end
