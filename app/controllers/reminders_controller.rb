class RemindersController < ApplicationController
  before_filter :authorize

   def create
    @task = Task.find(params[:task_id])
    @reminder = @task.reminder.create(params[:reminder])
    redirect_to task_path(@task)
  end
   def destroy
    @task = Task.find(params[:task_id])
    @reminder = @task.reminder.find(params[:id])
    @reminder.destroy
    redirect_to task_path(@task)
  end
end
