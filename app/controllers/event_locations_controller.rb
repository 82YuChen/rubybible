class EventLocationsController < ApplicationController

  before_action :find_event
  def show
    @location = @event.location
  end

  def new 
    @location = @event.build_location
  end

  def create
    @location = @event.build_location(params_location)
    if @location.save
      redirect_to event_location_url(@event), notice: 新增成功
    else
      render :new
    end
  end

  def edit
    @location = @event.location
  end

  def update
    @location = @event.location
    if @location.update(params_location)
      redirect_to event_location_url(@event), notice: 更新成功
    else
      render :edit
    end
  end

  def destroy
    @location = @event.location
    @location.destroy
    redirect_to event_location_url(@event), notice: 已刪除
  end

  private
  def params_location
    prams.require(:location).permit(:name)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
