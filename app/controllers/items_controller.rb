#require_relative 'scrap'
require 'nokogiri'
require 'open-uri'
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
    url, price, name =  scrap_page(@item.name)
    @item.url = url
    @item.price = price
    @item.name = name
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
  #
  def scrap_page(url)
    image_url = ''
    price = 5.2
    name = ''
    html = open(url).read
    doc = Nokogiri::HTML(html)
    doc.search('img.jsx-2487856160').map do |element|
      image_url = element.attr('src')
    end
    
    doc.search('.copy12').map do |element|
      price = element.inner_text.tr('$ .','').to_f
    end
  
    doc.search('.product-name').map do |element|
      name =  element.inner_text
    end
    return image_url, price, name
  end
end
