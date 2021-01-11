class DesksController < ApplicationController
    before_action :set_desk, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @desks = Desk.order(id: :desc).page(params[:page]).per(15)
    end
    
    def show
    end
    
    def new
        @desk = Desk.new
    end
    
    def create
        @desk = Desk.new(desk_params)
        
        if @desk.save
            flash[:success] = "Deskは正常に投稿されました"
            redirect_to @desk
        else
            flash[:danger] = "Deskは投稿されませんでした"
            render :new
        end
    end
    
    def edit
    end
    
    def update
        if @desk.update(desk_params)
            flash[:success] = "Deskは正常に編集されました"
            redirect_to @desk
        else
            flash[:danger] = "Deskは編集されませんでした"
            render :edit
        end
    end
    
    def destroy
        @desk.destroy
        
        flash[:success] = "Deskは正常に削除されました"
        redirect_to desks_url
    end
    
    private
    
    def set_desk
        @desk = Desk.find(params[:id])
    end
    
    def desk_params
        params.require(:desk).permit(:content, :title)
    end
    
end
