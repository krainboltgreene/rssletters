class Link < ActiveRecord::Base
  belongs_to :account
  belongs_to :newsletter
  belongs_to :provider

  validates :account, presence: true
  validates :newsletter, presence: true
  validates :provider, presence: true
end
