module ViewingsHelper
    def viewing_date(viewing)
        viewing.date.strftime("Viewed on %B %e, %Y")
    end
end