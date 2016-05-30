class Account < ActiveRecord::Base
  devise :database_authenticatable
  devise :registerable
  devise :rememberable
  devise :validatable
  devise :confirmable

  def name
    email.split("@").first
  end
end
