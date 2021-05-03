class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    # get all properties with images 
    @properties = Property.all.with_attached_images
    # add image urls for each property
    # attributes.symbolize_keys finds all the symbols in eaech property, .merge adds a new symbol
    @properties = @properties.map { |i| i.attributes.symbolize_keys.merge({ images: i.images.map{|img| url_for(img)} }) }
  end

  def show
  end
end
