class Provider < ActiveRecord::Base
  has_many :addresses
  has_many :newsletters
  has_many :links

  scope :advanced, -> { where(advanced: true) }

  validates :name, presence: true, uniqueness: true

  def self.generic
    find_by(name: "Generic")
  end
end
