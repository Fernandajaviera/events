class ConcertsController < ApplicationController
  before_action :find_group

  def index
    @concerts = @group.concerts
  end

  def new
    @concert = Concert.new
  end

  def create
    @concert = Concert.new(concert_params)
    @concert.group = @group
    respond_to do |format|
      if @concert.save
        format.html { redirect_to group_concert_path(@group, @concert), notice: 'concert was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @concert = Concert.find(params[:id])
  end

  def edit
    @concert = Concert.find params[:id]
  end

  def update
    @concert = Concert.find params[:id]
    respond_to do |format|
      if @concert.update(concert_params.merge(group: @group))
        format.html { redirect_to group_concert_path(@group, @concert), notice: 'Concert was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @concert = Concert.find params[:id]
    @concert.destroy
    respond_to do |format|
      format.html { redirect_to group_concerts_url, notice: 'Concert was successfully destroyed.' }
    end
  end

  private
  def concert_params
    params.require(:concert).permit(:fecha, :asistentes, :duracion)
  end

  def find_group
    @group = Group.find params[:group_id]
  end
end
