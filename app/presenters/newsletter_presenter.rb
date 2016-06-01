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
    when "html" then "<![CDATA[#{@record.body}]]>"
    else @record.body
    end
  end

  def title
    @record.title || @record.created_at
  end

  private def type
    RSSLetters::Adapter::ENGINES[@record.provider.name].const_get("TYPE") || bestguess
  end

  private def bestguess
    case
    when @record.body.include?("</a>") then "html"
    end
  end
end
