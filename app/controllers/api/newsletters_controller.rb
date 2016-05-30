module Api
  class NewslettersController < ApplicationController
    def create
      @newsletter = Newsletter.new
    end
  end
end
