class ArticlesController < ApplicationController
    require 'prawn'
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

    def new 
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
        @search = params["search"]
        if @search.present?
            @title = @search["title"] #:title in input
            @articles = Article.where("title LIKE ?", "%#{@title}%") #title in db

      #  @articles = Article.text_search(params[:search]).page(param[:page]).per_page(3)
        end
    end
     
    def show
        @article = Article.find(params[:id])
        @comment = @article.comments.build #show data edit comment
        respond_to do |format|
            format.html
            format.pdf do
                generate_pdf
            end
        end
    end
    
    def create
        @article = Article.new(article_params)
    
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        @article = Article.find(params[:id])
       
        if @article.update(article_params)
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
    
    private
        def article_params
            params.require(:article).permit(:title, :text)
        end

        def generate_pdf
            pdf = Prawn::Document.new
            pdf.text "#{@article.title}", size: 30, style: :bold
            pdf.text "#{@article.text}"
            send_data pdf.render, filename: "Article_#{@article.title}.pdf",
                                type: "application/pdf", disposition: "inline"
        end
end