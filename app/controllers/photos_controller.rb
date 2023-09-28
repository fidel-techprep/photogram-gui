class PhotosController < ApplicationController

  def index

    matching_records = Photo.all
    pp matching_records

    @list_of_photos = matching_records.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def show
    render({ :template => "photo_templates/show" })
  end

end
