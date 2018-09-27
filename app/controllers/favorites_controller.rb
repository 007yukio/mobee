class FavoritesController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @favorite_movies = @user.favorite_movies
    #@favorite = current_user.favorites.find_by(movie_id: @movie.id)
  end
  
  def create
    favorite = current_user.favorites.create(movie_id: params[:movie_id])
    redirect_to movies_url, notice: "#{favorite.movie.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to movies_url, notice: "#{favorite.movie.user.name}さんのブログをお気に入り解除しました"
  end
  
  def show
  end
end
