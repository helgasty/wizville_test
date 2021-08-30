class StatsController < ApplicationController
  def show
    @custom_url = Link.find(params[:id]).short
    @stats = Stat.where(link_id: params[:id])
  end
end
