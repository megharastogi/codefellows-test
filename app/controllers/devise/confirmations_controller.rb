class Devise::ConfirmationsController < DeviseController
  # GET /resource/confirmation/new
  def new
    self.resource = resource_class.new
  end

  # POST /resource/confirmation
  def create
    self.resource = resource_class.send_confirmation_instructions(resource_params)

    if successfully_sent?(resource)
      respond_with({}, :location => after_resending_confirmation_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/confirmation?confirmation_token=abcdef
  def show
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    if resource.errors.empty?
      respond_to do |format|
        format.html { 
          set_flash_message(:notice, :confirmed) if is_navigational_format?
          respond_with_navigational(resource){ redirect_to after_confirmation_path_for(resource_name, resource) }
        }
        format.json{

           render :json => {:status => 201, :success=> true }
        }
      end
    else

      respond_to do |format|
        format.html { 
          respond_with_navigational(resource.errors, :status => :unprocessable_entity){ render :new }
        }
        format.json{
          render :json => {:status => 422, :success=> false }
        }
      end
    end
  end

  protected

    # The path used after resending confirmation instructions.
    def after_resending_confirmation_instructions_path_for(resource_name)
      new_session_path(resource_name) if is_navigational_format?
    end

    # The path used after confirmation.
    def after_confirmation_path_for(resource_name, resource)
      if signed_in?
        signed_in_root_path(resource)
      else
        new_session_path(resource_name)
      end
    end
end