require "date"

class TasksController < ApplicationController
  def index
    @tasks = Task.all
    d = Date.today
    @date= d.strftime("%Y年%m月%d日")
    @count = Task.count
  end
  
  def new
    @task = Task.new
    d = Date.today
    @date= d.strftime("%Y年%m月%d日")
  end

  def create
    @task = Task.new(params.require(:task).permit(:title, :start_date, :complete_date, :all_day, :content))
    if @task.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールが登録できませんでした"
      render "new"
    end
  end

  def show
    @task = Task.find(params[:id])
    d = Date.today
    @date= d.strftime("%Y年%m月%d日")
  end

  def edit
    @task = Task.find(params[:id])
    d = Date.today
    @date= d.strftime("%Y年%m月%d日")
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(params.require(:task).permit(:title, :start_date, :complete_date, :all_day, :content))
      flash[:notice] = "IDが「#{@task.id}」のスケジュールを更新しました"
      redirect_to :tasks
    else
      flash[:notice] = "スケジュールが更新できませんでした"
      render "edit"
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :tasks 
  end
  
end
