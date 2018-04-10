class FavoritesController < ApplicationController
  before_action :current_user_must_be_favorite_users, :only => [:edit, :update, :destroy]

  def current_user_must_be_favorite_users
    favorite = Favorite.find(params[:id])

    unless current_user == favorite.users
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @favorites = Favorite.all

    render("favorites/index.html.erb")
  end

  def show
    @favorite = Favorite.find(params[:id])

    render("favorites/show.html.erb")
  end

  def new
    @favorite = Favorite.new

    render("favorites/new.html.erb")
  end

  def create
    @favorite = Favorite.new

    @favorite.rank = params[:rank]
    @favorite.movie_id = params[:movie_id]
    @favorite.users_id = params[:users_id]

    save_status = @favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorites/new", "/create_favorite"
        redirect_to("/favorites")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite created successfully.")
      end
    else
      render("favorites/new.html.erb")
    end
  end

  def edit
    @favorite = Favorite.find(params[:id])

    render("favorites/edit.html.erb")
  end

  def update
    @favorite = Favorite.find(params[:id])

    @favorite.rank = params[:rank]
    @favorite.movie_id = params[:movie_id]
    @favorite.users_id = params[:users_id]

    save_status = @favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/favorites/#{@favorite.id}/edit", "/update_favorite"
        redirect_to("/favorites/#{@favorite.id}", :notice => "Favorite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Favorite updated successfully.")
      end
    else
      render("favorites/edit.html.erb")
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy

    if URI(request.referer).path == "/favorites/#{@favorite.id}"
      redirect_to("/", :notice => "Favorite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Favorite deleted.")
    end
  end
end
