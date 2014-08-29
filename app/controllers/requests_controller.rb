class RequestsController < ApplicationController
  before_action :set_request, only: :show

  # GET /requests
  # GET /requests.json
  def index
    @requests = Request.where(trap_id: params[:trap_id])
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # POST /requests
  # POST /requests.json
  def create
    data = Hash[request.env.map{ |k, v| [k, v.kind_of?(StringIO) ? v.string : v.to_s] }]
    @request = Request.new(trap_id: params[:trap_id], data: data)

    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { redirect_to @request, notice: 'Request wasn\'t created.' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end
end
