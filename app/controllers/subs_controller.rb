class SubsController < ApplicationController

  before_action :require_logged_in, only: [:new, :create]
  before_action :require_moderator, only: [:edit, :update]

  def require_moderator
    sub_moderator = Sub.find(params[:id]).moderator
    redirect_to subs_url unless current_user == moderator
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator = current_user

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = Sub.find(params[:id])

    if @sub.nil?
      flash[:errors] = "Invalid Sub"
      render :edit
    elsif @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  # def destroy
  # end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
