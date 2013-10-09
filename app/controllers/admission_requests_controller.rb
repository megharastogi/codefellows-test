class AdmissionRequestsController < ApplicationController
  before_filter :check_logged_in_user, except: [:index, :delete_user]
  before_action :set_admission_request, only: [:show, :edit, :update, :destroy]

  # GET /admission_requests
  # GET /admission_requests.json
  def index
    @users = User.all
    @admission_requests = AdmissionRequest.all
    #@admission_requests = AdmissionRequest.where(:user_id => current_user.id)
  end

  # GET /admission_requests/1
  # GET /admission_requests/1.json
  def show
    if @admission_request.user_id != current_user.id
      redirect_to root_path
    end
  end

  # GET /admission_requests/new
  def new
    if current_user.admission_request
      redirect_to root_path
    else
      @admission_request = AdmissionRequest.new
    end
  end

  # GET /admission_requests/1/edit
  def edit
  end

  # POST /admission_requests
  # POST /admission_requests.json
  def create
    @admission_request = AdmissionRequest.new(admission_request_params)
    @admission_request.user_id = current_user.id
    respond_to do |format|
      if @admission_request.save
        format.html { redirect_to @admission_request, notice: 'Admission request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admission_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @admission_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admission_requests/1
  # PATCH/PUT /admission_requests/1.json
  def update
    respond_to do |format|
      if @admission_request.update(admission_request_params)
        format.html { redirect_to @admission_request, notice: 'Admission request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admission_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admission_requests/1
  # DELETE /admission_requests/1.json
  def destroy
    @admission_request.destroy
    respond_to do |format|
      format.html { redirect_to admission_requests_url }
      format.json { head :no_content }
    end
  end

  # Ability for admin to delete a user
  def delete_user
    user_id = params[:format]
    User.find(user_id).destroy
    redirect_to user_sessions_path
  end


  private

    def check_logged_in_user
      if !current_user
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_admission_request
      if current_user
        @admission_request = current_user.admission_request
      else
        @admission_request = AdmissionRequest.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admission_request_params
      params.require(:admission_request).permit(:user_id, :why_join, :previous_programming_exp, :best_thing_ever, :find_about_cf, :phone_number,{:offering_ids => []})
    end
end
