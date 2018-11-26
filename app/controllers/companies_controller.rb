class CompaniesController < ApplicationController
  before_action :authenticate_user!
  # before_action :ensure_correct_user

  def index
    @company = Company.where(user_id: current_user.id).order(created_at: :desc)

    # ランキング
    ary = Company.pluck(:stock_code)
    @rank_first = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).first
    @rank_second = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).second
    @rank_third = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).third

    @first_name = Company.where(stock_code: @rank_first).first
    @second_name = Company.where(stock_code: @rank_second).first
    @third_name = Company.where(stock_code: @rank_third).first

  end

  def show
    @company = Company.find(params[:id])

    # ランキング
    ary = Company.pluck(:stock_code)
    @rank_first = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).first
    @rank_second = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).second
    @rank_third = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).third

    @first_name = Company.where(stock_code: @rank_first).first
    @second_name = Company.where(stock_code: @rank_second).first
    @third_name = Company.where(stock_code: @rank_third).first

  end

  def edit
    @company = Company.find(params[:id])

    # ランキング
    ary = Company.pluck(:stock_code)
    @rank_first = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).first
    @rank_second = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).second
    @rank_third = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).third

    @first_name = Company.where(stock_code: @rank_first).first
    @second_name = Company.where(stock_code: @rank_second).first
    @third_name = Company.where(stock_code: @rank_third).first

  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path(company.id)
  end

  def new
    @company = Company.new

    # ランキング
    ary = Company.pluck(:stock_code)
    @rank_first = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).first
    @rank_second = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).second
    @rank_third = ary.group_by { |e| e }.sort_by { |e, v| -v.size }.map(&:first).third

    @first_name = Company.where(stock_code: @rank_first).first
    @second_name = Company.where(stock_code: @rank_second).first
    @third_name = Company.where(stock_code: @rank_third).first

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
