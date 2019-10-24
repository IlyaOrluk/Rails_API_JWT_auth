class TodosController < ApplicationController
    before_action :authenticate_user!
  
    # GET /todos
    def index
      @todos = Todo.all
      render json: @todos, status: :ok
    end
  
    # POST /todos
    def create
      @todo = Todo.create(todo_params)
      if @todo.errors.empty?
        render json: @todo, status: :created
      else
        render json: @todo.errors
      end
    end
  
    # GET /todos/:id
    def show
      render json: @todo
    end
  
    # PUT /todos/:id
    def update
      @todo.update(todo_params)
      head :no_content
    end
  
    # DELETE /todos/:id
    def destroy
      @todo.destroy
      head :no_content
    end
  
    private
  
    def todo_params
      # whitelist params
      params.permit(:title, :created_by)
    end
  
    def set_todo
      @todo = Todo.find(params[:id])
    end
  end