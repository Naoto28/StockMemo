class Company < ApplicationRecord
  belongs_to :user, optional: true
  validates :stock_code, length: { is: 4 }
  validates :text, length: { maximum: 140 }
  validates :company_name, presence: true

  def getRankings(limit)
    group_stock_code = Company.group(:stock_code).order('count() desc').limit(limit)
    return group_stock_code
  end
end
