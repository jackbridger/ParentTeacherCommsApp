class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new :teacher_id => params[:teacher_id]
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)


      if @task.save
        redirect_to(teacher_index_path, :notice => "Task was successfully created.")
      else
        redirect_to(teacher_index_path, :notice => "Task was not successfully created.")
      end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      if @task.update(task_params)
        redirect_to(teacher_index_path, :notice => "Task was successfully created.")
      else
        redirect_to(teacher_index_path, :notice => "Task was not successfully created.")
      end

  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    if @task.destroy
        redirect_to(teacher_index_path, :notice => "Task was successfully deleted.")
    else
        redirect_to(teacher_index_path, :notice => "Task was successfully deleted.")

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:subject, :task, :teacher_id, :due_date, :description)
    end
end
