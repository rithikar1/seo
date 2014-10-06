class SnsController < ApplicationController
  # GET /sns
  # GET /sns.json

  helper_method :sort_column, :sort_direction

  def index
     
  @sns = Sn.search(params[:search])

  @sns = @sns.sort_by(&:"#{sort_column}")
  @sns = @sns.reverse if sort_direction == 'DESC'
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sns }
    end
  end

 
  # GET /sns/1
  # GET /sns/1.json
  def show
    @sn = Sn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sn }
    end
  end

  # GET /sns/new
  # GET /sns/new.json
  def new
    @sn = Sn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sn }
    end
  end

  # GET /sns/1/edit
  def edit
    @sn = Sn.find(params[:id])
  end

  # POST /sns
  # POST /sns.json
  def create
    @sn = Sn.new(params[:sn])

    respond_to do |format|
      if @sn.save
        format.html { redirect_to @sn, notice: 'Sn was successfully created.' }
        format.json { render json: @sn, status: :created, location: @sn }
      else
        format.html { render action: "new" }
        format.json { render json: @sn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sns/1
  # PUT /sns/1.json
  def update
    @sn = Sn.find(params[:id])

    respond_to do |format|
      if @sn.update_attributes(params[:sn])
        format.html { redirect_to @sn, notice: 'Sn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sns/1
  # DELETE /sns/1.json
  def destroy
    @sn = Sn.find(params[:id])
    @sn.destroy

    respond_to do |format|
      format.html { redirect_to sns_url }
      format.json { head :no_content }
    end
  end

  private
 

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end

  def sort_column
    Sn.column_names.include?(params[:sort]) ? params[:sort] : "p_name"
  end
  
end
