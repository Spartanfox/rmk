class FeedbacksController < CrudController

  def index
    redirect_to action: :new
  end

  def create
    @feedback = Feedback.new(permitted_params[:permitted_params])
    if [@feedback.valid?, verify_recaptcha(model: @feedback)].all?
      @feedback.save
      FeedbackMailer.delay_for(10.seconds).feedback_created(@feedback.id)
      redirect_to thanks_feedbacks_path
    else
      render :new
    end
  end

  private


  def permitted_params
    params.permit(feedback: [:image, :image_upload, :room_number, :positive_aspects, :could_do_better, :feel_well_informed, :please_comment, :aware_of_rights, :read_it_in_booklet, :read_it_in_brochure, :read_it_in_directory, :understand_rights, :other_comments, :first_name, :last_name, :email, :address, :telephone, :involved_in_forum, :ward_or_department, :wish_to_be_contacted])
  end


end
