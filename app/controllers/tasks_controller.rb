class TasksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
 def index
   
   if logged_in?
    @tasks = current_user.tasks
    #@tasks = Task.all
   end
 end

  def show
  @task = Task.find(params[:id])
  end

  def new
  @task = Task.new
  end

  def create
  
    #@task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:success] = 'Task が正常に投稿されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      flash[:success] = 'Task は正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'task は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url
  end  

  private


  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]

  def create
    @Task = current_user.tasks.build(micropost_params)
    if @Task.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @Task = current_user.microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @Task.destroy.show.edit.update
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end

  private

  def tasks_params
    params.require(:tasks).permit(:content)
  end

  def correct_user
    @Task = current_user.tasks.find_by(id: params[:id])
    unless @micropost
      redirect_to root_url
    end
  def show
    @Task = tasks
  end
   
   def edit
    @Task = tasks
   end
  
  def updaet 
    @Task = tasks
  end

 
 
  
  # Strong Parameter
  def task_params
    params.require(:task).permit(:content,:status)
  end 
  end


