class Expense < ApplicationRecord
  belongs_to :category
  belongs_to :user, foreign_key: "user_id"
end
