class CommentsController < ApplicationController

  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to request.referer, notice: 'コメントを編集しました。' }
        format.json { render :index }
      #else
        #format.html { render :edit }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    # @blog = Blog.find(params[:blog_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js { render :edit, local: {comment: @comment} }
    end
  end

  def destroy
   @comment = Comment.find(params[:id])
   @comment.destroy
    flash.now[:notice] = 'コメントを削除しました。'
   respond_to do |format|
    format.js { render :index }
   end
  end

  private
    # ストロングパラメーター
    def comment_params
      params.require(:comment).permit(:blog_id, :content, :title)
    end
  end
