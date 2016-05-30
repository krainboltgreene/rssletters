class Account < ActiveRecord::Base
  devise :database_authenticatable
  devise :registerable
  devise :rememberable
  devise :validatable
  devise :confirmable

  has_many :addresses
  has_many :newsletters
  has_many :links

  def name
    email.split("@").first
  end
end
