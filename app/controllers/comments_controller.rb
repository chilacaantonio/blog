class CommentsController < ApplicationController
def create
@article = Article.find(params[:article_id])  #buscamos primero el articulo
@comment = @article.comments.create(parametros_comen)
redirect_to article_path(@article)
end

def destroy
@article = Article.find(params[:article_id])
@comment = @article.comments.find(params[:id])
@comment.destroy
redirect_to article_path(@article)
end

private
def parametros_comen
params.require(:comment).permit(:commenter, :body)
end

end
