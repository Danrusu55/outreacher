class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update, :destroy, :building, :built]
  before_action :authenticate_user!

  def index
    @campaigns = Campaign.all.order("created_at DESC")
  end

  def new
    @campaign = current_user.campaigns.build
  end

  def create
    @campaign = current_user.campaigns.build(campaign_params)
    if @campaign.save
      flash[:success] = "Successfully created campaign"
      redirect_to campaign_path(@campaign)
    else
      flash[:error] = @campaign.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def building
  end

  def built
  end

  def edit
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path
    else
      flash[:error] = @campaign.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, :website)
    end
    def find_campaign
      @campaign = Campaign.find(params[:id])
    end
end
