class Newsletter < ActiveRecord::Base
  belongs_to :account
  belongs_to :provider
  belongs_to :address
  has_many :links

  scope :by, ->(provider_id) { where(provider_id: provider_id) }

  after_commit :linkify, on: :create

  state_machine :state, initial: :fresh do
    after_transition any => :parsed do |model|
      model.parsed_at = Time.now
    end

    after_transition any => :read do |model|
      model.read_at = Time.now
    end

    event :parse do
      transition :fresh => :parsed
    end

    event :read do
      transition :parsed => :read
    end
  end

  private

  def linkify
    EmailParseWorker.enqueue(id: id)
  end
end
