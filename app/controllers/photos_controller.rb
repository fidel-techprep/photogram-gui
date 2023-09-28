class PhotosController < ApplicationController

  def index

    matching_records = Photo.all
    pp matching_records

    @list_of_photos = matching_records.order({ :created_at => :desc })

    render({ :template => "photo_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => the_id })

    @the_photo = matching_photos.at(0)

    if @the_photo == nil
      redirect_to("/404")
    else
      render({ :template => "photo_templates/show" })
    end
  end

  def create 

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")

    p = Photo.new

    p.image = input_image
    p.caption = input_caption
    p.owner_id = input_owner_id
    
    p.save

    redirect_to("/photos/#{p.id}")

  end

  def destroy
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")
  end

end
