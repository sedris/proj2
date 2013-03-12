class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  def index
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    # if this is the current user's shop, allow for editing
    if params.has_key?(:shopkeeper_id)
      @shopkeeper = Shopkeeper.find_by_id(params[:shopkeeper_id])
    else
      @shopkeeper = Shopkeeper.find_by_id(session[:user_id])
    end

    # if no shopkeeper was found
    if !@shopkeeper
      #redirect_to root_url :notice => "shopkeeper not found" and return
      @shopkeeper = Shopkeeper.all.last
      @items = @shopkeeper.items
    else
      @items = @shopkeeper.items
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  # Shows information for this item
  def show
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = User.find(session[:user_id]).items.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  def edit
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = Item.find(params[:id])
  end

  # POST /items
  # POST /items.json
  def create
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = User.find(session[:user_id]).items.new(params[:item])

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end

  def add_to_cart
    if !current_user
      redirect_to signup_path, :notice => "Must be logged in to view" and return
    end
    
    if !current_user.cart
      current_user.cart = Cart.create()
    end
    current_user.cart.items.push(Item.find(params[:item]))
    redirect_to items_path(shopkeeper_id: params[:shopkeeper_id])
  end
end