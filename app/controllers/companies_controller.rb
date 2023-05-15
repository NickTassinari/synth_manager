class CompaniesController < ApplicationController

  def index
    @companies = Company.all 
  end

  
  def new
    @company = Company.new 
  end
  
  def create 
    company = Company.create!(company_params)

    redirect_to '/companies'
  end

  def edit 
    @company = Company.find(params[:id])
  end

  def update 
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to '/companies'
  end

  def show 
    @company = Company.find(params[:id])
  end

  private 
  def company_params
    params.permit(:name, :country_of_origin, :active, :years_in_operation)
  end
end