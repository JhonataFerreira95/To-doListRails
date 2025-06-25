class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, only: %i[show edit update destroy]

  # GET /todo_lists/:todo_list_id/todo_items
  def index
    @todo_items = @todo_list.todo_items
  end

  # GET /todo_lists/:todo_list_id/todo_items/:id
  def show
  end

  # GET /todo_lists/:todo_list_id/todo_items/new
  def new
    @todo_item = @todo_list.todo_items.new
  end

  # GET /todo_lists/:todo_list_id/todo_items/:id/edit
  def edit
  end

  # POST /todo_lists/:todo_list_id/todo_items
  def create
    @todo_item = @todo_list.todo_items.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_list_todo_item_path(@todo_list, @todo_item), notice: "Item criado com sucesso" }
        format.json { render :show, status: :created, location: todo_list_todo_item_path(@todo_list, @todo_item) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/:todo_list_id/todo_items/:id
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to todo_list_todo_item_path(@todo_list, @todo_item), notice: "Item atualizado com sucesso" }
        format.json { render :show, status: :ok, location: todo_list_todo_item_path(@todo_list, @todo_item) }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/:todo_list_id/todo_items/:id
def destroy
  
  @todo_item.destroy
  respond_to do |format|
    format.html { redirect_to todo_list_path(@todo_list), notice: "Item excluído com sucesso." }
    format.json { head :no_content }
  end
end

  private

    def set_todo_list
      @todo_list = TodoList.find(params[:todo_list_id])
    end

    def set_todo_item
      @todo_item = @todo_list.todo_items.find(params[:id])
    end

    def todo_item_params
      params.require(:todo_item).permit(:todo_list_id, :text, :completed)
    end
end
