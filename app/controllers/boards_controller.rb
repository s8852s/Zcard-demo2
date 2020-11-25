class BoardsController < ApplicationController
	before_action :find_board, only: [:show, :edit, :update, :destroy]

	def index
	  @boards = Board.all
	end

	def show
		@posts = @board.posts.order(id: :desc) 
	end

	def new
	  @board = Board.new
	end

	def create
		@board = Board.new(params_board)
		
		if @board.save
		  redirect_to root_path, notice: "新增看板成功"
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @board.update(params_board)
		  redirect_to root_path, notice: "修改看板標題成功"
		else
			render :edit
		end
	end

	def destroy
		@board.destroy if @board
		redirect_to root_path, notice: "刪除看板成功"
	end

	
	private
	def find_board
		@board = Board.find_by(id: params[:id])
	end
	def params_board
	  params.require(:board).permit(:title)
	end
end
