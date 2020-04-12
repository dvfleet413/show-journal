module ViewingsHelper
    def viewing_date(viewing)
        viewing.date.strftime("Viewed on %B %e, %Y")
    end

    def viewing_location(viewing)
        viewing.location
    end
end