class PagesController < ApplicationController
  def show
    if File.exists?(Rails.root.join('app', 'views', 'pages', "#{params[:id]}.html.erb"))
      case params[:id]
      when "landing"
        @providers = Provider.advanced
      end
      render params[:id]
    else
      redirect_to "/404.html"
    end
  end
end
