class SynthsController < ApplicationController

  def index 
   @synths = Synth.all 
  end
end