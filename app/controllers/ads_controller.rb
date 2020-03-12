class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]

  def index
    @ads = Ad.all
  end

  def user_ads
    @ads = current_user.ads.all if user_signed_in? 
  end

  def new
    @ad = current_user.ads.build
    # @ad.images.build
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def create
    # @ad = current_user.ads.build(ad_params.except(:images))
    @ad = current_user.ads.build(ad_params)    
    # @ad = current_user.ads.create!(ad_params)

    if @ad.save
      redirect_to @ad
    else
      render 'new'
    end
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])

    if @ad.update(ad_params)
      redirect_to @ad
    else
      render 'edit'
    end
  end

  def destroy  
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :body, :price, images: [])
  end

end
