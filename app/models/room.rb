class Room < ApplicationRecord
 has_many :room_users, dependent: :destroy
 has_many :users, through: :room_users
 has_many :messages, dependent: :destroy #dependentオプション
 validates :name, presence: true
 
end
