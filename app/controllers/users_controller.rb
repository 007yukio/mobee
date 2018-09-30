class UsersController < ApplicationController
  
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    if @user.id != current_user.id
    
      flash[:notice] = "編集するが権限がありません"
      #redirect_to favorites_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #login画面に遷移
      redirect_to new_session_path(@user.id)
    else
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :icon)
    end
end
