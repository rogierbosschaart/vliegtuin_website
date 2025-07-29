class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_one :profile_page, dependent: :destroy
  has_many :news_items, dependent: :delete_all
end
