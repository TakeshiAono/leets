class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    set_post
  end
  
  def new
    @post = Post.new
  end

  def edit
    set_post    

  end

  def create
    @post = Post.new(post_params)
    if params[:back]
      render new_post_path
    else
        if @post.save
          redirect_to posts_path, notice: "投稿しました"
        else
          render new_post_path, notice: "投稿できません"          
        end
    end
  end

  def update
    set_post
      if @post.update(post_params)
        @notice = "更新完了"
        render "show"
      else
        @notice = "更新エラー"
        render "edit"
      end
  end

  def destroy
    set_post
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def confirm
    @post = Post.new(post_params)
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content)
  end
end
