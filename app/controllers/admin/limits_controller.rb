class Admin::LimitsController < ApplicationController

  #アクセス制限
  before_action :authenticate_admin!

  #コメント投稿時の制限ワード機能

  def new
    @limit = Limit.new
  end

  def index
    @limits = Limit.all
    @limit = Limit.new
  end

  def create
    @limit = Limit.new(limit_params)
    @limit.admin_id = 1
    if @limit.save
      redirect_to request.referer
    else
      render "new"
    end
  end

  def destroy
    @limit = Limit.find(params[:id]).destroy
    redirect_to request.referer
  end


  private

  def limit_params
    params.require(:limit).permit(:word)
  end

end
