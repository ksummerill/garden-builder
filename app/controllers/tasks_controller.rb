class TasksController < ApplicationController
  before_action :get_garden, only: [:new, :create]


  def new
    @task = @garden.tasks.build
  end

  def create
    # binding.pry
    @task = @garden.tasks.build(task_params)
      if @task.save
         redirect_to garden_path(@garden), notice: 'You successfully created a task!'
      else
        render :new
      end
  end

  def destroy
    # binding.pry
    @task = Task.find(params[:id])
    # raise params
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
