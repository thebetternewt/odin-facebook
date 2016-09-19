class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post created!"
      # redirect_to current_user
      respond_to do |format|
        format.html { redirect_to current_user }
        format.js
      end
    else
      render "shared/_post_form"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

end
