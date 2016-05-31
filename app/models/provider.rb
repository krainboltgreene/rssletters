class Provider < ActiveRecord::Base
  has_many :addresses
  has_many :newsletters
  has_many :links

  scope :advanced, -> { where(advanced: true) }
  def self.generic
    find_by(name: "Generic")
  end

  validates :name, presence: true
end
