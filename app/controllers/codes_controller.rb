class CodesController < ApplicationController

  before_filter :fetch_code, :only => [:show, :update, :edit]
 
  def new
    @code = Code.new :snippet => params[:snippet] 
  end

  def create
    @code = Code.create! params[:code]
    if params[:copy]
      redirect_to edit_code_path(@code)
    else
      @code.queue
      redirect_to code_path(@code)
    end
  end

  def index
    @codes = Code.find(:all)
  end

  def show
  end

  def update
    @code.save_from_params(params['code'])
    redirect_to code_path(@code)
  end

  def edit
  end

  protected

  def fetch_code
    @code = Code.find(params[:id])
  end

end
