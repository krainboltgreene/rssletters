class Address < ActiveRecord::Base
  belongs_to :account
  belongs_to :provider
  has_many :newsletters

  validates :name, presence: true
  validates :body, presence: true

  def to_email
    "#{id}@rssletters.com"
  end
end
