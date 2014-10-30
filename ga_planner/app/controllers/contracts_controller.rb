class ContractsController < ApplicationController
  load_and_authorize_resource
  def index
    @contracts = Contract.all
  end

  def show
    @contract = Contract.find(params[:id])
  end

  def new
    @contract = Contract.new
    @cohort = Cohort.find(params[:cohort_id])
  end

  def create
    @cohort = Cohort.find(params[:cohort_id])
    #repeatition L13
    @contract = @cohort.contracts.new(params[:contract])
    @contract.user = current_user
    if @contract.save
      redirect_to @cohort, notice: "Successfully created contract."
    else
      render :action => 'new'
    end
  end

  def edit
    @contract = Contract.find(params[:id])
  end

  def update
    @contract = Contract.find(params[:id])
    if @contract.update_attributes(params[:contract])
      redirect_to @contract, :notice  => "Successfully updated contract."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy
    redirect_to contracts_url, :notice => "Successfully destroyed contract."
  end
end