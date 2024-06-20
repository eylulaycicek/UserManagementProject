class UsersController < ApplicationController
  def index
    if params[:search]
      @users = User.where('username LIKE ?', "%#{params[:search]}%")
      if @users.empty?
        flash.now[:alert] = "Kullanıcı Bulunamadı!"
      end
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    @photo = @user.user_photo
    @albums = fetch_albums(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: 'Kullanıcı başarıyla güncellendi.'
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
    uri = URI(url)
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
