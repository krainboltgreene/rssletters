class Provider < ActiveRecord::Base
  has_many :addresses
  has_many :newsletters
  has_many :links

  scope :advanced, -> { where(advanced: true) }

  validates :name, presence: true
end
