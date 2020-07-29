class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST articles/1/comments
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)

    if @comment.save
      redirect_to @article, notice: 'Comment was successfully created.'
    else
      render 'articles/show'
    end
  end

  # PATCH/PUT articles/1/comments/1
  def update
    if @comment.update(comment_params)
      redirect_to @comment.article, notice: 'Comment was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE articles/1/comments/1
  def destroy
    @comment.destroy
    redirect_to @comment.article, notice: 'Comment was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:text)
    end
end
