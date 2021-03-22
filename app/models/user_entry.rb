class UserEntry < ApplicationRecord
    validates :user_number, presence: true, numericality: {only_integer: true}
end