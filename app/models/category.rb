class Category < ApplicationRecord
  belongs_to :user, foreign_key: "user_id"
end
