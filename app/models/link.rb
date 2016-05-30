class Link < ActiveRecord::Base
  belongs_to :account
  belongs_to :newsletter
  belongs_to :provider
end
