class SynthsController < ApplicationController

  def index 
   @synths = Synth.all 
  end

  def show
    @synth = Synth.find(params[:id])
  end

  def edit 
    @synth = Synth.find(params[:id])
  end

  def update 
    synth = Synth.find(params[:id])
    synth.update(synth_params)
    redirect_to "/synths/#{synth.id}"
  end

  def destroy 
    synth = Synth.find(params[:id])
    synth.destroy 
    redirect_to "/synths"
  end

  private
  def synth_params
    params.permit(:name, :polyphony, :number_of_voices, :production_years)
  end
end