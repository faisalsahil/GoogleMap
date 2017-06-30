class PinsController < ApplicationController
  skip_before_action  :verify_authenticity_token
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  # GET /pins
  # GET /pins.json
  def index

    @pins = Pin.all

    respond_to do |format|
        format.html {}
      format.json { return render json: @pins }
    end
  end



  # GET /pins/1
  # GET /pins/1.json
  def show

  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create

    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { return render json: true }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy

    # @pin.destroy
    # respond_to do |format|
    #   format.html { render :destroy }
    #   format.json {return render json: @pins}
    # end
    @pin = Pin.find(params[:pin_lat])
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Task Successfully Removed, Good job!"}
      format.json { render root_path, notice: "Task Successfully Removed, Good job!" }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:name, :address, :lat, :lng)
    end
end
