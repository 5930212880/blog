class Pdf < Prawn::Document
    def initialize(article)
        super()
        @article = article
        article_name
    end

    def article_name
        text "sss"
    end

end