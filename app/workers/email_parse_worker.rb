class EmailParseWorker < Que::Job
  def run(options)
    newsletter = Newsletter.find_by!(id: options[:id])
    account = newsletter.account
    provider = newsletter.provider
    adapter = RSSLetters::Adapter.new(provider)

    link_attributes = adapter.read(newsletter).map do |attributes|
      attributes.merge(account: provider)
    end

    ActiveRecord::Base.transaction do
      links = Link.create!(link_attributes)
      newsletter.parse!
      newsletter.save!
      destroy
    end
  end
end
