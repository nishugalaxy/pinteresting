class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # All respond_to ..... commands are not there in the video.
  # respond_to :html

  def index
   # @pins = Pin.all.order ("created_at DESC").paginate(:page => params[:page], :per_page =>8)
    @pins = Pin.paginate(:per_page => 5, :page => params[:page]).order('created_at DESC')
    # you can also add the limiting code to limit the number of pins viewed in the first page
     # respond_with(@pins)
  end

  def show
     # respond_with(@pin)
  end

  def new
    @pin = current_user.pins.build
     # respond_with(@pin)
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created'
    # respond_with(@pin)
  else
    render action: 'new'
  end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated'
    else 
      render action: 'edit'
     # respond_with(@pin)
  end
end 

  def destroy
    @pin.destroy
         # respond_with(@pin)
         redirect_to pins_url
  end

  private
    def set_pin
      @pin = Pin.find_by(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorised to edit this pin" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end
