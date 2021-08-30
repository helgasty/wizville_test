class LinksController < ApplicationController

  before_action :set_link, only: [:index, :create, :destroy]
  before_action :get_links, only: [:list]

  def index
  end

  def create
    @link.update(link_params)
    begin @link.save!
      flash[:success] = t('link.validate.create.success')
    rescue
      flash[:danger] = t('link.validate.create.error')
    end

    redirect_to root_path
  end

  def list
  end

  def show
    begin
      link = Link.find_by_identifier(params[:identifier])
      Stat.create(link_id: link.id)
      redirect_to link.base_url
    rescue
      flash[:danger] = t('link.show.error')
      redirect_to root_path
    end
  end

  def destroy
    begin @link.destroy
      flash[:success] = t('link.destroy.success')
    rescue
      flash[:danger] = t('link.destroy.error')
    end

    redirect_to list_path
  end

  private
  def link_params
    params.require(:link).permit(:base_url)
  end

  def set_link
    @link = (params[:id].present?) ? Link.find(params[:id]) : Link.new
  end

  def get_links
    @links = Link.all
  end
end
