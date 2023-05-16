class Companies::SynthsController < ApplicationController
  def index 
    @company = Company.find(params[:company_id])
    @synths = @company.synths.order(:name) 
  end

  def new
    @company = Company.find(params[:id])
  end

  def create 
    company = Company.find(params[:id])
    company.synths.create!(synth_params)
    redirect_to "/companies/#{company.id}/synths"
  end



  private 
  def synth_params
    params.permit(:name, :polyphony, :number_of_voices, :production_years)
  end
end