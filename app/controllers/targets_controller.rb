class TargetsController < ApplicationController
  before_action :find_campaign
  before_action :find_target, only: [:edit, :update, :destroy, :index]
  before_action :authenticate_user!

  def index
    @target = @campaign.targets.all.order("created_at DESC")
  end

  def create
    @target = @campaign.targets.create(targets_params)
    @target.user_id = current_user.id
    if @target.save
      flash[:success] = "Successfully created target"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @target.errors.full_messages
      redirect_to campaign_path(@campaign)
    end

  end

  def edit
  end

  def update
    if @target.update(targets_params)
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @target.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @target.destroy
    redirect_to campaign_path(@campaign)
  end

  private

  def targets_params
    params.require(:target).permit(:name,:status,:website,:blog,:facebook,:twitter,:instagram,:lastengaged)
  end

  def find_campaign
    @campaign = Campaign.find(params[:campaign_id])
  end

  def find_target
    @target = @campaign.targets.find(params[:id])
  end
end
