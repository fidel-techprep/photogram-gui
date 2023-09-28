class UsersController < ApplicationController

  def index

    matching_users = User.all.order({ :username => :asc })
    
    @list_of_users = matching_users

    render({ :template => "user_templates/index" })
  end

  def show
    the_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => the_username })

    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404")
    else
      render({ :template => "user_templates/show" })
    end

  end

end
