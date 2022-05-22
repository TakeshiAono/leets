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
    byebug
    set_post
    # respond_to do |format|
    end
      if @post.update(post_params)
        byebug
        render "show", notice: '更新完了'#edit_post_path(@post[:id])#, 
        # format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        # format.json { render :show, status: :ok, location: @post }
      else
        byebug
        render "edit", notice: '更新エラー'#edit_post_path(@post[:id])#

        # format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    # end
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
