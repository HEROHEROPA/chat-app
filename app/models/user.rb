class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable    
   
   validates :name, presence: true #データベースだけでなくモデル側にも制限を儲ける？
   has_many :room_users
   has_many :rooms, through: :room_users
   has_many :messages
end


