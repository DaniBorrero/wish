class ItemsController < ApplicationController
  before_action :authenticate_user!, onyl: [:edit, :update, :new, :create, :show]
  def index
    @items = Item.all
  end

  def show      
      @item = Item.find(params[:id])   
  end

  def new
    @item = Item.new    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def create 
    @item = Item.new(item_params)
    @item.list_id = params[:list_id]
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :list_id)
  end
end
