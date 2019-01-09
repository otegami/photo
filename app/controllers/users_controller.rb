class UsersController < ApplicationController
  before_action :authorize, except: [:sign_up, :sign_up_process, :sign_in, :sign_in_process]
  before_action :redirect_to_top_if_signed_in, only: [:sign_up, :sign_in]
  
  def sign_out
    user_sign_out
    redirect_to sign_in_path and return
  end  
  def top
  end
  def show
  end
  def edit
  end
  def follower_list
  end
  def sign_up
    @user = User.new
    render layout: "application_not_login"
  end
  def sign_up_process
    user = User.new(user_params)
    if user.save
      user_sign_in(user)
      redirect_to top_path and return
    else
      flash[:dager] = "ユーザー登録に失敗しました。"
      redirect_to ('/sign_up') 
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  def sign_in
    @user = User.new('hoge')
    render layout: "application_not_login"
  end
  def sign_in_process
      #　ここに処理を実装
      password_md5 = User.generate_password(user_params[:password])
      user = User.find_by(email: user_params[:email], password: password_md5)
      if user
         user_sign_in(user)
         redirect_to top_path and return
      else
        flash[:danger] = "サインインに失敗しました。"
        redirect_to('/sign_in')
      end  
  end
end
