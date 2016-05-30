class NewsletterPresenter
  def initialize(model)
    @record = model
  end

  def id
    @record.id
  end

  def description
    case type
    when "plain" then "<![CDATA[<pre>#{@record.body}</pre>]]>"
    end
  end

  def title
    @record.created_at
  end

  private def type
    RSSLetters::Adapter::ENGINES[@record.provider.name].const_get("TYPE")
  end
end
