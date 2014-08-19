class BidsController < ApplicationController
  before_action :set_bid, only: [:show, :edit, :update, :destroy]

  def index
    @bids = Bid.all
  end

  def show
  end

  def new
    @bid = current_user.bids.build
  end

  def edit
  end

  def create
    @bid = current_user.bids.build(bid_params)
      if @bid.save
        redirect_to @bid, notice: 'Bid was successfully created.' 
      else
        render :new
      end
  end

  def update
      if @bid.update(bid_params)
        redirect_to @bid, notice: 'Bid was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @bid.destroy
      redirect_to bids_url, notice: 'Bid was successfully destroyed.'
  end

  private
    def set_bid
      @bid = Bid.find(params[:id])
    end

    def correct_user
      @bid = current_user.bids.find_by(id: params[:id])
      redirect_to bids_path, notice: "Not authorized to edit this bid" if @bid.nil?
    end

    def bid_params
      params.require(:bid).permit(:amount)
    end
end
