class Newsletter < ActiveRecord::Base
  belongs_to :account
  belongs_to :provider
  belongs_to :address
  has_many :links
end
