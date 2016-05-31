module Api
  class NewslettersController < ApplicationController
    def create
      @former = NewsletterFormer.new(params)

      if @former.save
        head :ok
      else
        head :unprocessable_entity
      end
    end
  end
end
