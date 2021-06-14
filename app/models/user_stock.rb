class UserStock < ApplicationRecord
  belongs_to :user
  belongs_to :stock

  validates :stock_id, uniqueness: { scope: :user_id,
    message: "This stock is already tracked" }

end
