class DiariesController < ApplicationController
  before_action :set_statuses
  before_action :set_diary, only: [:show, :edit, :update, :destroy]
  before_action :all_diaries, only: [:index, :create, :destroy, :update]
  respond_to :html, :js 
  
  def all_diaries
     if (user_signed_in?) 
       if (params[:q].present? && !params[:q].blank?)
          @diaries = Diary.where(user_id: current_user.id).where(["keywords LIKE :tag", {:tag => params[:q]}])
       else
          @diaries = Diary.where(user_id: current_user.id)
       end
     else
       if (params[:q].present? && !params[:q].blank?)
          @diaries = Diary.where(status: 0).where(["keywords LIKE :tag", {:tag => params[:q]}])
       else
          @diaries = Diary.where(status: 0)
       end
     end
  end
  
  # GET /diaries
  # GET /diaries.json
  def index
  end

  # GET /diaries/1
  # GET /diaries/1.json
  def show
  end

  # GET /diaries/new
  def new
    @diary = Diary.new
  end

  # GET /diaries/1/edit
  def edit
  end

  # POST /diaries
  # POST /diaries.json
  def create
    @diary = Diary.new(diary_params)
    user = User.find(diary_params[:user_id])
    @diary.build_user(:id => user.id)

    @diary.save!
    @current_diary = @diary
  end
  
  def update
    @diary.update!(diary_params)
  end

  # PATCH/PUT /diaries/1
  # PATCH/PUT /diaries/1.json
  # def update
  #   respond_to do |format|
  #     if @diary.update(diary_params)
  #       format.html { redirect_to @diary, notice: 'Diary was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @diary }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @diary.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  
  def destroy
    @diary.destroy!
  end

  # DELETE /diaries/1
  # DELETE /diaries/1.json
  # def destroy
  #   @diary.destroy
  #   respond_to do |format|
  #     format.html { redirect_to diaries_url, notice: 'Diary was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diary
      @diary = Diary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diary_params
      params.require(:diary).permit(:diaryname, :published, :content, :status, :keywords, :user_id)
    end
    
    def set_statuses
     @statuses = Diary.statuses
    end
end
