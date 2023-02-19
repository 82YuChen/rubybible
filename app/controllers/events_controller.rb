class EventsController < ApplicationController
  
  before_action :find_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(params_event)
    if @event.save
      redirect_to root_path, notice: "新增成功"
    else
      render :new
    end
  end

  def show
    @page_title = @event.name
  end

  def edit
  end

  def update
    if @event.update(params_event)
      redirect_to root_path, notice: "新增成功"
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path, notice: "刪除成功"
  end

  private
  def find_event
    @event = Event.find(params[:id])
  end

  def params_event
    params.require(:event).permit(:name, :description, :capcity)
  end
end
