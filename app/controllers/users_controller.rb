class UsersController < ApplicationController
  before_action :set_login_user, only: [:index, :show, :mypage]
  
  def callback
    user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    
    if request.env["omniauth.params"]["from"]
      from_url = request.env["omniauth.params"]["from"]
    else
      from_url = "/users/show?id=" + user.id
    end
    
    redirect_to from_url
  end
  
  def index
    if session[:user_id]
      @user = User.find_by_id(session[:user_id])
    end
    @users = User.all
  end
  
  def create
    redirect_to "/auth/twitter?from=" + request.referer and return
  end
  
  def show
    if session[:user_id].to_i == params[:id].to_i
      redirect_to :action => "mypage"
    end
    @user = User.find_by_id(params[:id])
  end
  
  def mypage
    @user = User.find_by_id(session[:user_id])
  end
  
  def update_favorite
    user = User.find_by_id(params[:id])
    user.activity_logs.build.save_activity_log(user.favorite + " から " + params[:favorite] + " に推し変しましたｗ")
    user.favorite = params[:favorite]
    user.save
    
    redirect_to :action => "mypage"
  end
  
  def get_prof_image
    prof_image = User.find_by_id(params[:id]).prof_image
    send_data(prof_image, :disposition => "inline", :type => "image/jpg")
  end
  
  def save_evaluation
    case params[:evaluation]
    when Evaluation::BAD_EVALUATION.to_s then
      Evaluation.save_bad_evaluation(params[:id], session[:user_id])
    when Evaluation::GOOD_EVALUATION.to_s then
      Evaluation.save_good_evaluation(params[:id], session[:user_id])
    end
    
    redirect_to :action => "index"
  end
  
private
  def set_login_user
    if session[:user_id]
      @login_user = User.find_by_id(session[:user_id])
    end
  end
end