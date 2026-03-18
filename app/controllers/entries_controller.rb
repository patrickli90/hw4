class EntriesController < ApplicationController
  def new
    if current_user.nil?
      redirect_to login_path
    end
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry.user = current_user
    if @entry.save
      @entry.image.attach(params["image"]) if params["image"].present?
      redirect_to "/places/#{@entry["place_id"]}"
    else
      redirect_to "/entries/new?place_id=#{params["place_id"]}"
    end
  end
end