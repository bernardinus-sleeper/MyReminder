class TasksController < ApplicationController

  before_filter :authorize


  def index
    if session[:welcomedialog]!= false
       session[:welcomedialog]= true
    end
    @user=User.find(session[:user_id])
    @departemen=@user.department

    if params[:search]
      @tasks = Task.search(params[:search],@departemen)
    else
      @tasks = Task.all(:conditions=>{:department=>@departemen},:order=>'status asc, tgl_task desc')
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def logout
    @user=User.find(session[:user_id])
    @user.update_attribute(:updated_at,Time.now.strftime('%Y-%m-%d %H:%M:%S'))
    session[:welcomedialog]= true
    flash[:notice] = "Anda sudah logout"
    redirect_to(:controller => :home, :action => :index)
  end  

  
  # GET /tasks/1
  # GET /tasks/1.json
  def show

    @json = Task.find(params[:id]).to_gmaps4rails
    @task = Task.find(params[:id]) 
    if(params[:section])
      @section=params[:section]
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @setStatus=[['Belum Selesai']]
    @statusValue="Belum Selesai"
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  
  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    @setStatus=[['Belum Selesai'],['Selesai']]
    @statusValue=@task.status
    @task.update_attribute(:gmaps,0)
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @setStatus=[['Belum Selesai']]
    @statusValue=@task.status
    @user=User.find(session[:user_id])
    @task.department= @user.department
    @task.email_user = @user.email
    @task.id_user=@user.id
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def belum_task
  @task = Task.find(params[:id])
  @task.update_attribute(:status,'Belum Selesai')
  redirect_to :action=>:index
  end
  
  
  def selesai_task
  @task = Task.find(params[:id])
  @task.update_attribute(:status,'Selesai')
  redirect_to :action=>:index
  end
  
  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
end
