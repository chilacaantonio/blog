class ArticlesController < ApplicationController
http_basic_authenticate_with name: "antonio", password: "12345", except: [:index,:show]

def new
 @article = Article.new
end

def create
@article = Article.new(parametros_articulo)  #crea el nuevo articulo Aritcle nombre del modelo
if @article.save  #variable que indicar si fue guardado o no booleana
	redirect_to @article
else
	render 'new'
end

end

def show
@article = Article.find(params[:id]) #find encuentra el articulo que nos interesa
end

def edit
@article = Article.find(params[:id])
end

def update
@article = Article.find(params[:id])
if @article.update(parametros_articulo)
	redirect_to @article
else
	render 'edit'
end
end

def destroy
@article = Article.find(params[:id])
@article.destroy
redirect_to articles_path
end


def index
@articles = Article.all  #busca todos los articulos y los guarda en articles
end

private
def parametros_articulo
params.require(:article).permit(:title, :text) #parametros requeridos
end

end
