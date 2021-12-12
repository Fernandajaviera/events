class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
    3.times {@group.concerts.build} 
  end

  def create
    @group = Group.new(group_params)
    if @group.save
     redirect_to group_path(@group)
    else
     render ‘new’
    end
  end

  def show
    @group = Group.find params[:id]
  end

  def edit
    @group = Group.find params[:id]
  end

  def update
    @group = Group.find params[:id]
    respond_to do |format|
      if @group.update_attributes(group_params)
        format.html { redirect_to group_path(@group), notice: 'Group was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @group = Group.find params[:id]
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
    end
  end

  private
  def group_params
    params.require(:group).permit(:nombre, :participantes, :fecha_debut, :personalidad, concerts_attributes: [:fecha, :asistentes, :duracion, :_destroy])
  end
end
