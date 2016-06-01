class Newsletter < ActiveRecord::Base
  belongs_to :account
  belongs_to :provider
  belongs_to :address
  has_many :links

  scope :by, ->(provider_id) { where(provider_id: provider_id) }

  before_create :normalize
  after_commit :linkify, on: :create

  store_accessor :metadata, :title

  validates :account, presence: true
  validates :provider, presence: true
  validates :address, presence: true
  validates :headers, presence: true
  validates :raw, presence: true

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

  private def linkify
    EmailParseWorker.enqueue(id: id)
  end

  private def normalize
    assign_attributes({
      headers: raw["Headers"].reduce({}) do |state, pair|
        state.merge(pair["Name"] => pair["Value"])
      end,
      body: raw["HtmlBody"],
      metadata: {
        tite: raw["Subject"]
      }
    })
  end
end
