class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about contact privacy]

  def about
    render template: 'pages/about'
  end

  def privacy
    render template: 'pages/privacy'
  end

  def contact
    render template: 'pages/contact'
  end
end
