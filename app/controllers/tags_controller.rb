class TagsController < ApplicationController

def show_tags
  @tags = Tag.all
  respond_to do |format|
    format.json { render json: @tags.map(&:attributes) }
  end
end
  
  def tags
     @tags = Product.all_tag_counts.(:conditions => ["#{ActsAsTaggableOn::Tag.table_name}.name LIKE ?", "%#{params[:q]}%"])
       respond_to do |format|
         format.json { render :json => @tags.collect{|t| {:id => t.name, :name => t.name } } }
       end
   end
 
end
