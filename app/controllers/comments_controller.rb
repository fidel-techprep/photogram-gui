class CommentsController < ApplicationController
  def create
    c = Comment.new

    input_comment = params.fetch("query_comment")
    input_author_id = params.fetch("query_author_id")
    input_photo_id = params.fetch("query_photo_id")
    
    c.body = input_comment
    c.author_id = input_author_id
    c.photo_id = input_photo_id

    c.save

    redirect_to("/photos/#{ c.photo_id }")
  end
end
