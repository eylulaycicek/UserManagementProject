class UsersController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    if params[:search]
      @users = User.where('username LIKE ?', "%#{params[:search]}%")
      flash.now[:alert] = "Kullanıcı Bulunamadı!" if @users.empty?
    else
      @users = User.all
    end
  end
  
  def edit
    @user = User.find(params[:id])
    @albums = @user.albums.includes(:photos)
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: [
            turbo_stream.replace(dom_id(@user), partial: 'user', locals: { user: @user }),
            turbo_stream.replace("flash", partial: 'layouts/flash', locals: { notice: 'User was successfully updated.' })
          ]
        end
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace(dom_id(@user, :edit), partial: 'form', locals: { user: @user }) }
        format.html { render :edit }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :phone, :website)
  end
end
