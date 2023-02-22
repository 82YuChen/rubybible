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

  def latest
    @events = Event.order("id DESC").limit(3)
  end

  def bulk_delete
    Event.destroy_all
    redirect_to root_path
  end

  def bulk_update
    ids = Array(params[:ids])
    events = ids.map{ |i| Event.find_by_id(i) }.compact

    if params[:comment] == "Publish"
      events.each{ |e| e.update( :status => "published" ) }
    elsif params[:comment] == "Delete"
      events.each { |e| e.destroy}
    end
    redirect_to root_path
  end

  private
  def find_event
    @event = Event.find(params[:id])
  end

  def params_event
    params.require(:event).permit(:name, :description, :capcity, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [])
  end
end
