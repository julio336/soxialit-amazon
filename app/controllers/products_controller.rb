class ProductsController < ApplicationController
  # GET /products
  # GET /products.json
  
  def index
   if params[:tag]
       @products = Product.tagged_with(params[:tag])
   else
       @products = avoid_nil(Product.order('created_at DESC').page(params[:page]))
       @tags = Tag.where("name like ?", "%#{params[:q]}%")
   end
   respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products.map(&:attributes) }
      format.js
    end
  end
  
  def avoid_nil(products)
     items = []
     products.each do |product|
        if product.title.nil? && product.description.nil?
        else
           items << product
        end
      end 
      return items
  end
  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    id = @product.user_id
    @user = User.find(id)
    @products = @user.products.all(:order => 'RANDOM()', :limit => 4)
    
    #@items = avoid_nil(@user.products.all)
    #@products = @items.find(:order => 'rating ASC', :limit => 2)
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
      format.js
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = current_user.products.create
    @paintings = Painting.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit

  def edit
    @product = current_user.products.find(params[:id])
    @paintings = @product.paintings.all
    @tags = @product.tags.all
    
      respond_to do |format|
          format.html 
          format.json 
          format.js 
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
    @product = current_user.products.find(params[:id])
    #@product = Product.tagged_with(params[:tag_list])
     respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def paypal_checkout
         product = Product.find(params[:product_id])
         ppr = PayPal::Recurring.new(
          return_url: product_url(product),
          cancel_url: products_url,
          description: product.title,
          amount: product.total_price,
          currency: "MXN"
         )
         response = ppr.checkout
         if response.valid?
           redirect_to response.checkout_url
         else
           raise response.errors.inspect
        end
    end
    
  def envio_df 
   @product = Product.find(params[:id])
   @product.update_attributes(:shipping => params[:envio])
   @product.total_price = (@product.price + @product.shipping).to_i
   @product.save
 end
 
 def tallas
    @product = Product.find(params[:product_id])
 end
=begin
       logger.debug "parametro envio es: #{params[:envio]}\n\n\n\n\n\n"
       logger.debug "parametro envio es: #{@product.envio_df}\n\n\n\n\n\n"
       logger.debug "parametro envio es: #{@product.envio_int}\n\n\n\n\n\n"
       logger.debug "parametro envio es: #{params[:envio_df]}\n\n\n\n\n\n"
=end
  
  def comprar
     @product = Product.find(params[:product_id])
    
     user_cp = find_user_product(@product)
     current_user_cp = current_user.user_cp
    # logger.debug "#{user_cp}\n\n\n\n\n\n"
    # logger.debug "#{current_user_cp}\n\n\n\n\n\n"
     if @product.tipo_envio == "sobre"
        url = "http://rastreo2.estafeta.com:7001/Tarificador/admin/TarificadorAction.do?dispatch=doGetTarifas&cCodPosOri=#{user_cp}&cCodPosDes=#{current_user_cp}&cTipoEnvio=#{@product.tipo_envio}&cIdioma=Esp"
     else
        url = "http://rastreo2.estafeta.com:7001/Tarificador/admin/TarificadorAction.do?dispatch=doGetTarifas&cCodPosOri=#{user_cp}&cCodPosDes=#{current_user_cp}&cTipoEnvio=#{@product.tipo_envio}&cIdioma=Esp&nPeso=#{@product.peso}&nLargo=#{@product.largo}&nAncho=#{@product.ancho}&nAlto=#{@product.alto}"
     end
    # logger.debug "#{url}\n\n\n\n\n\n"
     require 'net/http'
     require 'rubygems'
     require 'nokogiri'
     require 'open-uri'
     
     doc = Nokogiri::HTML(open(url))
     @dias = []
     doc.css(':nth-child(6) .style5 strong , :nth-child(7) strong, :nth-child(8) strong').each do |node|
          @dias.push(node.text)
     end 
     logger.debug "#{@dias}\n\n\n\n\n\n"
      
     @tarifas = []
        doc.css(':nth-child(6) td:nth-child(8) , :nth-child(7) :nth-child(8), :nth-child(8) td:nth-child(8)').each do |node|
        @tarifas.push(node.text)
     end
    # logger.debug "#{@tarTer2}\n\n\n\n\n\n"
  end
  
  def envio
      @product = Product.find(params[:product_id])
   end
  
  def vote
      value = params[:type] == "up" ? 1 : -1
      @product = Product.find(params[:id])
      @product.add_or_update_evaluation(:votes, value, current_user)
      #redirect_to :back, notice: "Thank you for voting!"
      respond_to do |format|
        format.js
      end

  end
  def products_as_json(product)
     data = {
       "external_reference" => "ARTICLE-ID-#{product.id}",
       "items" => [
         {
           "id" => product.id,
           "title" => product.title,
           "description" => product.description,
           "quantity" => 1,
           "unit_price" => product.total_price.to_i,
           "currency_id" => "MEX",
           "picture_url" => "http://i1266.photobucket.com/albums/jj523/JulioAhuactzin/Safari3_zpsb24612a1.png"
         }
       ],
       "payer" => {
           "name"=> current_user.username,
           "surname"=> current_user.username,
           "email"=> current_user.email
         },
       "back_urls"=> {
         "pending"=> "https://www.site.com/pending",
         "success"=> "http://www.site.com/success",
         "failure"=> "http://www.site.com/failure"
       }
     }
     return data
    # logger.debug "#{json}\n\n\n\n\n\n"
  end

  # your_view.html.erb
  
  def mercadopago_checkout
      product = Product.find(params[:product_id])
      test = products_as_json(product)
     # logger.debug "#{test}\n\n\n\n\n\n"
      
      mp_data = product.mercadopago_url(test)
     # logger.debug "#{mp_data}\n\n\n\n\n\n"
      result = JSON.parse(mp_data.to_json)
     # logger.debug "#{result}\n\n\n\n\n\n"
      initpoint = result["init_point"]
     # logger.debug "#{initpoint}\n\n\n\n\n\n"
          redirect_to initpoint
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

    def find_user_product(product)
         id_user = product.user_id
         user = User.find(id_user)
         user.user_cp
    end    
    
end


