class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
  end

  # GET /schools/new
  def new
    @school = School.new

    schedule = {
        times: [
          { time: '01:00' }, { time: '02:00' },
          { time: '03:00' }, { time: '04:00' },
          { time: '05:00' }, { time: '06:00' },
          { time: '07:00' }, { time: '08:00' },
          { time: '09:00' }, { time: '10:00' },
          { time: '11:00' }, { time: '12:00' },
          { time: '13:00' }, { time: '14:00' },
          { time: '15:00' }, { time: '16:00' },
          { time: '17:00' }, { time: '18:00' },
          { time: '19:00' }, { time: '20:00' },
          { time: '21:00' }, { time: '22:00' },
          { time: '23:00' }, { time: '24:00' }
        ]
      }

    @schedule  = RecursiveOpenStruct.new(schedule, recurse_over_arrays: true)


    weekdays = {
      days: [
      {weekday: 'Sunday'}, {weekday: 'Monday'}
      ]
    }

    @weekdays = RecursiveOpenStruct.new(weekdays, recurse_over_arrays: true)
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search_school
    @school = School.find_by(slug:params[:school])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.require(:school).permit(:name, times: [], weekdays: [])
    end
end
