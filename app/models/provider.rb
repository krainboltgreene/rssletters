class Provider < ActiveRecord::Base
  has_many :addresses
  has_many :newsletters
  has_many :links

  validates :name, presence: true
end
