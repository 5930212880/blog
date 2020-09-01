class CommentsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def create
      @article = Article.find(params[:article_id])
      @comment = @article.comments.create(comment_params)
      redirect_to article_path(@article)
    end

    # GET /articles/:id/comments/:id/edit
    def edit
      @comment = Comment.find(params[:id])
      @article = Article.find(params[:article_id])
    end

    def destroy
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      @comment.destroy
      redirect_to article_path(@article)
    end


    def update
      @article = Article.find(params[:article_id])
      @comment = @article.comments.find(params[:id])
      if @comment.update(comment_params)
        redirect_to article_path(@article)
      else
        render 'edit'
      end 
    end
    
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end