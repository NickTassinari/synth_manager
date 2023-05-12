class Companies::SynthsController < ApplicationController
  def index 
    @company = Company.find(params[:company_id])
    @synths = @company.synths 
  end
end