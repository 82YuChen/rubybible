class EventAttendeesController < ApplicationController

    before_action :find_event

  def index
    @attendees = @event.attendees
  end

  def show
    @attendee = @event.attendees.find(params[:id])
  end

  def new
    @attendee = @event.attendees.build
  end

  def create
    @attendee = @event.attendees.build(params_attendee)
    if @attendee.save
      redirect_to event_attendees_path, notice: "建立互動者"
    else
      render :new
    end
  end

  def edit
    @attendee = @event.attendees.find(params[:id])
  end

  def update
    @attendee = @event.attendees.build(params[:id])
    if @attendee.update(params_attendee)
      redirect_to event_attendees_path, notice: "更新資料完成"
    else
      render :edit
    end

  end

  def destroy
    @attendee = @event.attendees.build(params[:id])
    @attendee.destroy
    redirect_to event_attendees_path, notice: "刪除資料"
  end

  private
  def params_attendee
    params.require(:attendee).permit(:name)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end
end
