class ListsController < ApplicationController
  before_action :authenticate_user!, onyl: [:edit, :update, :new, :create, :show]
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new    
  end

  def edit
    @list = List.find(params[:id])
  end

  def create 
    @list = List.new(list_params)
    @list.event_id = params[:event_id]
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'list was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    @list = List.find(params[:id])
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'list was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :description, :event_id)  
  end
end
