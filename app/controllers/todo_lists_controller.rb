class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[ show edit update destroy ]

  def index
    @todo_lists = current_user.todo_lists.all
  end

  def show
    @todo_item = @todo_list.todo_items.build
    @todo_items = @todo_list.todo_items.order(created_at: :asc)
  end

  def new
    @todo_list = current_user.todo_lists.new
  end

  def edit
  end

  def create
    @todo_list = current_user.todo_lists.build(todo_list_params)
    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: "item criado com sucesso" }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: "item atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_list.destroy!
    respond_to do |format|
      format.html { redirect_to todo_lists_path, status: :see_other, notice: "item deletado com sucesso" }
      format.json { head :no_content }
    end
  end

  private

    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:id])
    end

    def todo_list_params
      params.require(:todo_list).permit(:name)
    end
end