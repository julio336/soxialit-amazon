class FeedbacksController < ApplicationController
  
  def index
    @feedback = Feedback.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feedback }
    end
  end

 
  def create
    @feedback = current_user.feedbacks.build(params[:feedback])

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to root_path, notice: 'Gracias por tu retroalimentacion.' }
      else
        format.html { render action: "new" }
      end
    end
  end

 
end
