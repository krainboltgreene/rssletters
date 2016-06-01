class Address < ActiveRecord::Base
  belongs_to :account
  belongs_to :provider
  has_many :newsletters

  validates :account, presence: true
  validates :provider, presence: true
  validates :state, presence: true

  state_machine :state, initial: :fresh do
    after_transition :confirmed do |model|
      model.confirmed_at = Time.now
    end

    event :confirm do
      transition :fresh => :confirmed
    end
  end

  def to_email
    "#{id}@#{ENV["RAILS_HOST"]}"
  end
end
