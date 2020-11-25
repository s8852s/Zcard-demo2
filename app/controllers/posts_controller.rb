class PostsController < ApplicationController

  def show
    # @board = Board.find(params[:board_id])
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @board = Board.find(params[:board_id])
  end

  def create
    @board = Board.find(params[:board_id])
    @post = current_user.posts.new(params_post)
    @post.board = @board
    if @post.save
      redirect_to @board, notice: "新增文章成功" 
    else
      render :new
    end
  end

  def edit
    # @board = Board.find(params[:board_id])
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(params_post)
      redirect_to @post, notice: "文章更新成功"
    else
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy if @post
    redirect_to @post, notice: "文章刪除成功"
  end

  private
  def params_post
    params.require(:post).permit(:title, :content)
  end

end