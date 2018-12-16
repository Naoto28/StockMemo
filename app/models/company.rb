class Company < ApplicationRecord
  belongs_to :user, optional: true
  validates :stock_code, length: { is: 4 }
  validates :text, length: { maximum: 140 }
  validates :company_name, presence: true

end
