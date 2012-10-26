class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  def index
    if params[:tag]
      @products = Product.tagged_with(params[:tag])
      
    else
      @products = Product.all
      @tags = Tag.where("name like ?", "%#{params[:q]}%")
      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products.map(&:attributes) }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.create
    @painting = Painting.new
    @paintings = Painting.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @paintings = @product.paintings.all
    @tags = @product.tags.all
    
      respond_to do |format|
          format.html 
          format.json 
          format.js { render :action => 'edit' }
      end
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.products.update_attributes(params[:product])
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])
    #@product = Product.tagged_with(params[:tag_list])
     respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
  
=begin 
 def tags
     @tags = Product.tag_counts.where("tags.name LIKE ?", "%#{params[:q]}%")
     results = @tags.map(&:attributes)
     
          respond_to do |format|
            format.json { render :json => @tags.map(&:attributes) }
          end
  end
=end
   def tags
    query = params[:q]
    if query[-1,1] == " "
       query = query.gsub(" ", "")
       Tag.find_or_create_by_name(query)
    end
    @tags = ActsAsTaggableOn::Tag.all
    @tags = @tags.select { |v| v.name =~ /#{query}/i }
       respond_to do |format|
          format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name }}}
       end
    end   
end
