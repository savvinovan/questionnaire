class TestsController < ApplicationController
  before_action :authenticate_user!, only: [:take, :results, :intro]

  def index
  end

  def export_excel
    @results = Result.all
    @questions = Question.order('name ASC')
    @departments = Department.order('name ASC')
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def take
    @question = current_user.departments.first.questions.paginate(:page => params[:page], :per_page => 1)
    #POST
    if params.include?(:result)
      res = result_params.merge("department_id" => current_user.departments.first.id, "user_id" => current_user.id )
      if res['id'].to_i > 0
        r = Result.find(res['id'])
        if r.update(res)
        else
          flash[:error] = 'Нужно заполнить комментарий'
          redirect_to tests_take_path + '?page=' + (@question.current_page - 1).to_s
          return
        end
      else
        r = Result.new(res)
        if r.save
        else
          flash[:error] = 'Нужно заполнить комментарий'
          redirect_to tests_take_path + '?page=' + (@question.current_page - 1).to_s
          return
        end
      end
    else

    end
    #GET


    #last page
    if (@question.first == nil)
      flash[:notice] = 'Тест завершен'
      redirect_to tests_intro_path
    else

    if (@question.current_page > @question.total_pages)
      render template: 'common/success.html.erb'
    else
      @other_results = Result.where(question_id: @question.first.id)
      @deps = Department.all
      @result = Result.where(question_id: @question.first.id, user_id: current_user.id).last
      @result ||= Result.new
    end


    end
  end

  def intro
    @user_info = current_user.user_info
    @user_info ||= UserInfo.new
  end

  def results
  end

  private
  def result_params
    params.require(:result).permit(:text, :question_id, :id, :attachment)
  end
end
