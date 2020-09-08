class TasksController < ApplicationController
  before_action :get_garden, only: [:new, :create]


  def new
    @task = @garden.tasks.build
  end

  def create
    @task = @garden.tasks.build(task_params)
    @task.id = params[:id]
      if @task.save
        redirect_to garden_path(@garden)
      else
        render :new
      end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to garden_path(@task.garden)
  end

  private

  def get_garden
    @garden = Garden.find(params[:garden_id])
  end

  def task_params
    params.require(:task).permit(:title)
  end
end
