class SynthsController < ApplicationController

  def index 
   @synths = Synth.all 
  end

  def show
    @synth = Synth.find(params[:id])
  end
end