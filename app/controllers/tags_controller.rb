class TagsController < ApplicationController

def show_tags
  @tags = Tag.all
  respond_to do |format|
    format.json { render json: @tags.map(&:attributes) }
  end
end
  
  def tags
        @tags = Tag.tag_counts.where("tags.name LIKE ?", "%#{params[:q]}%")
     
        respond_to do |format|
          format.json { render :json => @tags.map(&:attributes) }
        end
        
      end
 
end
