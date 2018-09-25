class ContactMailer < ApplicationMailer
    def contact_mail(movie)
        @movie = movie
        
        mail to: @movie.user.email, subject: "投稿完了メール"
    end
end
