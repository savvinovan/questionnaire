class UserInfosController < ApplicationController
  def create
    if UserInfo.create(user_info_params)
      flash[:notice] = 'Сохранено'
      redirect_to(tests_take_path)
    else
      flash[:notice] = 'Ошибка'
      redirect_to(tests_intro_path)
    end
  end

  private
  def user_info_params
    params.require(:user_info).permit(:name, :department, :user_id, :contact, :user)
  end
end
