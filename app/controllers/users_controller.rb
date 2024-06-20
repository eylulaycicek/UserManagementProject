class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where('username LIKE ?', "%#{params[:search]}%")
      flash.now[:alert] = "Kullanıcı Bulunamadı!" if @users.empty?
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @albums = fetch_albums(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :phone, :website)
  end

  def fetch_albums(user_id)
    url = "https://jsonplaceholder.typicode.com/albums?userId=#{user_id}"
    response = Net::HTTP.get(URI(url))
    JSON.parse(response)
  end
end
