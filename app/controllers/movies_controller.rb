class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :login_ck, only: [:new, :edit, :show, :destroy]
  
  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    #@movie = Movie.find(params[:id])
    @favorite = current_user.favorites.find_by(movie_id: @movie.id)
  end

  # GET /movies/new
  def new
    if params[:back]
      @movie = Movie.new(Movie_params)
    else
      @movie = Movie.new
    end
  end

  # GET /movies/1/edit
  def edit
    @movie = Movie.find(params[:id])
    if @movie.user_id != @current_user.id
      flash[:notice] = "編集するが権限がありません"
      redirect_to movies_path
    end
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    if @movie.save
      #ContactMailer.contact_mail(@movie).deliver
      redirect_to movies_path, notice: "完了！！！！！！！"
    else
      render :'new'
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    @movie = Movie.find(params[:id])
      if @movie.update(movie_params)
        #redirect_to @movie, notice: 'Movie was successfully updated.'
        redirect_to movies_path, notice: "編集しました！"
      else
        render :'edit'
      end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :video, :video, :video_cache)
    end

  #ログインチェック
  def login_ck
    unless current_user
      flash[:notice] = '失敗しました'
      render new_session_path
    end
  end
end
